function validate()
{
 var first=document.myform.firstname.value;
 var last=document.myform.lastname.value;
 var addr=document.myform.country.value;
 var cityval=document.myform.subject.value;
 
 
 
 
 if(first==""|| last=="" || addr=="" || cityval=="")
   {
       alert("Firstname/Lastname/Country/Subject  must be filled");
       return false;
   }
   else
   {alert("Successfully submitted");
   window.location.href = "close.html";
   return true;
}
   
   

}
