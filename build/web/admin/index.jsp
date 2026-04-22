<html>
    <head>
        <title>E-Service Finding - A platform to find and hire temporary workers online.</title>
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <script src="../css/jquery.min.js"></script>
        <script src="../css/bootstrap.min.js"></script>
    </head>
    <body>
        <div style="background-color:#096e9a; color:#fff; width: 100%; ">
            <h3 style="padding: 15px; margin-left: 20px;">E-Service Finding - A platform to find and hire temporary workers online.</h3>
        </div>
        <div style="background-color: #d3d3d3; width: 100%; height: 470px;">
            
            <form class="col-md-4" action="Functions.jsp" method="post" style="padding: 50px;">
                <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("0")){
                                    %>
                                    <div class="alert alert-danger">
                                        Username/Password Invalid!
                                    </div>
                                    <%
                                }
                            }
                        %>
                <input type="hidden" value="adminlogin" name="action" />
                <table class="table table-bordered table-condensed">
                    <caption class="text-center">Admin Login</caption>
                    <tr><th>Username</th><td><input type="text" required class="form-control" name="uname"/> </td></tr>
                    <tr><th>Password</th><td><input type="password" placeholder="********" class="form-control" required name="pass"/> </td></tr>
                    <tr><th colspan="2" class="text-center"><input type="submit" style="margin-right: 10px;" class="btn btn-primary" value="Login"/>
                            <input style="margin-left: 10px;" type="reset"  class="btn btn-default" name="" value="Reset"/> </th></tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
