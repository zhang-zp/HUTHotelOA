$(document).ready(function(){
	$("#roomType").change(function(){
		if($(this).val()==""){
			
		}else{
	
		$.ajax({
			type:"post",
			url:"checkHotelInfo/getRoomTypePrice.do",
			async:false,
			cache:false,
			dataType:"text",
			data:{
				roomtypename:$(this).val()
			},
			success:function(data){	
				$("input[name=oldPrice]").val(data);
			},
			error : function(e) {
      			alert("error");
   		 		}, 
			});	
		}
	});
	
	 $("#changePrice").click(function(){
		 if($.trim($("input[name=newPrice]").val())=="")
		 {
			 $("#new_price").html("新价格不能为空");
		 }else{
			 $("#priceChange").submit();
		 }
	 });
	
});