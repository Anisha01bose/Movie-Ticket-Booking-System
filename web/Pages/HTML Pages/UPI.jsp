<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script>
            function chkUPI(idval)
            { var rex=/^[a-zA-Z0-9]+@+[a-zA-Z]+$/;
                   if(idval.value.match(rex))
                   {
                       document.getElementById("err").innerHTML="";
                       return true;
                   }
                   else
                   {
                       document.getElementById("err").innerHTML="Invalid Format of UPI ID";
                       return false;
                   }
            }
        </script>
        <title>UPI Payment Page</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\upiPayment.css">
    </head>
    <body>
        <h1>UPI Payment Page</h1>
        <div class="container">
            <%  String mov = request.getParameter("mov");
            String name=request.getParameter("name");
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            request.getSession(false).setAttribute("name",name);
            request.getSession(false).setAttribute("phone",phone);
            request.getSession(false).setAttribute("email",email);%>
            <form action="submitUserDetails.jsp?paymd=UPI" method="post">
                <label for="upiId">UPI ID:</label>
                <input type="text" id="upiId" name="upiId" onblur="chkUPI(this)"><br>
                <span id="err" style="color:red;font-weight: bold"></span>

                <label for="amount">Amount:</label>
                <input type="text" id="amount" name="amount"><br>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description"><br>

                <button type="submit">Pay</button>
            </form>
        </div>
    </body>
</html>
