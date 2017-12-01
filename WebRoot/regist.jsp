<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title>注册</title>
	<link rel="stylesheet" type="text/css" href="css/aui.css" />
	<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
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
		$(document).ready(function() {
	        $("#codeBtn").click(function () {
	        	settime(this);
	        	var name = $("#name").val();
	        	var smscode = $("#smscode").val();
	        	var password = $("#password").val();
	        	var mobile = $("#mobile").val();
	        	var certno = $("#certno").val();
	        	var typeid = $("#typeid").val();
	            $.ajax({
	                type:"POST",//提交请求的方式
	                url:'/getCode',
	                //dataType:"json",//没有这个，将把后台放会的json解析成字符串
	                data:{
	                	name:name,
	                	smscode:smscode,
	                	password:password,
	                	mobile:mobile,
	                	certno:certno,
	                	typeid:typeid,
	                	},
	                async:false,//是否异步
	                /*error:function(request) {//请求出错
	                    alert("errmsg");
	                },
	                success:function(data) {//获得返回值
	                    alert("success");
	                }*/
	            })

	        });
	    });
	</script>
</head>
<body>
	<div>
		<header class="aui-bar aui-bar-nav">
    		<a class="aui-pull-left aui-btn">
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
                    	<input id="mobile" type="text" placeholder="请输入手机号">
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
                    	<input id="smscode" type="text" placeholder="请输入验证码">
                	</div>
            	</div>
        	</li>
        </ul>	
        <br>
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="password" type="text" placeholder="请输入密码">
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input id="certno" type="text" placeholder="请输入身份证">
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
        <div>
        	<label><input type="checkbox" name="protocal">我同意<a href="#">《广东联网售票服务系统》</a></label>
        </div>
        <br>
        <div id="registBtn" class="aui-btn aui-btn-info aui-btn-block aui-btn-sm">注册</div>       	
	</div>
	
	<div><input id="token" type="hidden" name="token" value="${token }"></div>
	<div><input id="typeid" type="hidden" name="token" value="0"></div>
</body>
</html>