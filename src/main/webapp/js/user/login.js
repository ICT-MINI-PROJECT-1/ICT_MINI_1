document.addEventListener('DOMContentLoaded', () => {
    window.setTimeout(() => {
    	where="login";
        container = document.getElementsByClassName("container")[0];
        footer.style.opacity=1;
        container.style.height='90vh';
    });
});

document.addEventListener('keydown', function(event) {
    if (event.key == 'Enter') {
        loginChk();
    }
});

async function loginChk(){
	var userid = document.getElementById("userid").value;
	var userpw = document.getElementById("userpw").value;
	var alert_id = document.getElementById("alert-id");
	var alert_pw = document.getElementById("alert-pw");
	alert_id.style.opacity = 0;
	alert_pw.style.opacity = 0;
	
	if(userid=="") {
		alert_id.innerHTML = "Please enter your ID";
		alert_id.style.opacity = 1;
	}
	else if(userpw==""){
		alert_pw.innerHTML = "Please enter your Password";
		alert_pw.style.opacity = 1;
	}
	else{
		var params = {
			userid:userid,
			userpw:userpw
		}
		await fetch("/user/loginChk",{
			method:"POST",
			headers:{
				"Content-Type":"application/json",
			},
			body:JSON.stringify(params)
			}).then(response => response.json())
			.then(data=>{
				if(data=="0"){
					alert_id.innerHTML = "Invalid ID";
					alert_id.style.opacity = 1;
				} else if(data=="1"){
					alert_pw.innerHTML = "Invalid PW";
					alert_pw.style.opacity = 1;
				} else{
					document.loginForm.submit();
				}		
			}).catch(err=> {
			console.log(err);
		});
	}
}

where="login";