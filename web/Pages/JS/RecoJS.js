            function validateTitle(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("terr").innerHTML = "Enter a Name";
                    return false;
                } 
                else
                {
                    document.getElementById("terr").innerHTML = "";
                    return true;
                }
            }
            function imgLoad(event)
            {
                
                var image = document.getElementById('imgout');
                alert(image.src);
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                alert(fname);
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg')
                {
                    image.src = URL.createObjectURL(event.target.files[0]);
                    document.getElementById("ierr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("ierr").innerHTML = "Only png, jpg, jpeg types allowed";
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
                    document.getElementById("herr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("herr").innerHTML = "Select Atleast One Type";
                    return false;
                }
            }
            function checkImg()
                {
                    if(document.getElementById('imgout').src==="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/null")
                    {
                       document.getElementById("ierr").innerHTML="Select an Image";
                        return false;
                    }
                    else
                    {
                        document.getElementById("ierr").innerHTML="";
                        return true;
                    }
                }
            function validate()
            {
                a=validateHobby();
                b=validateTitle(document.getElementById("title"));
                c=checkImg();
                if(a && b && c)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }