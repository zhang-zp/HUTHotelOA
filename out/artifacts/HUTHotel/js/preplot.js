$(document).ready(function(){

	$("#lastPage").click(function(){
	 		var nowPage = $("#nowPage").html();
	 		var str=$("input[name=str]").val();
	 		if(nowPage==1){
	 			alert("已经是第一页");
	 		}else if(nowPage<1){
	 			nowPage=1;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+nowPage;
	 			}
	 		}else{
	 			nowPage--;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+nowPage;
	 			}
	 		}	
	 	});
	 	$("#nextPage").click(function(){
	 		var pageSum = $("#pageSum").html();
	 		var nowPage = $("#nowPage").html();
	 		var str=$("input[name=str]").val();
	 		if(nowPage==pageSum){
	 			alert("已经是最后一页");
	 		}else if(nowPage>pageSum){
	 			nowPage=pageSum;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+nowPage;
	 			}
	 		}
	 		else{
	 			nowPage++;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+nowPage;
	 			}
	 		}
	 	});
	 	
	 	$("#aimButton").click(function(){
	 		var pageSum = $("#pageSum").html();
	 		var aimPage = $("#aimPage").val();
	 		var str=$("input[name=str]").val();
	 		if(aimPage==""){
	 			alert("请输入跳转的页码");
	 		}else if(!$.isNumeric(aimPage)){
	 			alert("请输入数字");
	 		}
	 		else if(aimPage-pageSum>0){
	 			aimPage=pageSum;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+aimPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+aimPage;
	 			}
	 			alert("页面超过最大页数，已经到最后一页");
	 		}else if(aimPage<1){
	 			aimPage=1;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectPreplotByStr.do?nowPage="+aimPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectPreplot.do?nowPage="+aimPage;
	 			}
	 			alert("页面小于最小页数，已经到第一页");
	 		}
	 });
	 	
	 	
	 $("a[name=home_preplot]").click(function(){
		 var str = $(this).attr("id").split(",");
		 $("input[name=name]").val(str[0]);
		 $("input[name=tell]").val(str[1]);
		 $("input[name=startTime]").val(str[2]);
		 $("#roomType").html("<option>"+str[3]+"</option>");
		 $("input[name=preplot_id]").val(str[4]);
		 $("#roomName").empty();
		 $.ajax({
				type:"post",
				url:"checkHotelInfo/getRoomName.do",
				async:false,
				cache:false,
				dataType:"text",
				data:{
					roomtypename:str[3]
				},
				success:function(data){	
					var str = data.split("-");
					for(var i=0;i<str.length;i++){
						var $option=$("<option></option>");
							$option.text(str[i]);
							$("#roomName").append($option); 
						}
				},
				error : function(e) {
	      			alert("error");
	   		 	}  
		 });	
	 });
	 
	 $("#preplotRoom").click(function(){
		 if($.trim($("input[name=idcard]").val())=="")
		 {
			 $("#person_idcard").html("身份证不能为空");
		 }else{
			 $("#roomPreplot").submit();
		 }
	 });
	 
});