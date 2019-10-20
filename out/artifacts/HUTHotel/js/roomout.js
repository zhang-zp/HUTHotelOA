$(document).ready(function(){

	$("#lastPage").click(function(){
	 		var nowPage = $("#nowPage").html();
	 		var str=$("input[name=str]").val();
	 		if(nowPage==1){
	 			alert("已经是第一页");
	 		}else if(nowPage<1){
	 			nowPage=1;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+nowPage;
	 			}
	 		}else{
	 			nowPage--;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+nowPage;
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
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+nowPage;
	 			}
	 		}
	 		else{
	 			nowPage++;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+nowPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+nowPage;
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
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+aimPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+aimPage;
	 			}
	 			alert("页面超过最大页数，已经到最后一页");
	 		}else if(aimPage<1){
	 			aimPage=1;
	 			if(str!=""){
	 				window.location.href="roomManage/SelectExistByStr.do?nowPage="+aimPage+"&str="+str;
	 			}else{
	 				window.location.href="roomManage/SelectExist.do?&nowPage="+aimPage;
	 			}
	 			alert("页面小于最小页数，已经到第一页");
	 		}
	 });
	 	
});