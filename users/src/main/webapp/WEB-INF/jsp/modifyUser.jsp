<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker-theme.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <style type="text/css">
        a {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span>修改读者信息</strong>
        <strong>
            <a class="float-right text-center text"
               onclick="history.back(-1);">返回</a>
        </strong>
    </div>

    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/user/modifyUser">

            <%--获取id--%>
            <div class="form-group">
                <div class="field">
                    <input type="hidden" class="input w50" name="id" value="${user.id}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="mobile"
                           data-validate="required:请输入" value="${user.mobile}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">密码： </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="password"
                           data-validate="required:请输入" value="${user.password}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">地址： </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="address"
                           data-validate="required:请输入" value="${user.address}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">邮箱： </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="email"
                           data-validate="required:请输入" value="${user.email}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">生日： </label>
                </div>
                <div class="field">
                    <input id="datatimepicker" type="text" class="datepicker-dropdown input w50" name="birthdate"
                           data-validate="required:请输入" value="${user.birthdateStr}"/>
                    <div class="tips"></div>
                </div>
            </div>


            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">性别：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="sex">
                            <option value="0" <c:if test="${user.sex==0}"> selected="selected"</c:if>>男</option>
                            <option value="1" <c:if test="${user.sex==1}"> selected="selected"</c:if>>女</option>
                            <option value="2" <c:if test="${user.sex==2}"> selected="selected"</c:if>>保密</option>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </if>
            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">状态：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="state">
                            <option value="-1" <c:if test="${user.sex==-1}"> selected="selected"</c:if>>已删除</option>
                            <option value="1" <c:if test="${user.sex==1}"> selected="selected"</c:if>>已激活</option>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </if>
            <div class="clear"></div>

            <div class="form-group text-big">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button type="submit" class="margin-large border radius-big button-big bg-green text-white">
                        保存
                    </button>
                    <button type="button" class="margin-large border radius-big button-big bg-blue text-white"
                            onclick="history.back(-1);">返回
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>

    $('.datepicker-dropdown').datepicker({
        minView: "month",
        format: "yyyy-mm-dd",
        language: 'zh-CN',
        autoClose: true
    });
</script>
</html>
