<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Users Table</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/themeAdminLTE/plugins/fontawesome-free/css/all.min.css"/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value="/themeAdminLTE/dist/css/adminlte.min.css"/>">
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
    <!-- Navbar -->
    <%@ include file="/header.jsp" %>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <%@ include file="/sidebar.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>CRUD User</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Add user</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-6">
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">Add user</h3>
                            </div>

                            <c:if test="${cookie.containsKey('emailExist')}">
                                <%@ include file="errorEmailExist.jsp" %>
                            </c:if>
                            <c:if test="${cookie.containsKey('emailNotVerify')}">
                                <%@ include file="errorEmailNotVerify.jsp" %>
                            </c:if>

                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post">
                                <div class="form-group col-md-10">
                                    <label for="userName">Name</label>
                                    <input name="userName" type="text" class="form-control" id="userName" placeholder="Nazwa użytkownika" required>
                                </div>
                                <div class="form-group col-md-10">
                                    <label for="userEmail">Email</label>
                                    <input name="userEmail" type="email" class="form-control" id="userEmail" placeholder="Email użytkownika" required>
                                </div>
                                <div class="form-group col-md-10">
                                    <label for="userPassword">Password</label>
                                    <input name="userPassword" type="password" class="form-control" id="userPassword" placeholder="Hasło użytkownika" required>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-info">Submit</button>
                                </div>
                            </form>

                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Footer -->
    <%@ include file="/footer.jsp" %>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<c:url value="/themeAdminLTE/plugins/jquery/jquery.min.js" />"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value="/themeAdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/themeAdminLTE/dist/js/adminlte.min.js" />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/themeAdminLTE/dist/js/demo.js" />"></script>
</body>
</html>
