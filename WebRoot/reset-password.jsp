<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/aui.css" >
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/aui-dialog.js"></script>
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
                    <input type="button" id="codeBtn" class="aui-btn aui-btn-info" value="获取验证码" >
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
                        <input id="password" name="password" type="password" placeholder="请输入新密码" required="required">
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
		
		$("#codeBtn").click(function(){
			settime(this);
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
								mydialog("修改密码成功","修改密码成功");
							}else{
								mydialog("修改密码失败","验证码错误");
							}
						}
					})
				}
			}
		})
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
		    	mydialog("失败","手机号不正确");
		    	return false;
		    } 
		    return true;
		}		
		
		function checkPassword() {
			var spassword = $("#password").val();
			if(!(/^\w{6,16}$/.test(spassword))){
				mydialog("失败","密码在6-16位之间");
				return false;
			}
			return true;
		}
</script>
</html>