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
    <div style="width: 100%; height: 500px;">
       <%@ include file="sidebar.jsp" %>
        <div style="width: 80%; float: left; margin-left:10px;">
            <a href="#"><button disabled style="width: 100%; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Inbox Mail List</button></a>
            <br><br>
            <table class="table" cellpadding="10" width="100%">
                <tr style="background-color:#096e9a; color:#fff;"><th>Name</th><th>Email-ID</th><th>Subject</th><th>Message</th></tr>
                <%
                Database db=new Database();
                ResultSet rs=db.select_row("select * from contact");
                if(rs!=null){
                    while(rs.next()){
                %>
                    <tr style="background-color:#add8e6; color:#000;">
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("subject")%></td>
                        <td><%=rs.getString("message")%></td>
                        
                    </tr>
                <%
                    }
                }
                
                ResultSet rs1=db.select_row("select * from inbox");
                if(rs1!=null){
                    while(rs1.next()){
                        int id=rs1.getInt("user_id");
                        ResultSet rs3=db.select_row("select * from user where id="+id);
                        rs3.next();
                %>    
                
                <tr style="background-color:#add8e6; color:#000;">
                    <td><%=rs3.getString("username")%></td>
                    <td></td>
                    <td><%=rs1.getString("subject")%></td>
                    <td><%=rs1.getString("message")%></td>
                </tr>
                <%
                    }
                }
                
                %>
            </table>

        </div>
	
    </div>
   
</body>
</html>
