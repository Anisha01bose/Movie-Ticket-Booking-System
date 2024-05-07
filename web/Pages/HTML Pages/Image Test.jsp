<!DOCTYPE html>
<html>
    <head>
        <title>Add Image</title>
        <link rel="stylesheet" type="text/css" href="">
        <style>
            /* Style for form container */
            .container {
                text-align: center;
                max-width: 400px;
                margin: auto;
                padding: 20px;
                background-color: #f2f2f2;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            /* Style for input fields */
            input[type=text], select, input[type=file] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
            }

            /* Style for submit button */
            #done {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
            }
            #done:hover {
                background-color: #45a049;
            }

            /* Style for form labels */
            label {
                font-size: 18px;
                font-weight: bold;
            }
            .img #logo{
                width:50px;
                height: 50px;
                top:10px;
                left:10px;
            }
            /* Style for error messages */
            .error-msg {
                color: red;
                font-size: 14px;
            }

            /* Style for success messages */
            .success-msg {
                color: green;
                font-size: 14px;
            }

            .homediv
            {
                text-align: center;
            }
            #home
            {
                align-content: center;
                background-color: #0069d9;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
        </style>
        <script >

            function imgLoad(event) {

                var image = document.getElementById('imgout');
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg')
                {
                    image.src = URL.createObjectURL(event.target.files[0]);
                    document.getElementById("imgerr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("imgerr").innerHTML = "Only png, jpg, jpeg types allowed";
                    image.src = "null/";
                    return false;
                }
            }
            ;
            function checkImg()
            {
                if (document.getElementById('imgout').src === "http://localhost:8080/TestProject_1/Pages/HTML%20Pages/null") //change this path to your project path
                {
                    document.getElementById('imgerr').innerHTML = "Select an Image";
                    return false;
                } else
                {
                    document.getElementById('imgerr').innerHTML = "";
                    return true;
                }

            }

            function checkName()
            {
                if (document.getElementById("name").value === "")
                {
                    document.getElementById("err").innerHTML = "Enter a name";
                    b = false;
                } else
                {
                    document.getElementById("err").innerHTML = "";
                    b = true;
                }
                return b;
            }
            function validate()
            {

                a = checkImg();
                b = checkName();
                return (a & b);
            }
        </script>
    </head>
    <body>
        <form onsubmit="return validate()" method="POST" action="http://localhost:8080/TestProject_1/ImgTestServlet" enctype="multipart/form-data">
            <div class="container">
                <h1>Add Image To Database</h1>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" onblur="checkName()">
                <span id="err" style="color:red"></span>
                <div >
                    <br>
                    <label for="Image">Image</label>
                    <input type="file" id="image" name="image" onchange ="imgLoad(event)">
                    <img id="imgout" width="140" height="235" src=null disabled/>
                    <br>
                    <span id="imgerr" style="color:red"></span>
                    <br>
                    <br>
                    <%
                        String error = request.getParameter("status");
                        if (error != null && error.equals("success")) {
                            out.println("<span class=\"success-msg\">Added Successfully</span>");
                        } else if (error != null && error.equals("failed")) {
                            out.println("<span class=\"error-msg\">Failed To Add</span>");
                        } else {
                            out.println("<span class=\"error-msg\"></span>");
                        }
                    %>
                    <br>
                    <button  type="submit" name="submit" id="done">Add Image</button>

                </div>
            
            <br>
        </form>
                    <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/PrintFromDatabaseImg.jsp">
                        <input type="submit" value="See Submitted Images" style="background-color: Red;font-size: 20px;padding:10px;border-radius: 10px">
                    </form>
    </div>
</body>
</html>
