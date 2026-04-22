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
            <a href="#" class=""><button disabled style="width: 100%; font-size: large; background-color:darkgreen; color: #fff; padding: 10px 5px 10px 5px;">Service User Service Request Reports</button></a>
            <br><br>
            <%
        String uid=request.getParameter("uid");
        %>
            <table cellpadding="10" width="100%" class='table'>
                <tr style="background-color:#096e9a; color:#fff;"><th>Service Name</th><th>Service Provider</th><th>Date</th><th>Status</th></tr>
                <%
                                    Database db=new Database();
                                    ResultSet rs=db.select_row("select * from user_request where user_id="+uid);
                                    if(rs!=null){
                                        while(rs.next()){
                                            int c=rs.getInt("id");
                                            
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
                                            }else if(sertype.equals("food")){
                                                rse=db.select_row("select * from food_service where id="+service_id);    
                                            }
                                            try{
                                            if(rse.next()!=false){
                                            rse.next();
                                            ResultSet resser=db.select_row("select * from service_provider_profile where service_prov_id="+service_prov_id);
                                            
                                            if(resser.next()){
                                   %>
                                          <tr ><th style="padding: 10px;"><%=resser.getString("full_name")%></th>
                                              <th style="padding: 10px;"><%=sertype%></th><th style="padding: 10px;"><%=rse.getString("service_name")%></th>
                                              <th style="padding: 10px;"><%=status%></th></tr>
                                     <% }
                                        }}catch(Exception e){
                                            
                                        }
                                            }
                                    }
                                     %>
            </table>

        </div>
    </div>
</body>
</html>
