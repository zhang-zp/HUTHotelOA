var i = 0;
$(function() {

    //开房提交
    $("#regRoom").click(function () {
        $.ajax({
            url:"RoomReg.room",
            type:"post",
            data:{
                name:$('#name').val(),
                ID:$('#ID').val(),
                tel:$('#tel').val(),
                type:$('#type').val(),
                num:$('#num').val(),
                enter:$('#enter').val(),
                leave:$('#leave').val()
            },
            success:function (data) {
                var info = data.substring(3,data.length);
                alert(info)
                window.location.href='Room_Reg.jsp';
            },
            error:function (error) {
                alert("信息不完整，请补全信息")
            }
        });
    });

    //房间搜索
    $("#search").click(function () {
        $.ajax({
            url:'Search.room',
            type:'post',
            async:false,
            cache:false,
            data:{
                data1:$('#hotelName').val(),
                data2:$('#s2').val()
            },
            success:function(data) {
                var show = JSON.parse(data);
                $('#tab1 tr').html('')
                for(var i in show){
                    $('#tab1').append('<tr><td>'+show[i].room_id+'</td>'
                        +'<td>'+show[i].room_type+'</td>'
                        +'<td>'+show[i].room_price+'</td>'
                        +'<td>' +show[i].room_num+'</td>'
                        +'<td>' +show[i].room_floor+'</td>'
                        +'<td>' +show[i].room_status+'</td>'
                        +'<td>' +show[i].room_dse+'</td>' +'</tr>')
                }
            },
            error:function(error) {
                alert('选择错误');
            }
        });
    });

    //房间预订
    $("#pre").click(function () {
        $.ajax({
            url:"RoomPre.room",
            type:"post",
            data:{
                name:$('#Name').val(),
                ID:$('#pID').val(),
                tel:$('#pTel').val(),
                type:$('#pType').val(),
                num:$('#pNum').val(),
                enter:$('#pEnter').val(),
                leave:$('#pLeave').val()
            },
            success:function (data) {
                var info = data.substring(3,data.length);
                alert(info)
                window.location.href='Room_Preplot.jsp';
            },
            error:function (error) {
                alert("信息不完整，请补全信息")
            }
        });
    });

    //某类型剩余房间
    $("#roomType").change(function () {
        $.ajax({
            async:false,
            cache:false,
            url:"RoomType.room",
            type:"post",
            data:{
                newType:$('#roomType').val()
            },
            success:function (data) {
                var newData = JSON.parse(data);
                $("#freeRoom").empty();
                for(var i in newData){
                    $("#freeRoom").append("<option>"+newData[i].room_id+"</option>");
                }
            },
            error:function (error) {
                alert("该类型房间已没有剩余")
            }
        });
    });

    //更换房间
    $("#roomChange").click(function () {
        $.ajax({
            url:'ChangeRoom.room',
            type:'post',
            data:{
                roomId:$('#freeRoom').val()
            },
            success:function(data) {
                $('#roomType').empty();
                $('#freeRoom').empty();
                alert(data.substring(3,data.length));
            },
            error:function(error) {
                alert(error);
            }
        });
    });

    //退宿结算
    $("#roomCheck").click(function () {
        $.ajax({
            async:false,
            cache:false,
            url:"check.room",
            type:"post",
            data:{
                info:$('#info').val()
            },
            success:function(data) {
                var check = JSON.parse(data)
                $('#tb').empty()
                for(var i in check){
                    $('#tb').append('<tr><td>'+check[i].people_name+'</td>'
                        +'<td>'+check[i].rent_tel+'</td>'
                        +'<td>'+check[i].room_type+'</td>'
                        +'<td>'+check[i].enter_time+'</td>'
                        +'<td>'+check[i].leave_time+'</td>'
                        +'<td>'+check[i].rent_num+'</td></tr>'
                    )
                }
                $('#info').val('')
            },
            error:function(error) {
                alert('无结果，请检查信息是否正确')
            }
        });
    });



    //姓名
    $("#name").change(function () {
        var name = $('#name').val();
        var reg=/^[\u4e00-\u9fa5]{2,10}$/g;
        if(name.length==0){
            $("#sName").css("color","red");
            $("#sName").html("员工姓名不能为空");
            $("#sName").val(" ");
        }else{
            if(name.length>10||name.length<2){
                $("#sName").css("color","red");
                $("#sName").html("员工姓名必须在2-10字符之间");
                $("#sName").val(" ");
            }else{
                if(!reg.test(name)){
                    $("#sName").css("color","red");
                    $("#sName").html("员工姓名必须全是汉字");
                    $("#sName").val(" ");
                }else{
                    $("#sName").html("<img src='img/li_ok.gif'>");
                    flag1=true;
                }
            }
        }
    });

    //身份证号
    $("#ID").change(function () {

        var idCard = $("#ID").val();
        var reg=/^\d{18}$/g;
        if(idCard.length==0){
            $("#sID").html("");
        }else{
            if(!reg.test(idCard)){
                $("#sID").css("color","red");
                $("#sID").html("员工身份证号需为18位");
            }else{
                $.ajax({
                    url:"checkID.staff?idcard="+idCard,
                    type:"post",
                    async:false,
                    cache:false,
                    success:function(data){
                        if(data!=""){
                            $("#sID").html("<img src='img/li_ok.gif'>");
                            flag4=true;
                        }else{
                            $("#sID").css("color","red");
                            $("#sID").html("身份证号已被使用，请更换");
                        }
                    },
                    error:function(){
                        alert("errors");
                    }
                });
            }
        }
    });

    //电话号码
    $("#tel").change(function () {

        var tel=$("#tel").val();
        var reg=/^[1][358]\d{9}$/;
        if(tel.length==0){
            $("#tel").html("");
        }else{
            if(tel.length>11||tel.length<11){
                $("#sTel").css("color","red");
                $("#sTel").html("员工手机号必须为11位");
            }else{
                if(!reg.test(tel)){
                    $("#sTel").css("color","red");
                    $("#sTel").html("员工手机号须以13、15、18开头，且长度为11");
                }else{
                    $.ajax({
                        url:"checkTell.staff?tel="+tel,
                        type:"post",
                        async:false,
                        cache:false,
                        success:function(data){
                            if(data!=""){
                                flag3=true;
                                $("#sTel").html("<img src='img/li_ok.gif'>");
                            }else{
                                $("#sTel").css("color","red");
                                $("#sTel").html("该手机号已被使用，请换成其他可用手机号");
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

    //房间数量
    $("#num").change(function () {
        var num = $("#num").val();
        var reg = [0-9]*[1-9][0-9]*$;

    });
})
