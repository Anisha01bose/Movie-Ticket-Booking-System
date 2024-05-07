<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Movie Lovers</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>

            .loading {
                z-index: 1;
                position:inherit;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                height: 100vh;
                background-color: transparent;
                overflow-y: hidden;
                object-fit: cover;
            }
            .bg
            {
                background-color: black;
                overflow-y: hidden;
                width: 100%;
                height: 98%;
                position: fixed;
                opacity: 50%;
                z-index: -1;
                object-fit: cover;
            }
            .loader {
                object-fit: cover;
                position: fixed;
                z-index: 1;
                border: 8px solid #e6e6e6;
                border-top: 8px solid #3498db;
                border-radius: 100%;
                width: 60px;
                height: 60px;
                animation: spin 1s linear infinite;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }

            p {
                width: 50%;
                overflow-y: hidden;
                position: fixed;
                font-size: 24px;
                color: white;
                margin-top: 120px;
            }
        </style>
        <script>
            window.addEventListener('load', function () {
            setTimeout(function () {
                    window.location.href = 'Homepage.jsp';
                }, 1500); // 3 seconds
            });


        </script>

    </head>
    <body style="background-color:black;" >
        <div class="bg" >
            <img src="Movie.jpg">
        </div>
        <div class="loading">
            <div class="loader"></div>
            <br>
            <br>
            <br>
            <br>
            <p>Loading...</p>

        </div>
    </body>
</html>
