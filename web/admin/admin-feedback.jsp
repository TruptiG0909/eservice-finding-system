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
            <a href="#"><button disabled style="width: 100%; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Feedback List</button></a>
            <br><br>

            <table cellpadding="10" width="100%" class="table">
                <tr style="background-color:#096e9a; color:#fff;"><th>Date</th><th>Name</th><th>Message</th><th>Action</th></tr>
                <%
                 Database db=new Database();
                                    ResultSet rs=db.select_row("select * from testimonials");
                                    if(rs!=null){
                                        while(rs.next()){
                                            int c=rs.getInt("id");
                                            int user_id=rs.getInt("user_id");
                                            ResultSet res=db.select_row("select * from user_profile where user_id="+user_id);
                                            String msg=rs.getString("message");
                                            String testdate=rs.getString("testdate");
                                            res.next();
                %>
                    <tr style="background-color:#add8e6; color:#000;">
                        <td><%=testdate%></td>
                        <td><%=res.getString("full_name")%></td>
                        <td width="50%"><%=msg%></td>
                        <td align="center" width="20%">
                           <a href="javascript:remove('testimonials',<%=c%>);" class="btn btn-danger">Delete</a>
                        </td>
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


<script>
    
    function remove(tb,id){
        if(confirm("Are you sure?")){
        $.ajax({
            method:"POST",
            url:"Functions.jsp",
            data:{"action":"remove","tab":tb,"id":id},
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
    }
    
</script>