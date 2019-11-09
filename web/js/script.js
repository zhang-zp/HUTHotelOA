//生成动态表格
$(document).ready(function () {
	$("#selectRecord").change(function () {
		$.ajax({
			url:"goodsRecord.goods",
			type:"post",
			data:{
				selectRecord:$("#selectRecord").val()
			},
			success:function(data){
				var goodsData = $.parseJSON(data);
				$('.box2').MyPaging({
					size: 5,
					total: 0,
					current: 1,
					prevHtml: '上一页',
					nextHtml: '下一页',
					layout: 'total, totalPage, prev, pager, next, jumper',
					jump: function () {
						var _this = this;
						// 模拟ajax获取数据
						setTimeout(function (){
							//满足此条件的是采购记录
							if (goodsData[1].distri_time==undefined) {
								$("#thead").empty();
								$("#thead").append("<tr>"+
									"<th>"+'商品编号'+"</th>"+
									"<th>"+'商品名称'+"</th>"+
									"<th>"+'商品单价'+"</th>"+
									"<th>"+'商品数量'+"</th>"+
									"<th>"+'采购日期'+"</th>"+
									"<th>"+'采购人'+"</th>"+
									"</tr>"
								);
								var i = 0;
								$("#tbody").empty();
								for( i=_this.size*(_this.current-1);i<_this.size*_this.current;i++) {
									if (i < goodsData.length) {
										$("#tbody").append("<tr style='text-align: center'>" +
											"<td>" + (goodsData[i].goods_id) + "</td>" +
											"<td>" + (goodsData[i].goods_name) + "</td>" +
											"<td>" + (goodsData[i].goods_price) + "</td>" +
											"<td>" + (goodsData[i].goods_num) + "</td>" +
											"<td>" + (goodsData[i].goods_time) + "</td>" +
											"<td>" + (goodsData[i].purchaseAgent) + "</td>" +
											"</tr>");
									}
								}
							}else{
							//	分发记录
								$("#thead").empty();
								$("#thead").append("<tr>"+
									"<th>"+'商品编号'+"</th>"+
									"<th>"+'商品名称'+"</th>"+
									"<th>"+'商品单价'+"</th>"+
									"<th>"+'商品数量'+"</th>"+
									"<th>"+'分发日期'+"</th>"+
									"<th>"+'物品用途'+"</th>"+
									"<th>"+'领取人'+"</th>"+
									"</tr>"
								);
								var i = 0;
								$("#tbody").empty();
								for( i=_this.size*(_this.current-1);i<_this.size*_this.current;i++) {
									if (i < goodsData.length) {
										$("#tbody").append("<tr style='text-align: center'>" +
											"<td>" + (goodsData[i].goods_id) + "</td>" +
											"<td>" + (goodsData[i].goods_name) + "</td>" +
											"<td>" + (goodsData[i].goods_price) + "</td>" +
											"<td>" + (goodsData[i].goods_num) + "</td>" +
											"<td>" + (goodsData[i].distri_time) + "</td>" +
											"<td>" + (goodsData[i].distri_path) + "</td>" +
											"<td>" + (goodsData[i].receiver) + "</td>" +
											"</tr>");
									}
								}
							}
								// 必须调用
							_this.setTotal(goodsData.length);
						}, 100);
					}
				});
				console.log(goodsData);
			},error:function (error) {
				alert("获取信息异常")
			}
		});
	});
});

