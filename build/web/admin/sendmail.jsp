<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<% if((String)session.getAttribute("adminuser")==null){
response.sendRedirect("index.jsp");
}
%>
<html>
<title>Admin Login</title>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <script src="../css/jquery.min.js"></script>
        <script src="../css/bootstrap.min.js"></script>
</head>
<body>
    <div style="background-color:#096e9a; color:#fff; width: 100%; ">
        <h3 style="padding: 15px; margin-left: 20px;">E-Service Finding - A platform to find and hire temporary workers online.</h3>
    </div>
    <div style=" width: 100%; height: 500px;">
       <%@ include file="sidebar.jsp" %>
        <div style="width: 80%; float: left; margin-left:10px; height: 100%;">
            <a href="#"><button disabled style="width: 100%; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Send Mail</button></a>
<br><br>
<%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Message sent successfully!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Message not sent!
                                    </div>
                                    <%
                                }
                            }
                        %>
            <form action="Functions.jsp" method="POST">
                <input type="hidden" name="action" value="sendmail"/>
                <input type="hidden" value='<%=request.getParameter("uid")%>' name="uid"/>
                <%
                Database db=new Database();
                String id=request.getParameter("uid");
                ResultSet rs=db.select_row("select * from user where id="+id);
                rs.next();
                %>
            <table cellspacing="10" width="70%">
                <tr><td><label>User Name : <%=rs.getString("username")%></label><br><br></td></tr>
                <tr><td><label>Subject</label><input type="text" class="form-control" placeholder="Enter Subject Name" name="sub" required="required"></td></tr>
                <tr><td><label>Message</label><textarea name="msg" class="form-control" placeholder="Write message" rows="5" style="width: 100%;" required="required"></textarea></td></tr>
                <tr><td colspan="2"><input type="submit" class="btn btn-success" value="Send"/> </td></tr>
            </table>
            </form>

        </div>
    </div>
    <div style="background-color:#096e9a; color:#fff; width: 100%; ">
        <h4 style="padding: 5px; text-align: center;"><p>Copyright &copy; 2024-25 <span>WA-FAC.</span> All rights reserved </p></h4>
    </div>
</body>
</html>
