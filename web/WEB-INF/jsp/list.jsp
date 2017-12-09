<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理系统</title>
    <style>

        * {
            margin: 0;
            padding: 0;
        }

        body {
            font: 14px/1.4 "Microsoft Yahei", Tahoma, Georgia, Serif;
        }

        #page-wrap {
            margin: 10px;
        }

        p {
            margin: 20px 0;
        }

        /*
        Generic Styling, for Desktops/Laptops
        */
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff
        }

        /* Zebra striping */
        tr:nth-of-type(odd) {
            background: #eee;
        }

        th {
            background: #333;
            color: white;
            font-weight: bold;
        }

        td, th {
            padding: 6px;
            border: 1px solid #ccc;
            text-align: left;
        }

        @media only screen and (max-width: 760px),
        (min-device-width: 768px) and (max-device-width: 1024px) {

            /* Force table to not be like tables anymore */
            table, thead, tbody, th, td, tr {
                display: block;
            }

            /* Hide table headers (but not display: none;, for accessibility) */
            thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            tr {
                border: 1px solid #ccc;
            }

            td {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                padding-left: 50%;
            }

            td:before {
                /* Now like a table header */
                position: absolute;
                /* Top/left values mimic padding */
                top: 6px;
                left: 6px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
            }

            /*
            Label the data
            */
            td:nth-of-type(1):before {
                content: "编号";
            }

            td:nth-of-type(2):before {
                content: "姓名";
            }

            td:nth-of-type(3):before {
                content: "年龄";
            }

            td:nth-of-type(4):before {
                content: "工作";
            }

            td:nth-of-type(5):before {
                content: "工资";
            }

            td:nth-of-type(6):before {
                content: "修改";
            }
        }

        /* Smartphones (portrait and landscape) ----------- */
        @media only screen
        and (min-device-width: 320px)
        and (max-device-width: 480px) {
            body {
                padding: 0;
                margin: 0;
            }
        }

        /* iPads (portrait and landscape) ----------- */
        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
            body {
                width: 100%;
            }
        }

    </style>
    <!--<![endif]-->
</head>

<body>

<div id="page-wrap" style="margin:50px 0 0">
    <table>
        <thead>
        <tr>
            <th>编号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>工作</th>
            <th>工资</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${empList}" var="emp">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.name}</td>
                <td>${emp.age}</td>
                <td>${emp.job}</td>
                <td>${emp.salary}</td>
                <td><a href="/employee/load?id=${emp.id}&name=${emp.name}&age=${emp.age}&job=${emp.job}&salary=${emp.salary}">
                    修改</a><a href="/employee/delete?id=${emp.id}">删除</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <input type="button" id="add" value="增加" />
</div>
</body>
</HTML>
<script type="text/javascript" src="../../plugins/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $("#add").click(function () {
        $.ajax({
            type:"post",
            url:"/employee/add",
            success:function (data) {
                $("#page-wrap").html(data);
            }
        });
    });
</script>