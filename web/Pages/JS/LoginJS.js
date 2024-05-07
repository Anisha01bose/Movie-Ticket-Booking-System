function validate()
{
    a = validateEmail(document.getElementById("email"));
    b = validatePass(document.getElementById("password"));
     if (a && b)
    {
        return true;
    } else
        return false;
}
function validateEmail(idval)
{
    var rege = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    if (idval.value === "")
    {
        document.getElementById("emailerr").innerHTML = "Email is Empty";
        return false;
    } else
    {
        if (idval.value.match(rege))
        {
            document.getElementById("emailerr").innerHTML = "";
            return true;

        } else
        {
            document.getElementById("emailerr").innerHTML = "Enter A Valid Email ID";
            document.getElementById("emailerr").style = "color:orange";
        }
        return false;
    }
}
function validatePass(idval)
{
    if (idval.value === "")
    {
        document.getElementById("passerr").innerHTML = "Password is Empty";
        return false;
    } else {
        if (idval.value.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/))
        {
            document.getElementById("passerr").innerHTML = "";
            return true;

        } else
        {
            document.getElementById("passerr").innerHTML = "Enter A Valid Password";
            document.getElementById("passerr").style = "color:orange";
            return false;
        }

    }
    }
    
    function passRem()
    {
        document.getElementById("passerr").innerHTML="";
        document.getElementById("er").innerHTML="";
    }
       function emailRem()
    {
        document.getElementById("emailerr").innerHTML="";
        document.getElementById("er").innerHTML="";
    }