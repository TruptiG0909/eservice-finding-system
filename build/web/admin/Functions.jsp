
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%
    Database db=new Database();
    String action=request.getParameter("action");
    System.out.println(action);
    ResultSet rs=null;
    int n=0;
    switch(action){
        case "adminlogin":
            String usernm=request.getParameter("uname");
            String pass=request.getParameter("pass");
            
            rs=db.select_row("select * from admin where username='"+usernm+"' and password='"+pass+"'");
            if(rs!=null){
                session.setAttribute("adminuser","admuser");
                response.sendRedirect("admin-home.jsp");
            }else{
                response.sendRedirect("index.jsp?status=0");
            }
            break;
         case "updatesstatus":
            String status=request.getParameter("status");
            String userid=request.getParameter("id");
            
            n=db.update_delete("update user set status="+status+" where id="+userid);
            System.out.println(n);
            if(n>0){
                out.println(1);
            }else{
                out.println(0);
            }
            break;
        case "remove":
            String tab=request.getParameter("tab");
            String userid1=request.getParameter("id");
            
            n=db.update_delete("delete from "+tab+" where id="+userid1);
            if(n>0){
                out.println(1);
            }else{
                out.println(0);
            }
            break;
        case "sendmail":
            String sub=request.getParameter("sub");
            String usrid=request.getParameter("uid");
            String msg=request.getParameter("msg");
            
            n=db.insert_update_delete("insert into inbox (user_id,subject,message) values('"+usrid+"','"+sub+"','"+msg+"')");
            if(n>0){
                response.sendRedirect("sendmail.jsp?status=1&uid="+usrid);
            }else{
                response.sendRedirect("sendmail.jsp?status=0&uid="+usrid);
            }
            break;
    }
    %>
