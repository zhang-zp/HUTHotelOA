//各种弹窗提醒--张赵鹏

//人事管理--添加管理
function loginAddConfirm() {
    if((document.getElementById("loginStaffAdd").value).indexOf("请选择工号")>=0){
        console.log(document.getElementById("loginStaffAdd").value);
        var flag = confirm("请先选择要添加员工工号！");
        return false;
    }else {
        var flag1 = confirm("确认添加此管理吗？") ;
        if(flag1){
            alert("添加成功！");
            return true;
        }else{
            alert("取消添加！");
            return false;
        }
    }

}

//仓库管理--商品分发
function disConfirm() {
    if((document.getElementById("shopName").value).indexOf("请选择分发商品名称")>=0){
        console.log(document.getElementById("shopName").value);
        var flag = confirm("请先选择商品名称！") ;
        return false;
    }else {
        var flag1 = confirm("确认分发该物品吗？") ;
        if(flag1){
            alert("分发成功！");
            return true;
        }else{
            alert("取消分发！");
            return false;
        }
    }
}