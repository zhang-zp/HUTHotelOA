$(document).ready(function(){
		$("#hotelType").append("<option>酒店类型</option>");
		$("#hotelName").append("<option>酒店名称</option>");
		$("#roomType").append("<option>房间类型</option>");
		$.ajax({
			type:"post",
			url:"checkHotelInfo/getHotelType.do",
			dataType:"text",
			async:false,
			cache:false,
			success:function(data){
				var str = data.split("-");
				for(var i=0;i<str.length;i++){
			 		var $option =$("<option></option>");
					$option.text(str[i]);
					$("#hotelType").append($option); 
				}
			},
			error : function(e) {
		      	//alert("error");
		     }  
		});
		
		$("#hotelType").change(function(){
			$("#hotelName").empty();
			$("#hotelName").html("<option>酒店名称</option>");
			$("#roomType").html("<option>房间类型</option>");
			$("#roomNumber").html("");
			$.ajax({
				type:"post",
				url:"checkHotelInfo/getHotelNameByHotelNameType.do",
				async:false,
				cache:false,
				dataType:"text",
    			data:{
    				hotelType:$("#hotelType").val()
    			},
				success:function(data){
					if(data!=""){
						var str = data.split("-");
						for(var i=0;i<str.length;i++){
				 			var $option =$("<option></option>");
							$option.text(str[i]);
							$("#hotelName").append($option); 
						}
					}
				},
				error : function(e) {
			      	alert("error");
			     }  
			});
		});
		
		$("#hotelName").change(function(){
			$("#roomType").empty();
			$("#roomType").html("<option>房间类型</option>");
			$("#roomNumber").html("");
			$.ajax({
				type:"post",
				url:"checkHotelInfo/getRoomType.do",
				async:false,
				cache:false,
				dataType:"text",
    			data:{
    				hotelName:$("#hotelName").val()
    			},
				success:function(data){
					if(data!=""){
						var str = data.split("-");
						for(var i=0;i<str.length;i++){
				 			var $option =$("<option></option>");
							$option.text(str[i]);
							$("#roomType").append($option); 
						}
					}
				},
				error : function(e) {
			      	alert("error");
			     }  
			});
		});
		
		$("#roomType").change(function(){
			if ($.trim($("input[name=preplotStartTime]").val())=="") {
					alert("请输入入店时间");
			} else {
			var str = $("input[name=preplotStartTime]").val().split("-");
			$.ajax({
				type : "post",
				url : "checkHotelInfo/getRoomNumber.do",
				async : false,
				cache : false,
				dataType : "text",
				data : {
					roomTypeName : $("#roomType").val(),
					hotelName : $("#hotelName").val(),
					time : str[2]
				},
				success : function(data) {
					if (data != "") {
						var num = data;
						$("#roomNumber").html("房间剩余" + num + "间");
					}
				},
				error : function(e) {
					alert("error");
				}
			});
			}
		});	
		
	$("input[name=preplotStartTime]").blur(function(){
		var roomtypename = $("#roomType").val();
		var hotelname =$("#hotelName").val();
		var str = $("input[name=preplotStartTime]").val().split("-");
		if(roomtypename!="房间类型"&&hotelname!="酒店名称"){
			$.ajax({
				type : "post",
				url : "checkHotelInfo/getRoomNumber.do",
				async : false,
				cache : false,
				dataType : "text",
				data : {
					roomTypeName : roomtypename,
					hotelName : hotelname,
					time : str[2]
				},
				success : function(data) {
					if (data != "") {
						var num = data;
						$("#roomNumber").html("房间剩余" + num + "间");
					}
				},
				error : function(e) {
					alert("error");
				}
			});
		}
	});
	
	$("#preplotSelect").click(function(){
		var tel=$("input[name=personTel]").val();
		if($.trim(tel)==""){
			$("#person_phone").html("手机号不能为空");
		}else{
		$("#person_phone").html("");
		$("#table_preplot").html("");
		$("#table_preplot").html("<thead><tr><th>预定人</th><th>酒店名称</th><th>房间类型</th><th>预定时间</th><th>退订热线</th></tr></thead>");
		$.ajax({
			type : "post",
			url : "checkHotelInfo/getPreplot.do",
			async : false,
			cache : false,
			dataType : "json",
			data :{
				preplot_tel: tel
			},
			success : function(data){
				$.each(data,function(index, item) {
					var $option =$("<tbody><tr>"+
							"<td>"+item.preplot_people+"</td>"+
							"<td>"+item.preplot_hotel+"</td>" +
							"<td>"+item.preplot_roomtype+"</td>" +
							"<td>"+item.preplot_time+"</td>" +
							"<td>"+item.hotel_tel+"</td>"+
							"</tr></tbody>");
						$("#table_preplot").append($option);	
					});
				},
				error : function(e) {
					alert("error");
				}
			});
		}
	});
	 $("#preplotRoom").click(function(){
		 if($.trim($("input[name=peopleName]").val())==""||$.trim($("input[name=preplotTel]").val())==""||$.trim($("input[name=preplotStartTime]").val())==""||$.trim($("input[name=preplotEndTime]").val())=="")
		 {
			 if($.trim($("input[name=peopleName]").val())==""){
				 $("#person_name").html("姓名不能为空");
			 }
			 if($.trim($("input[name=preplotTel]").val())==""){
				 $("#person_tell").html("电话不能为空");
			 } 
			 if($.trim($("input[name=preplotStartTime]").val())==""){
				 $("#person_startTime").html("入住时间不能为空");
			 }
			 
			 if($.trim($("input[name=preplotEndTime]").val())==""){
				 $("#person_endtTime").html("离店时间不能为空");
			 }
		 }else{
			 $("#roomPreplot").submit();
		 }
	 });
});