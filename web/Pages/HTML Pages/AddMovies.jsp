<!DOCTYPE html>
<html>
    <head>
        <title>Add Movie</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\AddMoviesCSS.css">
        <script>
            function validateTitle(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("nmerr").innerHTML = "Enter a Name";
                    return false;
                } else
                {
                    document.getElementById("nmerr").innerHTML = "";
                    return true;
                }
            }
            function imgLoad(event)
            {

                var image = document.getElementById('imgout');
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg')
                {
                    image.src = URL.createObjectURL(event.target.files[0]);
                    document.getElementById("err").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("err").innerHTML = "Only png, jpg, jpeg types allowed";
                    image.src = "null/";
                    return false;
                }
            }
            ;
            function validateHobby()
            {
                var x = document.getElementsByName("movtype");
                okay = false;
                for (var i = 0; i < x.length; i++)
                {
                    if (x[i].checked)
                    {
                        okay = true;
                        break;
                    }
                }
                if (okay)
                {
                    document.getElementById("typeerr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("typeerr").innerHTML = "Select Atleast One Type";
                    return false;
                }
            }
            function checkImg()
            {
                if (document.getElementById('imgout').src === "http://localhost:8080/TestProject_1/Pages/HTML%20Pages/null")
                {
                    document.getElementById("err").innerHTML = "Select an Image";
                    return false;
                } else
                {
                    document.getElementById("err").innerHTML = "";
                    return true;
                }
            }
            function validate()
            {
                a = validateHobby();
                b = validateTitle(document.getElementById("title"));
                c = checkImg();
                if (a && b && c)
                {
                    return true;
                } else
                {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <form onsubmit="return validate()" method="POST" action="http://localhost:8080/TestProject_1/AddMovie" enctype="multipart/form-data">
            <div class="container">
                <h1>Add Movie</h1>
                <label for="name">Movie Name:</label>
                <input type="text" id="title" name="name" onblur="validateTitle(this)">
                <span id="nmerr" style="color:red"></span><br>
                <label for="type">Movie Type:</label>
                <select id="type" name="type">
                    <option value="">---</option>s
                    <option value="2D">2D</option>
                    <option value="3D">3D</option>
                </select>
                <span id="terr" style="color:red"></span><br>
                <br>
                <div >

                    <label for="movtype">Movie Type:</label>
                    <br>
                    <input type="checkbox" name="movtype" value="Crime" onchange="validateHobby()">Crime
                    <input type="checkbox" name="movtype" value="Horror" onchange="validateHobby()">Horror
                    <input type="checkbox" name="movtype" value="Thriller" onchange="validateHobby()">Thriller
                    <input type="checkbox" name="movtype" value="Adventure" onchange="validateHobby()">Adventure
                    <input type="checkbox" name="movtype" value="Comedy" onchange="validateHobby()">Comedy
                    <span id="typeerr" style="color:red"></span><br>
                    <br>
                    <br>
                    <label for="desc">Give a description:</label><br>
                    <textarea id="desc" name="desc" onchange ="validateDesc(this)" style="width:100%; height:50px"></textarea>
                    <br>
                    <label for="Poster">Poster</label>
                    <input type="file" id="image" name="Poster" onchange ="imgLoad(event)">
                    <img id="imgout" width="140" height="235" src=null disabled/>
                    <span id="imgerr" style="color:red"></span> 
                    <br>
                    <br>
                    <span id="err" style="color:red"></span><br>
                    <button  type="submit" name="submit" id="done">Add Movie</button>
                    <br>
                    <br>
                    <div class="error">
                    <%
                        String error = request.getParameter("status");
                        if (error != null && error.equals("success")) {
                            out.println("<span class=\"success-msg\">ADDED SUCCESFULLY</span>");
                        } else if (error != null && error.equals("failed")) {
                            out.println("<span class=\"error-msg\">Failed To Add</span>");
                        } else if (error != null && error.equals("empty")) {
                            out.println("<span class=\"error-msg\">Field(s) Is Empty</span>");
                        } else {
                            out.println("<span class=\"error-msg\"></span>");
                        }
                    %>
                    </div>
                </div>
            </div>
            <br>
        </form>
        <div class='homediv'>
            <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AdminOptions.jsp" method="post">
                <button id="home">Admin Home</button>
            </form>
        </div>
    </body>
</html>
