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
        <%
        String uid=request.getParameter("uid");
        %>
        <div style="width: 80%; float: left; margin-left:10px; height: 100%;">
            <a href="prov-reports.jsp?uid=<%=uid%>" class=""><button  style="width: 50%; float: left; font-size: large; background-color: #009900; color: #fff; padding: 10px 5px 10px 5px;">Service Provider Request Reports</button></a>
            <a href="prov-serv-reports.jsp?uid=<%=uid%>" class=""><button  style="width: 50%; float: left; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Service Provider Service Reports</button></a>
            <br><br>
            <table cellpadding="10" width="100%" class="table">
                <tr style="background-color:#096e9a; color:#fff;"><th>Service Name</th><th>Service Price</th><th>Date</th></tr>
                <%
                    Database db=new Database();
                    ResultSet rse=db.select_row("select service_name,price,date_created from carpooling_service where service_id="+uid+" UNION ALL select service_name,price,date_created from food_service where service_id="+uid+" UNION ALL select service_name,price,date_created from accommodation_service where service_id="+uid);    
                    if(rse!=null){
                        while(rse.next()){
                            %>
                            <tr style="background-color:#add8e6; color:#000;">
                                <td align=""><%=rse.getString("service_name")%></td>
                                <td align=""><%=rse.getString("price")%></td>
                                <td align=""><%=rse.getString("date_created")%></td>
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
