<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="content-wrapper">
    <form>
        <fieldset>
            <legend>修改员工</legend>
            <label>编号</label><input type="text" id="id1" value="${param.id}" disabled="disabled"/><br/>
            <label>姓名</label><input type="text" id="name" value="${param.name}"/><br/>
            <label>年龄</label><input type="text" id="age" value="${param.age}"/><br/>
            <label>工作</label><input type="text" id="job" value="${param.job}"/><br/>
            <label>工资</label><input type="text" id="salary" value="${param.salary}"/><br/>
            <input type="button" value="修改" id="modify">
        </fieldset>
    </form>
</div>
<script type="text/javascript" src="../../plugins/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $("#modify").click(function () {
        $.ajax({
            type: "post",
            data: {
                id: $("#id1").val(),
                name: $("#name").val(),
                age: $("#age").val(),
                job: $("#job").val(),
                salary: $("#salary").val()
            },
            url: "/employee/modify",
            success: function (data) {
                $("#content-wrapper").html(data);
            }
        });
    });

</script>