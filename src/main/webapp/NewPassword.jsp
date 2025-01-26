<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reset Password</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.placeicon {
    font-family: fontawesome;
}

.custom-control-label::before {
    background-color: #dee2e6;
    border: #dee2e6;
}
</style>
</head>
<body class="bg-info">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
            <!-- White Container -->
            <div class="container bg-white rounded mt-2 mb-2 px-0 shadow">
                <!-- Main Heading -->
                <div class="row justify-content-center align-items-center pt-4">
                    <h1><strong>Reset Password</strong></h1>
                </div>
                <div class="pt-3 pb-3">
                    <form class="form-horizontal" action="NewPassword" method="post">
                        <!-- New Password Input -->
                        <div class="form-group row justify-content-center px-3">
                            <div class="col-9 px-0">
                                <input type="password" name="password" placeholder="New Password"
                                    class="form-control border-info" required aria-label="New Password">
                            </div>
                        </div>
                        <!-- Confirm Password Input -->
                        <div class="form-group row justify-content-center px-3">
                            <div class="col-9 px-0">
                                <input type="password" name="confPassword" placeholder="Confirm New Password"
                                    class="form-control border-info" required aria-label="Confirm Password">
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <div class="form-group row justify-content-center">
                            <div class="col-3 px-3 mt-3">
                                <button type="submit" class="btn btn-block btn-info">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Alternative Options -->
                <div class="bg-light">
                    <div class="px-4 pt-4">
                        <hr>
                    </div>
                    <div class="pt-2">
                        <div class="row justify-content-center">
                            <h5>
                                Don't have an Account? <a href="Register.jsp" class="text-danger">Register Now!</a>
                            </h5>
                        </div>
                        <div class="row justify-content-center align-items-center pt-4 pb-4">
                            <div class="col-4">
                                <!-- Optional Additional Content -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
