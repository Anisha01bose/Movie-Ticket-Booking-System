/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validate()
{
    a = validateEmail(document.getElementById("email"));
    b = validatePass(document.getElementById("password"));
    c = validateConfirmPass(document.getElementById("confpassword"));
    d = validateGender();
    e = calAge(document.getElementById("dob"));
    f = validatePhone(document.getElementById("phone"));
    g = validateName(document.getElementById("name"));
    if (a && b && c && d && e && f && g)
    {
        return true;
    } else
        return false;
}
function enableRegister(idval)
{

    var log = document.getElementById("RegisterButton");
    if (idval.checked)
    {
        log.disabled = false;
    } else
    {
        log.disabled = true;
    }

}
function validateName(idval)
{
    if (idval.value === "")
    {
        document.getElementById("nameerr").innerHTML = "Enter Your Name";
        return false;
    } else
    {
        document.getElementById("nameerr").innerHTML = "";
        return true;

    }

}
function validatePhone(idval)
{
    if (idval.value === "")
    {
        document.getElementById("phoneerr").innerHTML = "Enter A Phone Number";
        document.getElementById("phoneerr").style = "color:red";
        return false;

    } else
    {
        if (idval.value.length !== 10)
        {
            document.getElementById("phoneerr").innerHTML = "Enter A Valid Phone Number";
            document.getElementById("phoneerr").style = "color:orange";
            return false;
        } else
        {
            document.getElementById("phoneerr").innerHTML = "";
            return true;

        }
    }
}
function calAge(idval)
{
    x = idval.value;
    if (idval.value === "")
    {
        document.getElementById("doberr").innerHTML = "Select a date";
        return false;
    } else
    {
        x = new Date(idval.value);
        var mn = Date.now() - x.getTime();
        var newdt = new Date(mn);
        var year = newdt.getUTCFullYear();
        var age = Math.abs(year - 1970);
        if (age >= 18) {
            document.getElementById("doberr").innerHTML = "";
            return true;
        } else
        {
            document.getElementById("doberr").innerHTML = "Age is Lower than 18 yrs";
            return false;
        }
    }
}
function validateGender()
{
    var x = document.getElementsByName("gender");
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
        document.getElementById("gendererr").innerHTML = "";
        return true;
    } else
    {
        document.getElementById("gendererr").innerHTML = "Select a Gender";
        return false;
    }

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
            document.getElementById("emailerr").innerHTML = "Email is Invalid";
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
            document.getElementById("passerr").innerHTML = "Password is Invalid";
            document.getElementById("passerr").style = "color:orange";
            return false;
        }

    }
}
function validateConfirmPass(idval)
{
    if (idval.value === "")
    {
        document.getElementById("confpasserr").innerHTML = "Password is Empty";
        return false;
    } else
    {
        x = document.getElementById("password").value;
        if (idval.value.match(x))
        {
            document.getElementById("confpasserr").innerHTML = "";
            return true;
        } else
        {
            document.getElementById("confpasserr").innerHTML = "Passwords don't match";
            return false;
        }
    }

}