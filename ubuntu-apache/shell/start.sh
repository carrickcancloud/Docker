#!/bin/bash

# Get the container ID
CONTAINER_ID=$(hostname)

# Create the index.html file with injected information
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to LUIT</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a0f4b, #000000);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            overflow: hidden;
        }
        
        h1 {
            font-size: 8vw;
            color: #ff4081;
            animation: futuristicEffect 1.5s infinite alternate;
        }
        
        h2 {
            font-size: 5vw;
            color: #39ff14;
            animation: futuristicEffect 1.5s infinite alternate;
        }
        
        @keyframes futuristicEffect {
            0% { transform: scale(1); }
            100% { transform: scale(1.05); }
        }
        
        .button {
            margin-top: 30px;
            padding: 15px 30px;
            font-size: 2.5vw;
            color: #ffffff;
            background-color: #ff4081;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .button:hover {
            background-color: #d5006d;
        }
        
        .docker_metadata {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: left;
            color: #ffffff;
        }
        
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }
        
        .gallery img {
            width: 100px;
            height: auto;
            margin: 10px;
            border-radius: 5px;
            transition: transform 0.3s;
        }
        
        .gallery img:hover {
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 10vw;
            }
            h2 {
                font-size: 7vw;
            }
            .button {
                font-size: 4vw;
                padding: 10px 20px;
            }
            .gallery img {
                width: 80px;
            }
        }
    </style>
</head>
<body>
    <div class="docker_metadata" id="instance-metadata">
        <strong>Container:</strong> $CONTAINER_ID<br>
    </div>
    <div>
        <h1>Welcome to LUIT</h1>
        <h2>Green Team - DevOps - February 2025</h2>
        <button class="button" onclick="window.location.href='https://levelupintech.com'">Get Started</button>
    </div>
    <h2 style="margin-top: 20px;">Powered by...</h2>
    <div class="gallery">
        <img class="center" src="images/ubuntu.png" alt="Ubuntu">
        <img class="center" src="images/docker.svg" alt="Docker">
        <img class="center" src="images/apache.png" alt="Apache Web Server">
    </div>
</body>
</html>
EOF

cat <<EOF >> /var/www/html/error.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Error</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1a0f4b, #000000);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            overflow: hidden;
        }
        
        h1 {
            font-size: 8vw;
            color: #ff4081;
            animation: futuristicEffect 1.5s infinite alternate;
        }
        
        h2 {
            font-size: 5vw;
            color: #39ff14;
            animation: futuristicEffect 1.5s infinite alternate;
        }
        
        @keyframes futuristicEffect {
            0% { transform: scale(1); }
            100% { transform: scale(1.05); }
        }
        
        .button {
            margin-top: 30px;
            padding: 15px 30px;
            font-size: 2.5vw;
            color: #ffffff;
            background-color: #ff4081;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .button:hover {
            background-color: #d5006d;
        }
        
        .docker_metadata {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: left;
            color: #ffffff;
        }
        
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }
        
        .gallery img {
            width: 100px;
            height: auto;
            margin: 10px;
            border-radius: 5px;
            transition: transform 0.3s;
        }
        
        .gallery img:hover {
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 10vw;
            }
            h2 {
                font-size: 7vw;
            }
            .button {
                font-size: 4vw;
                padding: 10px 20px;
            }
            .gallery img {
                width: 80px;
            }
        }
    </style>
</head>
<body>
    <div class="docker_metadata" id="instance-metadata">
        <strong>Container:</strong> $CONTAINER_ID<br>
    </div>
    <div>
        <h1>Oops! Something went wrong.</h1>
        <h2>We're sorry, but the page you were looking for doesn't exist.</h2>
        <div>
            <h2>Please check the URL.</h2>
            <button class="button" onclick="window.location.href='/'">Homepage</button>
        </div>
    </div>
</body>
</html>
EOF

# Start Apache in the foreground
apachectl -D FOREGROUND
