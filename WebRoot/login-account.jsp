<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/aui-dialog.js"></script>
</head>
<body>
    <header class="aui-bar aui-bar-nav">
        <a class="aui-pull-left aui-btn">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">登陆</div>
    </header>
    <div class="aui-tab" id="tab">
        <a href="login-phone.jsp" class="aui-tab-item">手机登陆</a>
        <a href="javascript:;" class="aui-tab-item aui-active">账号登陆</a>
    </div>
    <br>
    <div class="aui-content aui-content-padded">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="mobile" name="mobile" type="text" placeholder="手机号">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="password" name="password" type="password" placeholder="请输入密码">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
                    <div id="loginBtn" class="aui-btn aui-btn-info aui-btn-block">登陆</div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <a href="regist.jsp" style="float:left">马上注册</a>
                    <a href="reset-password.jsp" style="float:right">忘记密码?</a>
                </div>
            </li>
        </ul>
        <div><input id="token" type="hidden" name="token" value="${token}"></div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		$("#loginBtn").click(function(){
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
						mydialog("登陆失败","手机号或密码不正确");
					}
				}
			})
		});
	})
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
		    	mydialog("登陆失败","手机号不正确");
		    	return false;
		    } 
		    return true;
		}		
		
		function checkPassword() {
			var spassword = $("#password").val();
			if(!(/^\w{6,16}$/.test(spassword))){
				mydialog("登陆失败","密码在6-16位之间");
				return false;
			}
			return true;
		}
	
</script>
</html>