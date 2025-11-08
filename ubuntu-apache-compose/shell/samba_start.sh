#!/usr/bin/env bash
set -euo pipefail

# Credentials via env
SMB_USERNAME="${SMB_USERNAME:-wwwuser}"
SMB_PASSWORD="${SMB_PASSWORD:-}"
WRITER_GROUP="wwwshare"
SHARE_PATH="/srv/www/html"

if [[ -z "${SMB_PASSWORD}" ]]; then
  echo "ERROR: SMB_PASSWORD must be set" >&2
  exit 1
fi

# ALWAYS seed files from the image, overwriting the volume's contents on every start.
mkdir -p "${SHARE_PATH}"
if [ -d "/seed" ]; then
  # Copy all content from the build's /seed directory into the share path
  cp -a /seed/* "${SHARE_PATH}/" || true
fi

# Ensure ownership and ACLs
chown -R wwwsvc:wwwshare "${SHARE_PATH}"
chmod -R 2775 "${SHARE_PATH}"
setfacl -R -m g:${WRITER_GROUP}:rwx "${SHARE_PATH}" || true
setfacl -R -d -m g:${WRITER_GROUP}:rwx "${SHARE_PATH}" || true

# Write hardened smb.conf (SMB3 only + encryption required)
cat >/etc/samba/smb.conf <<'EOF'
[global]
  server role = standalone server
  workgroup = WORKGROUP
  security = user
  map to guest = never

  disable netbios = yes
  smb ports = 445

  server min protocol = SMB3
  server max protocol = SMB3
  smb encrypt = required

  load printers = no
  printing = bsd
  printcap name = /dev/null
  disable spoolss = yes

  vfs objects = acl_xattr
  map acl inherit = yes
  store dos attributes = yes

  log file = /var/log/samba/log.%m
  max log size = 1000

[wwwhtml]
  comment = Static web content share
  path = /srv/www/html
  browseable = yes
  read only = no
  writable = yes
  valid users = @wwwshare
  create mask = 0664
  directory mask = 2775
  force group = wwwshare
  inherit permissions = yes
  inherit acls = yes
  guest ok = no
EOF

# Ensure user and Samba account
usermod -a -G "${WRITER_GROUP}" "${SMB_USERNAME}" 2>/dev/null || true
echo "${SMB_USERNAME}:${SMB_PASSWORD}" | chpasswd || true
if ! pdbedit -L | grep -q "^${SMB_USERNAME}:"; then
  (echo "${SMB_PASSWORD}"; echo "${SMB_PASSWORD}") | smbpasswd -a "${SMB_USERNAME}" >/dev/null
fi
smbpasswd -e "${SMB_USERNAME}" >/dev/null

# Validate and run
testparm -s >/dev/null
exec /usr/sbin/smbd --foreground --no-process-group
