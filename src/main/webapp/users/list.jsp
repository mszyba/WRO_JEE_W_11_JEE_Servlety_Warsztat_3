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
                            <li class="breadcrumb-item active">Users Tables</li>
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
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Users Table</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nazwa użytkownika</th>
                                        <th>E-mail</th>
                                        <th>Usuń</th>
                                        <th>Edytuj</th>
                                        <th>Pokaż</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nazwa użytkownika</th>
                                        <th>E-mail</th>
                                        <th>Usuń</th>
                                        <th>Edytuj</th>
                                        <th>Pokaż</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.userName}</td>
                                            <td>${user.email}</td>
                                            <td>
                                                <a href="<c:url value="/user/delete?id=${user.id}" />" class="btn btn-danger btn-icon-split btn-sm">
                                            <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                            </span>
                                                    <span class="text">Usuń</span>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/user/edit?id=${user.id}" />" class="btn btn-warning btn-icon-split btn-sm">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-exclamation-triangle"></i>
                                                </span>
                                                    <span class="text">Edytuj</span>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/user/show?id=${user.id}" />" class="btn btn-info btn-icon-split btn-sm">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-info-circle"></i>
                                                </span>
                                                    <span class="text">Pokaż</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
<!-- DataTables  & Plugins -->
<script src="<c:url value="/themeAdminLTE/plugins/datatables/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-responsive/js/dataTables.responsive.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-buttons/js/dataTables.buttons.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/jszip/jszip.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/pdfmake/pdfmake.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/pdfmake/vfs_fonts.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-buttons/js/buttons.html5.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-buttons/js/buttons.print.min.js" />"></script>
<script src="<c:url value="/themeAdminLTE/plugins/datatables-buttons/js/buttons.colVis.min.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/themeAdminLTE/dist/js/adminlte.min.js" />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/themeAdminLTE/dist/js/demo.js" />"></script>
<!-- Page specific script -->
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>

</body>
</html>
