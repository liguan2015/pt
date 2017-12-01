<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css\aui.css" >
    <script type="text/javascript" src="js\jquery-3.2.1.min.js"></script>
</head>
<body>
    <header class="aui-bar aui-bar-nav">
        <a href="javascript:window.history.back(-1)" class="aui-pull-left aui-btn">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">修改密码</div>
    </header>
    <br>
    <div class="aui-content aui-content-padded">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="mobile" name="mobile" type="text" placeholder="请输入手机号">
                    </div>
                </div>
                <div class="aui-list-item-label">
                    <div class="aui-btn aui-btn-info">获取验证码</div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="smscode" name="smscode" type="text" placeholder="请输入验证码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input type="text" placeholder="请输入旧密码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="password" name="password" type="text" placeholder="请输入新密码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="submitBtn" class="aui-btn aui-btn-info aui-btn-block">确认</div>
                </div>
            </li>
        </ul>
        <div><input id="token" type="hidden" name="token" value="${token}"></div>
        <div><input id="typeid" type="hidden" name="typeid" value="1"></div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		$("#codeBtn").click(function(){
			
		});
		$("#submitBtn").click(function(){
			var m=$("#mobile").val();
			var c=$("#smscode").val();
			var p=$("#password").val();
			var t=$("#token").val();
			
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
					if(data.success==true){
						alert(data.data);
					}
				}
			})
		})
	})
</script>
</html>