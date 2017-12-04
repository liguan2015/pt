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
	<script type="text/javascript" src="/js/tool.js"></script>
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
                    	<input id="password"  type="password" placeholder="请输入密码" required="required">
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
        	<label><input type="checkbox" id="protocal">我同意<a href="protocal.jsp">《广东联网售票服务系统》</a></label>
        </div>
        <br>
        <input id="registBtn" type="button" class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" value="注册"/>      	
	</div>
	
	<div><input id="token" type="hidden" name="token" value="${token }"></div>
	<div><input id="typeid" type="hidden" name="token" value="0"></div>
</body>
</html>