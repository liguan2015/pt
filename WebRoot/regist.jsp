<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title>注册</title>
	<link rel="stylesheet" type="text/css" href="css\aui.css" />
	<script type="text/javascript" src="js\jquery-3.2.1.min.js"></script>
	<script type="text/javascript"> 
		var countdown=60; 
		function settime(obj) { 
    		if (countdown == 0) { 
    		    obj.removeAttribute("disabled");    
    		    obj.value="免费获取验证码"; 
    		    countdown = 60; 
    		    return;
    		} else { 
    		    obj.setAttribute("disabled", true); 
    		    obj.value="重新发送(" + countdown + ")"; 
    		    countdown--; 
    		} 
			setTimeout(function() {settime(obj) },1000) ;
			
		} 
	</script>
</head>
<body>
	<div>
		<header class="aui-bar aui-bar-nav">
    		<a href="javascript:window.history.back(-1)" class="aui-pull-left aui-btn">
        		<span class="aui-iconfont aui-icon-left"></span>
    		</a>
    		<div class="aui-title">注册</div>
		</header>		
	</div>	
		<br>
	<div class="aui-content aui-content-padded">
		<ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input type="text" placeholder="请输入你的手机号">
                	</div>
                	<div class="aui-list-item-label">
                    	<input type="button" class="aui-btn aui-btn-info" value="获取验证码" onclick="settime(this)">
                	</div>                
            	</div>
        	</li>
        </ul>	
        <br>
		<ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input type="text" placeholder="请输入验证码">
                	</div>
            	</div>
        	</li>
        </ul>	
        <br>
        <ul class="aui-list aui-form-list">
        	<li class="aui-list-item">
            	<div class="aui-list-item-inner">                	
                	<div class="aui-list-item-input">
                    	<input type="text" placeholder="请输入密码">
                	</div>
            	</div>
        	</li>
        </ul> 
        <br>
        <div>
        	<label><input type="checkbox" name="protocal">我同意<a href="#">《广东联网售票服务系统》</a></label>
        </div>
        <br>
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm">确认</div>       	
	</div>
	
	<div><input type="hidden" ></div>
</body>
</html>