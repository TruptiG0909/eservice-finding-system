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
    <div style="background-color:#096e9a;float:left; color:#fff; width: 100%; ">
        <h3 style="padding: 15px; margin-left: 20px;">E-Service Finding - A platform to find and hire temporary workers online.</h3>
    </div>
    <div style=" width: 100%; float:left;">
       <%@ include file="sidebar.jsp" %>
        <div style="width: 80%; float: left; margin-left:10px;">
            <a href="#"><button disabled style="width: 100%; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Service User List</button></a>
<br><br>
<table class="table" cellpadding="10" width="100%">
    <tr style="background-color:#096e9a; color:#fff;"><th>Username</th><th>Full name</th><th>Address</th><th>Mobile No.</th><th>Email-ID</th><th class="text-center">Action</th></tr>
          <%
          Database db=new Database();
          ResultSet rs=db.select_row("select * from user where user_role='user'");
          if(rs!=null){
              while(rs.next()){
                  int id=rs.getInt("id");
                  int status=rs.getInt("status");
                  ResultSet rs2=db.select_row("select * from user_profile where user_id="+id);
                  if(rs2!=null){
                  if(rs2.next()){
          %>
                        <tr style="background-color:#add8e6; color:#000;">
                            <td><%=rs.getString("username")%></td>
                            <td><%=rs2.getString("full_name")%></td>
                            <td><%=rs2.getString("address")%></td>
                            <td><%=rs2.getString("mobile_no")%></td>
                            <td><%=rs2.getString("email_id")%></td>
                            <td align="center" width="20%">
                            <%
                            if(status==1){
                            %>
                            <a href="javascript:updatestatus(0,<%=id%>);" class="btn btn-danger">In-active</a>
                            <%
                            }else{
                            %>
                            <a href="javascript:updatestatus(1,<%=id%>);" class="btn btn-success">Active</a>
                            <%    
                            }
                            %>    
                                <a href="sendmail.jsp?uid=<%=id%>"><button class="btn btn-primary">Send Mail</button></a>
                                <br><br><a href="user-reports.jsp?uid=<%=id%>"><button class="btn btn-default">View Reports</button></a>
                            </td>
                        </tr>
          <%    }}
              }
          }
          %>
            </table>

        </div>
	
    </div>
</body>
</html>
<script>
    function updatestatus(st,id){
        
        $.ajax({
            method:"POST",
            url:"Functions.jsp",
            data:{"action":"updatesstatus","status":st,"id":id},
            success:function(res){
                //alert(res);
                if(res==1){
                    window.location.reload();
                }else{
                    window.location.reload();
                }
            }
            
        });
    }
</script>
    