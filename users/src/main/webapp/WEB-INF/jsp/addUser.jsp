<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <strong><span class="icon-pencil-square-o"></span>新增用户</strong>
        <strong>
            <a class="float-right text-center text"
               onclick="history.back(-1);">返回</a>
        </strong>
    </div>

    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath }/user/addUser">

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">用户名(电话号码)：</label>
                </div>
                <div class="field">
                    <input placeholder="用户名" type="text" class="input w50" name="mobile"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">密码： </label>
                </div>
                <div class="field">
                    <input placeholder="长度限制在30位" type="text" class="input w50" name="password"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">地址：</label>
                </div>
                <div class="field">
                    <input placeholder="地址" type="text" class="input w50" name="address"
                           data-validate="required:请输入"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">邮箱：</label>
                </div>
                <div class="field">
                    <input placeholder="邮箱" type="text" class="input w50" name="email"
                           data-validate="required:请输入"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">生日：</label>
                </div>
                <div class="field">
                    <input type="text" class="datepicker-dropdown  input w50"
                           name="birthdate" placeholder="X年X月X日" data-validate="required:日期不能为空"
                           style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;"/>
                </div>
            </div>


            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">性别：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="sex">
                            <option value="0" selected="selected">男</option>
                            <option value="1">女</option>
                            <option value="2">保密</option>
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
                            <option value="1" selected="selected">已激活</option>
                            <option value="-1">未激活</option>
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
