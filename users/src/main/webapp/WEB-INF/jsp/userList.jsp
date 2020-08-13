<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--  bs 需要的一个必须写的标签   -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>

    <style type="text/css">
        a {
            cursor: pointer;
        }
    </style>

</head>
<body>
<br>

<!--  显示列表 -->

<form id="listform">
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder">用户信息</strong>
            <strong>
                <a class="float-right text-center text"
                   onclick="history.back(-1);">返回</a>
            </strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main ring-hover"
                       href="${pageContext.request.contextPath}/user/select">所有用户</a>
                </li>
                <li>
                    <a class="button border-main icon-plus-square-o ring-hover"
                       href="${pageContext.request.contextPath}/user/toAddUser">新增用户</a>
                    <%--href="${pageContext.request.contextPath}/WEB-INF/jsp/addUser.jsp">新增用户</a>--%>
                </li>
            </ul>
        </div>
    </div>
</form>


<!--  表格显示内容 -->
<table class="table table-hover text-center">
    <tr>
        <th width="10%">用户名</th>
        <th width="10%">用户密码</th>
        <th width="10%">性别</th>
        <th width="20%">生日</th>
        <th width="10%">邮箱</th>
        <th width="10%">地址</th>
        <th width="10%">状态</th>
        <th width="20%">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.mobile}</td>
                <td>${user.password}</td>
                <td> <c:if test="${user.sex==0}">男</c:if>
                    <c:if test="${user.sex==1}">女</c:if>
                    <c:if test="${user.sex==2}">保密</c:if></td>
                <td>${user.birthdateStr}</td>
                <td>${user.email}</td>
                <td>${user.address}</td>
                <td class='<c:if test="${user.state==-1}"> alert-red</c:if>'>
                    <c:if test="${user.state==-1}">已删除</c:if>
                    <c:if test="${user.state==1}">已激活</c:if>
                </td>
                <td class="text-center">
                    <a class="button border-main"
                       href="${pageContext.request.contextPath}/user/modifyPage?id=${user.id}">
                        <span class="icon-edit"></span>修改
                    </a>
                    <a class="button border-red margin-large-left"
                        <%--href="${pageContext.request.contextPath}/user/delete?id=${user.id}">--%>
                       onclick="deleteManagerConfirm('${user.id}')">
                        <span class="icon-trash-o"></span>删除
                    </a>
                </td>
            </tr>
        </c:forEach>
    </div>
</table>

</body>
<script language="JavaScript">

    // 删除二次确认
    function deleteManagerConfirm(UserId) {
        if (window.confirm("确认删除吗？")) {
            window.location.href = "${pageContext.request.contextPath}/user/delete?id=" + UserId;
        }
    }


</script>
</html>