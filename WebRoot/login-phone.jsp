<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
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
        <a href="javascript:;" class="aui-tab-item aui-active">手机登陆</a>
        <a href="login-account.jsp" class="aui-tab-item">账号登陆</a>
    </div>
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
                    <div id="codeBtn" class="aui-btn aui-btn-info">获取验证码</div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-input">
                        <input id="password" name="password" type="text" placeholder="请输入验证码">
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
        <div><input id="typeid" type="hidden" name="typeid" value="2"></div>
    </div>
</body>

<script type="text/javascript">
	
	$(function(){
		$("#codeBtn").click(function(){
			var c=$("#typeid").val();
			var m=$("#mobile").val();
			var t=$("#token").val();
			
			$.ajax({
				url:'/getCode',
				dataType:'json',
				type:'post',
				async:false,
				data:{
					typeid:c,
					mobile:m,
					token:t
				},
			});
		});
		$("#loginBtn").click(function(){
			var m=$("#mobile").val();
			var p=$("#password").val();
			var t=$("#token").val();
			
			if(m==""){
				openDialog('手机号不能为空!');
				return;
			}
			
			if(p==""){
				openDialog('密码不能为空!');
				return;
			}
		
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
						openDialog("验证码错误");
					}
				}
			})
		});
		
	})
	
	var dialog = new auiDialog();
	function openDialog(text){
		dialog.alert({
            title:"信息",
            msg:text,
            buttons:['确定']
        })
	}
</script>
</html>