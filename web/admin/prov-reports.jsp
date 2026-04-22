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
            <a href="prov-reports.jsp?uid=<%=uid%>" class=""><button  style="width: 50%; float: left; font-size: large; background-color: darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Service Provider Request Reports</button></a>
            <a href="prov-serv-reports.jsp?uid=<%=uid%>" class=""><button  style="width: 50%; float: left; font-size: large; background-color:#009900; color: #fff; padding: 10px 5px 10px 5px;">Service Provider Service Reports</button></a>
            <br><br>
            <table cellpadding="10" width="100%" class="table">
                <tr style="background-color:#096e9a; color:#fff;"><th>Service Name</th><th>Service User</th><th>Date</th><th>Status</th></tr>
                        <%
                                    Database db=new Database();
                                    ResultSet rs=db.select_row("select * from user_request where service_prov_id="+uid);
                                    if(rs!=null){
                                        while(rs.next()){
                                            int c=rs.getInt("id");
                                            
                                            int user_id=rs.getInt("user_id");
                                            
                                            int service_prov_id=rs.getInt("service_prov_id");
                                            System.out.println(service_prov_id);
                                            int service_id=rs.getInt("service_id");
                                            String sertype=rs.getString("service_type");
                                            String status=rs.getString("status");
                                            ResultSet rse=null;
                                            if(sertype.equals("carp")){
                                                rse=db.select_row("select * from carpooling_service where id="+service_id);    
                                            }else if(sertype.equals("accom")){
                                                rse=db.select_row("select * from accommodation_service where id="+service_id);    
                                            }else if (sertype.equals("accom")) {
    rse = db.select_row("SELECT * FROM accommodation_service WHERE id=" + service_id);
} else if (sertype.equals("food")) {
    rse = db.select_row("SELECT * FROM food_service WHERE id=" + service_id);
}

if (rse != null && rse.next()) { // Ensure rse is not null before calling next()
    ResultSet resuser = db.select_row("SELECT * FROM service_provider_profile WHERE user_id=" + uid);
    if (resuser != null && resuser.next()) { // Ensure resuser is not null before calling next()

                                           
                                   %>
                                          <tr ><th style="padding: 10px;"><%=rse.getString("service_name")%></th>
                                              <th style="padding: 10px;"><%=resuser.getString("full_name")%></th>
                                              <th style="padding: 10px;"><%=rse.getString("date_created")%></th>
                                              <th style="padding: 10px;"><%=status%></th></tr>
                                     <% }}
                                        }
                                    }
                                     %>
            </table>

        </div>
    </div>
</body>
</html>
