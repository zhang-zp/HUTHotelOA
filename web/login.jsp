<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="fy-alert/css/fy-alert.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" type="text/css" href="css/verify.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
<%--    <script src="js/jquery-ui.js"></script>--%>
<%--    <script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="js/vector.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="fy-alert/js/fy-alert.js"></script>
    <script type="text/javascript" src="js/verify.js" ></script>
    <script>
        $(function(){
            $("#mpanel4").css('display','none');
            $("#login").unbind("click");
            $("#login").on("click","",function () {
                var username=$("#username").val();
                var password=$("#password").val();
                $.ajax({
                    'tpye':'post',
                    'url':'check.user',
                    'data':{'username':username,'password':password},
                    'success':function (data,textStatus) {
                        if(data==null){
                            alert("没接到数据");
                        }else{
                            var order=JSON.parse(data);
                            if(order.length<=0){
                                fyAlert.msg("账户密码错误",{icon:3,animateType:1} )
                            }else {
                                fyAlert.alert({
                                    title   : "验证",
                                    aniExtend:'lightSpeedIn',
                                    content : '<div id="mpanel4" ></div>',
                                    closeBtn:false,
                                    shadowClose:true,
                                    area     : ['auto','320px'],
                                })
                                $('#mpanel4').slideVerify({
                                    type : 2,		//类型
                                    vOffset : 5,	//误差量，根据需求自行调整
                                    vSpace : 5,	//间隔
                                    imgName : ['1.jpg', '2.jpg'],
                                    imgSize : {
                                        width: '400px',
                                        height: '200px',
                                    },
                                    blockSize : {
                                        width: '40px',
                                        height: '40px',
                                    },
                                    barSize : {
                                        width : '400px',
                                        height : '40px',
                                    },
                                    ready : function() {
                                    },
                                    success : function() {
                                        fyAlert.msg("验证成功",{icon:1,animateType:1} )
                                        setTimeout(function (){
                                                window.location.href="main.user?dept_name="+order[0].dept_name+"&staff_name="+order[0].staff_name;


                                        },2000);

                                        //......后续操作
                                    },
                                    error : function() {
                                        fyAlert.msg("验证失败",{icon:2,animateType:1} )
                                    }

                                });
                            }


                        }

                    }
                })
            })
        });

    </script>
</head>
<body>

<div id="container">
    <div id="output">
        <div class="containerT">
            <h1>用户登录</h1>
            <form class="form" id="entry_form">
                <input type="text" placeholder="用户名" id="username" >
                <input type="password" placeholder="密码" id="password">
                <button type="button" id="login">登录</button>

                <div id="prompt" class="prompt"></div>
            </form>

        </div>
    </div>
</div>

</div>

<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#username").focus();
    });

</script>
</body>
</html>