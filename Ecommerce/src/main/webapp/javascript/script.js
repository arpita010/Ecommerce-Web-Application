//file name saver
//set product id
function setProductId(id)
{
	var formfield=document.getElementById("editPid");
	formfield.value=id;
	console.log(formfield.value);
}
function submitDeleteProductForm(id)
{
	var form=document.getElementById("deleteProductForm");
	var formfield=document.getElementById("delPid");
	formfield.value=id;
	form.submit();
}
//delete category form
function submitCategoryDeleteForm(id)
{
	var form=document.getElementById("deleteCategoryForm");
	var formfield=document.getElementById("delId");
	formfield.value=id;
	form.submit();
}
//set cid
function setCID(id)
{
	var cid=document.getElementById("cId");
	cid.value=id;
	console.log(cid.value);
}
//valid login
function validateLogin()
{
	var validEmail=validateEmail();
	var validPassword=validatePassword();
	var result=validEmail&&validPassword;
	return result;
}
//valid username
function validateUsername()
{
	var username=document.getElementById("username").value;
	var warning=document.getElementById("usernameWarning");
	if(username.length==0)
	{
	warning.innerHTML="**Username cannot be null..";
	return false;
	}
	return true;
}
//valid registration of user
function validateRegistration()
{
	var validUsername=validateUsername();
	var validEmail=validateEmail();
	var validPassword=validatePassword();
	var validPhoneNumber=validatePhoneNumber();
	if(validEmail&&validPassword&&validPhoneNumber&&validUsername)
	return true;
	else
	return false;
}
//validate phonenumber
function validatePhoneNumber()
{
	var number=document.getElementById("phonenumber").value;
	var pattern=/^\d{10}$/;	
	var msg=document.getElementById("phoneWarning");
	if(number.match(pattern))
	{
		return true;
	}
	msg.innerHTML="**Enter a valid Phone Number.";
	return false;
}
//validate password
function validatePassword()
{
	var password=document.getElementById("password").value;
	var msg=document.getElementById("passwordWarning");
	if(password.length<6)
	{
		msg.innerHTML="**Enter a valid password.";
		return false;
	}
	return true;
}
//validate email
function validateEmail()
{
	var email=document.getElementById("email").value;
	var length=email.length;
	var msg=document.getElementById("emailWarning");
	if(email.includes('@')!=true||email.includes('.')!=true)
	{
		msg.innerHTML="**Enter a valid email.";
		return false;
	}
	if(email.startsWith('@')||email.endsWith('@'))
	{
		msg.innerHTML="**Enter a valid email.";
		return false;
	}
	if((email.lastIndexOf('.')!=length-3)&&(email.lastIndexOf('.')!=length-4))
	{
		msg.innerHTML="**Enter a valid email.";
		return false;
	}
	return true;
}