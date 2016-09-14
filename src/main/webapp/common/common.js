/**
 * 
 */

function RndNum(n) {
	var rnd = "";
	for (var i = 0; i < n; i++)
		rnd += Math.floor(Math.random() * 10);
	return rnd;
}

var countdown = 60;
var i = 0;
var code;
function sendCode(val) {

	if (i == 0) {
		code = parseInt(RndNum(4));
		alert(code);
		/*
		 * $.get("smsCode/send.do?code="+code,function(data){
		 * 
		 * });
		 */
	}

	if (countdown == 0) {

		val.removeAttribute("disabled");
		val.value = "免费获取验证码";
		countdown = 60;
	} else {
		i = 1;
		val.setAttribute("disabled", true);
		val.value = "重新发送(" + countdown + ")";
		countdown--;
	}
	setTimeout(function() {
		sendCode(val)
	}, 1000)
}