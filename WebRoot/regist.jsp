<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title>注册</title>
	<link rel="stylesheet" type="text/css" href="css/aui.css" />
	<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/js/aui-dialog.js"></script>
	<script type="text/javascript"> 
		var countdown=60; 
		function settime(obj) { 
    		if (countdown == 0) { 
    		    obj.removeAttribute("disabled");    
    		    obj.value="获取验证码"; 
    		    countdown = 60; 
    		    return;
    		} else { 
    		    obj.setAttribute("disabled", true); 
    		    obj.value="重新发送(" + countdown + ")"; 
    		    countdown--; 
    		} 
			setTimeout(function() {settime(obj) },1000) ;
		} 
		
		$(function() {
	        $("#codeBtn").click(function () {
	        	settime(this);
	        	var mo = $("#mobile").val();
	        	var ty = $("#typeid").val();
	        	var to = $("#token").val();
	        	
	            $.ajax({
	            	url:'/getCode',
	                dataType:'json' ,
	                type:'post',
	                async:false,
	                data:{
	                	mobile:mo,
	                	typeid:ty,
	                	token:to
	                },
	        	});
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
				                		mydialog("注册成功","你已注册成功");
				                	}
				                	else {
				                		mydialog("注册失败",data.errmsg);
				                	}
				                }
				            })
						}
		        	}
				}
	        });
	    });

		
		var dialog = new auiDialog();
		function mydialog(title,msg)  {
			dialog.alert({
			    title:title,
			    msg:msg,
			    buttons:['确定']
			},function(ret){
			    console.log(ret)
			})
		}
		
		function checkMobile(){ 
		    var sMobile = $("#mobile").val(); 
		    if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(sMobile))){ 
		    	mydialog("注册失败","手机号不正确");
		    	return false;
		    } 
		    return true;
		}		
		
		function checkPassword() {
			var spassword = $("#password").val();
			if(!(/^\w{6,16}$/.test(spassword))){
				mydialog("注册失败","密码在6-16位之间");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<div>
		<header class="aui-bar aui-bar-nav">
    		<a class="aui-pull-left aui-btn" href="login-phone.jsp">
        		<span class="aui-iconfont aui-icon-left"></span>
    		</a>
    		<div class="aui-title">注册</div>
		</header>		
	</div>	
		<br>
	<div class="aui-content aui-content-padded">
		<!--<ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="name" type="text" placeholder="请输入登录名">
                	</div>
                	<div class="aui-list-item-label">
                    	<input type="button" id="codeBtn" class="aui-btn aui-btn-info" value="获取验证码" >
                	</div>                
            	</div>
        	</li>
        </ul>  -->	
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="mobile" type="text" placeholder="请输入手机号" required="required">
                	</div>
                	<div class="aui-list-item-label">
                    	<input type="button" id="codeBtn" class="aui-btn aui-btn-info" value="获取验证码" >
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
		<ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="smscode" type="text" placeholder="请输入验证码" required="required">
                	</div>
            	</div>
        	</li>
        </ul>	
        <br>
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="password" type="text" placeholder="请输入密码" required="required">
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="certno" type="text" placeholder="请输入身份证(非必填)" required="required">
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
        <div>
        	<label><input type="checkbox" id="protocal">我同意<a href="#">《广东联网售票服务系统》</a></label>
        </div>
        <br>
        <input id="registBtn" type="button" class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" value="注册"/>      	
	</div>
	
	<div><input id="token" type="hidden" name="token" value="${token }"></div>
	<div><input id="typeid" type="hidden" name="token" value="0"></div>
</body>
</html>