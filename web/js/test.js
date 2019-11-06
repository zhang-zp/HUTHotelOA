//添加新员工--张赵鹏

var flag7=false;var flag1=false;var flag2=false;var flag3=false;var flag4=false;var flag5=false;var flag6=false;
//员工工号
$("#staff_id").blur(function () {
    var reg=/\d{4}$/;
    var staff_id = $("#staff_id").val();
    if(staff_id.length==0){
        $("#staff_id1").css("color","red");
        $("#staff_id1").html("工号不能为空");
    }else{
        if(staff_id.length>4){
            $("#staff_id1").css("color","red");
            $("#staff_id1").html("工号必须为四位");
        } else {
            if(!reg.test(staff_id)){
                $("#staff_id1").css("color","red");
                $("#staff_id1").html("工号必须全为数字");
            }else{
                $.ajax({
                    url:"CheckStaff_id.staff",
                    type:"post",
                    data:{
                        staff_id:staff_id
                    },
                    success:function (data) {
                        if(data.indexOf("工号已存在")>=0){
                            $("#staff_id1").css("color","red");
                            $("#staff_id1").html("工号已存在！");
                        }else{
                            $("#staff_id1").html("<img src='img/li_ok.gif'>");
                            flag7=true;
                        }
                    },error:function (error) {
                        alert(error)
                    }
                })
            }
        }
    }
});
//员工姓名
$("#cname1").blur(function(){
    var cname=$("#cname1").val();
    var reg=/^[\u4e00-\u9fa5]{2,10}$/g;
    if(cname.length==0){
        $("#cname").css("color","red");
        $("#cname").html("员工姓名不能为空");
    }else{
        if(cname.length>10||cname.length<2){
            $("#cname").css("color","red");
            $("#cname").html("员工姓名必须在2-10字符之间");
        }else{
            if(!reg.test(cname)){
                $("#cname").css("color","red");
                $("#cname").html("员工姓名必须全是汉字");
            }else{
                $("#cname").html("<img src='img/li_ok.gif'>");
                flag1=true;
            }
        }
    }
});
//员工年龄
$("#age1").blur(function(){
    var age=$("#age1").val();
    // var reg=/(^[1][0-4][0-9]$)|(^150$)|(^[1-9][0-9]$)|(^[1-9]$)/g;
    // var reg =/^1[89]|[2-5]\d|60$/;
    var reg = /^(1[89]|[2-5][0-9]|60)$/;
    if(age.length==0){
        $("#age").html("");
    }else{
        if(!reg.test(age)){
            $("#age").css("color","red");
            $("#age").html("员工年龄必须在18-60岁之间");
        }else{
            $("#age").html("<img src='img/li_ok.gif'>");
            flag2=true;
        }
    }
});
//员工电话
$("#tel1").blur(function(){
    var tel=$("#tel1").val();
    var reg=/^[1][358]\d{9}$/;
    if(tel.length==0){
        $("#tel").html("");
    }else{
        if(tel.length>11||tel.length<11){
            $("#tel").css("color","red");
            $("#tel").html("员工手机号必须为11位");
        }else{
            if(!reg.test(tel)){
                $("#tel").css("color","red");
                $("#tel").html("员工手机号须以13、15、18开头，且长度为11");
            }else{
                $.ajax({
                    url:"checkTell.staff?tel="+tel,
                    type:"post",
                    async:false,
                    cache:false,
                    success:function(data){
                        if(data!=""){
                            flag3=true;
                            $("#tel").html("<img src='img/li_ok.gif'>");
                        }else{
                            $("#tel").css("color","red");
                            $("#tel").html("该手机号已被使用，请换成其他可用手机号");
                        }
                    },
                    error:function(){
                        alert("errors");
                    }
                });
            }
        }
    }
});
//员工身份证号
$("#idcard1").blur(function(){
    var idcard = $("#idcard1").val();
    var reg=/^\d{18}$/g;
    if(idcard.length==0){
        $("#idcard").html("");
    }else{
        if(!reg.test(idcard)){
            $("#idcard").css("color","red");
            $("#idcard").html("员工身份证号需为18位");
        }else{
            $.ajax({
                url:"checkID.staff?idcard="+idcard,
                type:"post",
                async:false,
                cache:false,
                success:function(data){
                    if(data!=""){
                        $("#idcard").html("<img src='img/li_ok.gif'>");
                        flag4=true;
                    }else{
                        $("#idcard").css("color","red");
                        $("#idcard").html("身份证号已被使用，请更换");
                    }
                },
                error:function(){
                    alert("errors");
                }
            });
        }
    }
});
//员工入职时间
$("#starttime1").blur(function(){
    var starttime=$("#starttime1").val();
    var start=new Date(starttime.replace("-", "/").replace("-", "/"));
    //var nowtime=getNowFormatDate();
    var now=new Date();
    if(starttime.length==0){
        $("#starttime").css("color","red");
        $("#starttime").html("员工入职时间不能为空");
    }else{
        if(start>now){
            $("#starttime").html("员工入职时间不能大于当前时间");
            $("#starttime").css("color","red");
        }else{
            $("#starttime").html("<img src='img/li_ok.gif'>");
            flag6=true;
        }
    }
});

function formcheck() {
    if(flag1==true&&flag2==true&&flag3==true&&flag4==true&&flag6==true&&flag7==true){
        return true;
    }
    return false;
};

//class属性为nowTime
//时间类型默认显示当前时间--张赵鹏
$(document).ready(function () {
    var time = new Date();
    var day = ("0" + time.getDate()).slice(-2);
    var month = ("0" + (time.getMonth() + 1)).slice(-2);
    var today = time.getFullYear() + "-" + (month) + "-" + (day);
    $(".nowTime").val(today);
})