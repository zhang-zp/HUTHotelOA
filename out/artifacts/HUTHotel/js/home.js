$(document).ready(function(){
		$("#hotelType").append("<option>酒店类型</option>");
		$("#hotelName").append("<option>酒店名称</option>");
		$("#roomType").append("<option>房间类型</option>");
		$.ajax({
			type:"post",
			url:"checkHotelinfo/getHotelType.do",
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
		      	alert("error");
		     }  
		});
		
		$("#hotelType").change(function(){
			$("#hotelName").empty();
			$("#hotelName").html("<option>酒店名称</option>");
			$("#roomType").html("<option>房间类型</option>");
			$("#roomNumber").html("");
			$.ajax({
				type:"post",
				url:"checkHotelinfo/getHotelNameAll.do",
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
				url:"checkHotelinfo/getRoomType.do",
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
			$.ajax({
				type:"post",
				url:"checkHotelinfo/getRoomNumber",
				async:false,
				cache:false,
				dataType:"text",
    			data:{
    				roomTypeName:$("#roomType").val(),
    				hotelName:$("#hotelName").val()
    			},
				success:function(data){
					if(data!=""){
						var num = data;
						$("#roomNumber").html("房间剩余"+num+"间");
					}
				},
				error : function(e) {
			      	alert("error");
			     }  
			});
		});	
});