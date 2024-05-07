<!DOCTYPE html>
<html>
    <head>
        <title>Admin Options</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\AdminOptionsCSS.css">
    </head>
    <body>
        <h1>Admin Options</h1>
        <div class="options">
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AddMovies.jsp">
                <button type="submit" name="add_movie">Add Movie</button>
            </form>
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/deleteMov.jsp">
                <button type="submit" name="delete_movie">Delete Movie</button>
            </form>
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AddRecoMovie.jsp">
                <button type="submit" name="add_reco_movie">Add Recommended Movie</button>
            </form>
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/DelReco.jsp">
                <button type="submit" name="delete_reco_movie">Delete Recomended Movie</button>
            </form>
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/DeAllocate.jsp">
                <button type="submit" name="deassign_movie">Deassign Movie</button>
            </form>
            <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AssignMovie.jsp">
                <button type="submit" name="assign_movie">Assign Movie</button>
            </form>
            <form method="post" action="clear_database_servlet">
                <button type="submit" name="clear_database">Clear All Database</button>
            </form>
            <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" method="post">
                <button id="home">Logout</button>
            </form>

        </div>
    </body>
</html>