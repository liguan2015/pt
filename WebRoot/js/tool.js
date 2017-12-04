var countdown=60; 
	function settime(obj) { 
		if (countdown == 0) { 
		    obj.removeAttribute("disabled");    
		    obj.value="获取验证码"; 
		    countdown = 60; 
		    return;
		} else { 
		    obj.setAttribute("disabled", true); 
		    obj.value="请等待(" + countdown + ")"; 
		    countdown--; 
		} 
		setTimeout(function() {settime(obj) },1000) ;
	} 
	
	$(function() {
        $("#codeBtn").click(function () {
        	var c=$("#typeid").val();
			var m=$("#mobile").val();
			var t=$("#token").val();
			if (m =="") {
				mydialog("获取验证码失败","请输入正确的手机号","text");
			}
			else {
				settime(this);
				$.ajax({
	            	url:'/getCode',
	                dataType:'json' ,
	                type:'post',
	                async:false,
	                data:{
	                	mobile:m,
	                	typeid:c,
	                	token:t,
	                },
	        	});
			}
        });
        
        $("#registBtn").click(function () {
        	if($("#protocal").is(':checked')) {
        		var smscode = $("#smscode").val();
	        	var password = $("#password").val();
	        	var mobile = $("#mobile").val();
	        	var certno = $("#certno").val();
	        	var token = $("#token").val();
	        	
	        	if(checkMobile()){
	        		if (checkPassword()) {
	        			$.ajax({
			            	url:'/regist',
			            	type:'post',
			                dataType:'json' ,//没有这个，将把后台放会的json解析成字符串
			                data:{
			                	smscode:smscode,
			                	password:password,
			                	mobile:mobile,
			                	certno:certno,
			                	token:token,
			                	},
			                async:false,//是否异步
			                success:function(data) {//获得返回值
			                	if(data.success) {
			                		mydialog("注册成功","你已注册成功","callback");
			                	}
			                	else {
			                		mydialog("注册失败",data.errmsg,"text");
			                	}
			                	
			                }
			            })
					}
	        	}
			}
        });
        
        $("#submitBtn").click(function(){
			var m=$("#mobile").val();
			var c=$("#smscode").val();
			var p=$("#password").val();
			var t=$("#token").val();
			
			if (checkMobile()) {
				if (checkPassword()) {
					$.ajax({
						url:'/resetPsd',
						dataType:'json',
						type:'post',
						async:false,
						data:{
							mobile:m,
							password:p,
							token:t,
							smscode:c
						},
						success:function(data){
							console.log(data);
							if(data.success){
								mydialog("修改密码成功","修改密码成功","callback");
							}else{
								mydialog("修改密码失败","验证码错误","text");
							}
						}
					})
				}
			}
		})
		
		$("#loginBtn").click(function(){
			var m=$("#mobile").val();
			var p=$("#password").val();
			var t=$("#token").val();
			
			if(checkMobile()){
				$.ajax({
					url:'/login',
					dataType:'json',
					type:'post',
					async:false,
					data:{
						mobile:m,
						password:p,
						token:t,
					},
					success:function(data){
						console.log(data);
						if(data.access_token==null){
							mydialog("登陆失败","验证码错误","text");
						}
						else {
							
						}
					}
				})
			}
		});
        
        $("#loginBtn1").click(function(){
			var m=$("#mobile").val();
			var p=$("#password").val();
			var t=$("#token").val();
			
			$.ajax({
				url:'/login',
				dataType:'json',
				type:'post',
				async:false,
				data:{
					mobile:m,
					password:p,
					token:t
				},
				success:function(data){
					console.log(data);
					if(data.access_token==null){
						mydialog("登陆失败","手机号或密码不正确","text");
					}
				}
			})
		});
        
    });

	
	var dialog = new auiDialog();
	function mydialog(title,msg,type)  {
		switch (type) {
        case "text":
            dialog.alert({
                title:title,
                msg:msg,
                buttons:['确定']
            },function(ret){
                console.log(ret)
            })
            break;
        case "callback":
            dialog.alert({
                    title:title,
                    msg:msg,
                    buttons:['确定']
                },function(ret){
                	$(window).attr('location','/');
                })
            break;
		}
	}
	
	function checkMobile(){ 
	    var sMobile = $("#mobile").val(); 
	    if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(sMobile))){ 
	    	mydialog("失败","手机号不正确","text");
	    	return false;
	    } 
	    return true;
	}		
	
	function checkPassword() {
		var spassword = $("#password").val();
		if(!(/^\w{6,16}$/.test(spassword))){
			mydialog("失败","密码在6-16位，只能为数字，字母和下划线","text");
			return false;
		}
		return true;
	}