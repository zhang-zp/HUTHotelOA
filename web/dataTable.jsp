<%--
  Created by IntelliJ IDEA.
  User: 95702
  Date: 2019/11/1
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>--%>
<html>
<head>
<!-- DataTables -->
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="lib/datatables/1.10.0/jquery.dataTables.min.css">
<script type="text/javascript"  charset="utf8" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<%--    <title>仓库采购</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="css/theme.css">--%>
<%--    <link rel="stylesheet" href="css/buy.css" />--%>
<%--    <script type="text/javascript" src="js/main.js"></script>--%>
</head>
<body>
        
    <table border="1" class="dataTable display" id="dataTable">
            
        <tr>
            <th>职工编号</th>
            <th>职工姓名</th>
            <th>职工性别</th>
            <th>职工年龄</th>
            <th>手机号码</th>
            <th>职工部门</th>
            <th>职工职位</th>
            <th>职工薪资</th>
            <th>身份证号</th>
            <th>入职时间</th>
        </tr>
<%--        <c:forEach var="list" items="${staffInfo}">--%>
<%--            <tr>--%>
<%--                <td>${list.staff_id}</td>--%>
<%--                <td>${list.staff_name}</td>--%>
<%--                <td>${list.staff_sex}</td>--%>
<%--                <td>${list.staff_age}</td>--%>
<%--                <td>${list.staff_tel}</td>--%>
<%--                <td>${list.dept_name}</td>--%>
<%--                <td>${list.staff_job}</td>--%>
<%--                <td>${list.staff_salary}</td>--%>
<%--                <td>${list.staff_num}</td>--%>
<%--                <td>${list.entry_time}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
    </table>
        
        
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dataTable').DataTable({
                "pageLength": 10,         //初始化显示几条数据
                "fixedHeader": true,      //这个是用来固定头部
                "lengthMenu": [　                           //显示几条数据设置
                    [5, 10, 20, -1],
                    ['5 条', '10 条', '20 条', '全部']
                ],

                "language": {                              // 这是修改语言的显示
                    buttons: {
                        pageLength: {
                            _: "显示%d条",
                            '-1': "全部显示"
                        }
                    },
                    paginate: {
                        first: "首条",
                        previous: "前一页",
                        next: "下一页",
                        last: "末页"
                    },
                    "info": "第_PAGE_页,共_PAGES_页",
                    "infoEmpty": "未找到相关数据",
                    "search": "关键字",
                    "zeroRecords": "未找到相关数据",
                    "decimal": ".",
                    "thousands": ","
                },

                "PaginationType": "full_numbers",
                "ServerMethod": "POST",
                "AjaxSource": "/hobbiey/showALLHobbies",
                "columns": [
                    //返回的是AjaxSource的 ALLHobbies 对象-把 Hobbies 的属性放在 data 中

                    {"data": ""},         //单选框
                    {"data": "hid"},
                    {"data": "hname"},
                    {"data": "hkinds"},
                    {"data": "hnum"}
                ],
                "columnDefs": [   //列定义
                    {
                        "targets": [4],
                        "data": "hid",
                        "render": function (data, type, full) {
                            return "<a href='/hobbiey/updateHobbie?hid=" + full.hid + "'>修改</a> <a href='/hobbiey/delteHobbie?hid=" + full.hid + "'>删除</a>";
                        }
                    }]
            });
        });
    </script>
        


</body>
</html>
