var flag7=false;var flag1=false;var flag2=false;var flag3=false;var flag4=false;var flag5=false;var flag6=false;
var goods_name=false; g_price = false; goods_num = false;
$(function () {

	/**
	 * 采购商品信息核查
	 */
	//商品名称
	$("#shopname").blur(function(){
		$("#spn2").html(" ");
		if($(this).val().indexOf("请选择采购商品名称">=0)){
			// $("#spn2").html("<img src='img/li_ok.gif'>");
			goods_name = true;
		}else{
			goods_name = false;
		}
	});
	//商品价格
	$("#shopprice").blur(function(){
		$("#spp2").html(" ");
		var price=/^[0-9]+(\.[0-9]{2})$/;
		if(price.test($(this).val())){
			// $("#spp2").html("<img src='img/li_ok.gif'>");
			g_price = true;
			if($("#sum").val()==""){
				// alert("请输入商品数量");
			}else{
				var p = parseFloat($("#shopprice").val());
				var sum = parseInt($(this).val());
				var c = (p*sum).toFixed(2);
				$("#totalprice").val(c);
				if(goods_name==false){
					alert("请选择采购商品名称");
				}
				g_price =  true;
			}
			
		}else if($(this).val()!=""){
			$("#spp2").html("输入商品价钱格式错误");
			$("#spp2").css("color","red");
			// alert("输入商品价钱格式错误")
			g_price =  false;
		}
	});
	//商品数量--张赵鹏
	$("#sum").blur(function() {
		$("#sps2").html("");
		var sum = /^[1-9]\d*$/;
		if (sum.test($(this).val())) {
			if (g_price==false) {
				alert("请输入商品价格");
			} else {
				var p = parseFloat($("#shopprice").val());
				var sum = parseInt($(this).val());
				var c = (p * sum).toFixed(2);
				$("#totalprice").val(c);
				// $("#sps2").html("<img src='img/li_ok.gif'>");
				if (goods_name==false) {
					alert("请输入采购商品名称");
				}
				goods_num =  true;
			}
		} else if ($(this).val() != "") {
			$("#sps2").html("输入商品数量不正确");
			$("#sps2").css("color", "red");
			goods_num =  false;
		};
	});





	//商品分发核查数量
	$("#sum1").blur(function(){
		var numReg = /^[1-9]\d*$/;
		var num = $("#sum1").val();
		if(num.length==0){
			alert("请输入合理的数量");
		}else{
			if(!numReg.test(num)){
				alert("请输入数字");
			}else{
				if($("#shopName").val().indexOf("请选择分发商品名称")>=0){
					alert("请先选择商品名")
				}else{
					$.ajax({
						url:"CheckGoodsNum.goods",
						type:"post",
						data:{
							GoodsNum:num,
							GoodsName:$("#shopName").val()
						},
						success:function (data) {
							if(data.indexOf("数量不足")>=0){
								alert("商品数量不足");
							}
						},error:function (error) {
							console.log(error);
							alert(error);
						}
					})
				}
			}
		}
	});
	
	
	// //李艳岭
	// //人事管理
	// $("#hrManage").click(function(){
	// 	$("#bgscenter").load("hrManage.jsp");
	//
	// });

	/**
	 * 添加新员工信息核查
	 */

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
		// var reg=/^\d{18}$/g;
		var reg = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
		if(idcard.length==0){
			$("#idcard").css("color","red");
			$("#idcard").html("身份证号不能为空");
		}else{
			if(!reg.test(idcard)){
				$("#idcard").css("color","red");
				$("#idcard").html("请输入正确的身份证号");
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

	//class属性为nowTime
	//时间类型默认显示当前时间--张赵鹏
	$(document).ready(function () {
		var time = new Date();
		var day = ("0" + time.getDate()).slice(-2);
		var month = ("0" + (time.getMonth() + 1)).slice(-2);
		var today = time.getFullYear() + "-" + (month) + "-" + (day);
		$(".nowTime").val(today);
	})


	function update1(obj){
		$("#u2 input:eq(0)").val(obj.children("td:eq(1)").html());
		if(obj.children("td:eq(2)").html()=="男"){
			$("#u2 input:eq(1)").prop("checked", true);
		}else{
			$("#u2 input:eq(2)").prop("checked", true);
		}		
		$("#u2 input:eq(3)").val(obj.children("td:eq(3)").html());
		$("#u2 input:eq(4)").val(obj.children("td:eq(4)").html());
		$("#u2 select:eq(0)").val(obj.children("td:eq(5)").html());
		$("#u2 select:eq(1)").val(obj.children("td:eq(6)").html());
		$("#u2 input:eq(5)").val(obj.children("td:eq(8)").html());
		$("#u2 input:eq(6)").val(obj.children("td:eq(9)").html());
		$("#u2 input:eq(7)").val(obj.children("td:eq(10)").html());
		$("#u2 input:eq(8)").val(obj.children("td:eq(0)").html());
	}
	var tr=null;
	//修改点击事件
	$(".xiugai").click(function(){
		$("#u1").hide();
		$("#u2").show();
		tr=$(this).parent().parent();
		update1($(this).parent().parent());
	});

	//修改员工信息重置按钮
	$("#update_employee_reset").click(function(){
			update1(tr);
	});
	//职位和部门的级联
	var depart=[];
	depart['行政管理部']=['董事长','总经理'];
	depart['财务部']=['部门经理','财务职员'];
	depart['人事部']=['部门经理','人事职员'];
	depart['采购部']=['部门经理','采购职员'];
	depart['客房部']=['部门经理','客房职员','保洁'];
	depart['前台部']=['部门经理','前台职员'];
	depart['保安部']=['部门经理','保安'];
	$(document).ready(function(){
		for(var i in depart){
			$("#depart").append("<option value='"+i+"'>"+i+"</option>");
    	}
	});
	$("#depart").change(function(){
		var department=$("#depart").val();
		$("#rk").get(0).options.length = 0; 
		for(var i in depart[department])
		{
			$("#rk").append("<option value='"+depart[department][i]+"'>"+depart[department][i]+"</option>");
		} 
	}); 

    //王瑞
	//财务管理
	$("#finance").click(function(){
		$("#bgscenter").load("Finance.jsp");
	});
	
	//客房管理
	$("#rooms").click(function(){
		$("#bgscenter").load("Rooms.jsp");
	});
});
//添加员工提交时条件检查
function staffAddFormCheck() {
	if(flag1==true&&flag2==true&&flag3==true&&flag4==true&&flag6==true&&flag7==true){
		var addStaff = confirm("确认添加操作！");
		if(addStaff){
			return true;
		}else{
			return false;
		}
	}else {
		if(flag7==false){
			alert("请输入合适的工号")
			return false;
		}
		if(flag1==false){
			alert("请输入正确的姓名格式");
			return false;
		}
		if(flag2==false){
			alert("年龄不在范围内");
			return false;
		}
		if(flag3==false){
			alert("请输入正确的电话号码");
			return false;
		}
		if(flag4==false){
			alert("请输入正确身份证号");
			return false;
		}
		if(flag6==false){
			alert("日期格式不正确");
			return false;
		}
	}

};

//采购商品提交时条件检查--商品名称单继数量，采购人，采购时间
function buyConfirm() {
	if(goods_name==true&&goods_num==true&&g_price==true){
		var flag = confirm("确认采购该物品吗？") ;
		if(flag){
			alert("采购成功！");
			return true;
		}else{
			alert("取消采购！");
			return false;
		}
	}else{
		if(goods_name==false){
			alert("请选择采购商品名称");
			return false;
		}
		if(goods_num==false){
			alert("请确认商品数量");
			return  false;
		}
		if(g_price==false){
			alert("请确认商品价格");
			return false;
		}
	}
}