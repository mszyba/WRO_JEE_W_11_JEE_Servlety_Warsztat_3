<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>User List</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" />"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/theme/css/sb-admin-2.min.css"/>" rel="stylesheet">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!--sidebar-->
    <%@ include file="/sidebar.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->

            <!-- Topbar Navbar -->
            <%@ include file="/header.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">UserCRUD</h1>
                    <a href="<c:url value="/user/list" />" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-th-list fa-sm text-white-50"></i> Lista użytkowników</a>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
                    </div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group col-md-6">
                            <label for="userName">Nazwa</label>
                            <input name="userName" type="text" class="form-control" id="userName" placeholder="Nazwa użytkownika" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="userEmail">Email</label>
                            <input name="userEmail" type="email" class="form-control" id="userEmail" placeholder="Email użytkownika" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="userPassword">Hasło</label>
                            <input name="userPassword" type="password" class="form-control" id="userPassword" placeholder="Hasło użytkownika" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Zapisz</button>
                    </form>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@ include file="/footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/theme/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/theme/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/theme/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/theme/vendor/jquery-easing/jquery.easing.min.js" />"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/theme/js/sb-admin-2.min.js" />"></script>

<!-- Page level plugins -->
<script src="<c:url value="/theme/vendor/chart.js/Chart.min.js" />"></script>

<!-- Page level custom scripts -->
<script src="<c:url value="/theme/js/demo/chart-area-demo.js" />"></script>
<script src="<c:url value="/theme/js/demo/chart-pie-demo.js" />"></script>

</body>

</html>