<!DOCTYPE html>
<html>
    <head>
        <title>Add Recommended Movie</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\AddMoviesCSS.css">
    </head>
    <body>
        <div class="img">
            <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp">
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
        <form onsubmit="return validate();" method="POST" action="http://localhost:8080/TestProject_1/AddRecoMovie" enctype="multipart/form-data">
            <div class="container">
                <h1>Add Recomended Movie</h1>
                <label for="name">Movie Name:</label>
                <input type="text" id="title" name="name" onblur="validateTitle(this)">
                <label for="type">Screen Type:</label>
                <select id="type" name="type">
                    <option value="">---</option>
                    <option value="2D">2D</option>
                    <option value="3D">3D</option>
                </select>
                <label for="movtype">Movie Type:</label>
                <br>
                <input type="checkbox" name="movtype" value="Crime" onchange="validateHobby()">Crime
                <input type="checkbox" name="movtype" value="Horror" onchange="validateHobby()">Horror
                <input type="checkbox" name="movtype" value="Thriller" onchange="validateHobby()">Thriller
                <input type="checkbox" name="movtype" value="Adventure" onchange="validateHobby()">Adventure
                <input type="checkbox" name="movtype" value="Comedy" onchange="validateHobby()">Comedy

                <div >

                    <br>
                    <label for="Poster">Poster</label>
                    <input type="file" id="image" name="Poster" onchange ="imgLoad(event)">
                    <img id="imgout" width="140" height="235" src=null disabled/>
                    <br>
                    <span id="err" style="color:red"></span><br>
                    <span id="terr" style="color:red"></span><br>
                    <span id="ierr" style="color:red"></span><br>
                    <span id="herr" style="color:red"></span>
                    <br>
                    <br>

                    <button  type="submit" name="submit" id="done">Add Movie</button>

                </div>
            </div>

            <br>
        </form>
        <%
            String error = request.getParameter("status");
            if (error != null && error.equals("success")) {
                out.println("<span class=\"success-msg\">Added Successfully</span>");
            } else if (error != null && error.equals("failed")) {
                out.println("<span class=\"error-msg\">Failed To Add</span>");
            } else if (error != null && error.equals("empty")) {
                out.println("<span class=\"error-msg\">Field(s) Is Empty</span>");
            } else {
                out.println("<span class=\"error-msg\"></span>");
            }
        %>
        <div class='homediv'>
            <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AdminOptions.jsp" method="post">
                <button id="home">Admin Home</button>
            </form>
        </div>
        <script src="..\JS\RecoJS.js"></script>
    </body>
</html>
