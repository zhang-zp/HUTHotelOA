$(document).ready(function(){

		$("#roomTypeName").html("<option>请选择</option>");
		$.ajax({
				type:"post",
				url:"checkHotelInfo/getRoomTypeNameBySession.do",
				async:false,
				cache:false,
				success:function(data){	
				var str = data.split("-");
				for(var i=0;i<str.length;i++){
					var $option=$("<option></option>");
					$option.text(str[i]);
					$("#roomTypeName").append($option); 
					}
				},
				error : function(e) {
	      			alert("error");
	   		 	}  
		});	
		$("a[name=home_reserve]").click(function(){
			var str = $(this).attr("id").split(",");
			$("#roomName").html("<option>"+str[0]+"</option>");
			$("#roomType").html("<option>"+str[1]+"</option>");
			$("#viptype").empty();
			$.ajax({
				type:"post",
				url:"checkHotelInfo/getViptypename.do",
				async:false,
				cache:false,
				dataType:"text",
				success:function(data){	
					var str = data.split("-");
					for(var i=0;i<str.length;i++){
						var $option=$("<option></option>");
						$option.text(str[i]);
						$("#viptype").append($option); 
						}
				},
				error : function(e) {
	      			alert("error");
	   		 	}  
			});
			
			
		}); 
		
		$("a[name=home_exist]").click(function(){
			var str = $(this).attr("id").split(",");
			$("#rName").html("<option>"+str[0]+"</option>");
			$("#rType").html("<option>"+str[1]+"</option>");
			
			$.ajax({
				type:"post",
				url:"checkHotelInfo/getStayroom.do",
				async:false,
				cache:false,
				dataType:"text",
    			data:{
    				roomTypeName:str[1],
    				roomName:str[0]
    			},
				success:function(data){	
					var str = data.split("-");
					$("#stayName").val(str[0]);
					$("#stayTel").val(str[1]);
					$("#stayIdcard").val(str[2]);
					$("#vType").html("<option>"+str[3]+"</option>");
					$("#roomPrice").val(str[4]);
				},
				error : function(e) {
	      			alert("error");
	   		 	}  
			});	
		}); 
	 	
	 	$("#lastPage").click(function(){
	 		var nowPage = $("#nowPage").html();
	 		var roomName=$("input[name=roomName]").val();
	 		var state = $("#hidden_state").val();
	 		var roomtype = $("#hidden_roomtype").val();
	 		if(nowPage==1){
	 			alert("已经是第一页");
	 		}else if(nowPage<1){
	 			nowPage=1;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+nowPage+"&roomName="+roomName;
	 			}else{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+nowPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+nowPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 		}else{
	 			nowPage--;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+nowPage+"&roomName="+roomName;
	 			}else{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+nowPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+nowPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 		}
	 	});
	 	$("#nextPage").click(function(){
	 		var pageSum = $("#pageSum").html();
	 		var nowPage = $("#nowPage").html();
	 		var roomName=$("input[name=roomName]").val();
	 		var state = $("#hidden_state").val();
	 		var roomtype = $("#hidden_roomtype").val();
	 		if(nowPage==pageSum){
	 			alert("已经是最后一页");
	 		}else if(nowPage>pageSum){
	 			nowPage=pageSum;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+nowPage+"&roomName="+roomName;
	 			}else{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+nowPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+nowPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 		}
	 		else{
	 			nowPage++;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+nowPage+"&roomName="+roomName;
	 			}else{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+nowPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+nowPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 		}
	 	});
	 	
	 	$("#aimButton").click(function(){
	 		var pageSum = $("#pageSum").html();
	 		var aimPage = $("#aimPage").val();
	 		var roomName=$("input[name=roomName]").val();
	 		var state = $("#hidden_state").val();
	 		var roomtype = $("#hidden_roomtype").val();
	 		if(aimPage==""){
	 			alert("请输入跳转的页码");
	 		}else if(!$.isNumeric(aimPage)){
	 			alert("请输入数字");
	 		}
	 		else if(aimPage-pageSum>0){
	 			aimPage=pageSum;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+aimPage+"&roomName="+roomName;
	 			}
	 			else
	 			{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+aimPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+aimPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 			alert("页面超过最大页数，已经到最后一页");
	 		}else if(aimPage<1){
	 			aimPage=1;
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+aimPage+"&roomName="+roomName;
	 			}
	 			else
	 			{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+aimPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+aimPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 			alert("页面小于最小页数，已经到第一页");
	 		}else{
	 			if(roomName!=""){
	 				window.location.href="roomManage/getRoomByRoomName.do?&nowPage="+aimPage+"&roomName="+roomName;
	 			}
	 			else
	 			{
	 				if(state==""&&roomtype==""){
	 					window.location.href="roomManage/getRoom.do?&nowPage="+aimPage;
	 				}else{
	 					window.location.href="roomManage/getRoomByRoomTypeAndState.do?&nowPage="+aimPage+"&state="+state+"&roomtypeName="+roomtype;
	 				}
	 			}
	 		}
	 });
	 	
	 $("#deepRoom").click(function(){
		 if($.trim($("input[name=name]").val())==""||$.trim($("input[name=tell]").val())==""||$.trim($("input[name=idcard]").val())=="")
		 {
			 if($.trim($("input[name=name]").val())==""){
				 $("#person_name").html("姓名不能为空");
			 }
			 if($.trim($("input[name=tell]").val())==""){
				 $("#person_tell").html("电话不能为空");
			 } 
			 if($.trim($("input[name=idcard]").val())==""){
				 $("#person_idcard").html("身份证不能为空");
			 }
		 }else{
			 $("#roomCheck").submit();
		 }
	 });
});
