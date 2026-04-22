<%-- 
    Document   : WebService
    Created on : Jan 26, 2018, 10:30:10 AM
    Author     : Brothers
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db=new Database();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "requestsend":
            String provid=request.getParameter("provid");
            String type=request.getParameter("type");
            String sid=request.getParameter("sid");
            
            if((String)session.getAttribute("userlogin")==null){
                out.println(0);
            }else{
                
                String userid=(String)session.getAttribute("userlogin");
                ResultSet ress=db.select_row("select * from user_request where user_id="+userid+" and service_prov_id="+provid+" and service_id="+sid+" and service_type='"+type+"'");
                
                if (ress.next() == false) {
                    int res=db.insert_update_delete("insert into user_request (user_id,service_prov_id,service_id,service_type,status) values("+userid+","+provid+","+sid+",'"+type+"','pending')");
                    if(res>0){
                     out.println(1);
                    }
                    
                }else{
                    out.println(2);
                }
            }
            break;
        case "newuserreg":
            String fname=request.getParameter("fname");
            String uname=request.getParameter("uname");
            String address=request.getParameter("address");
            String pass=request.getParameter("pass");
            String num=request.getParameter("num");
            String email=request.getParameter("email");
            
            int res=db.insert_update_delete("insert into user (`username`, `password`, `user_role`, `status`) VALUES ('"+uname+"','"+pass+"','user','0')");
            if(res>=1){
                int res2=db.insert_update_delete("INSERT INTO `user_profile` ( `user_id`, `full_name`, `address`, `mobile_no`, `email_id`, `image`) VALUES ('"+res+"','"+fname+"','"+address+"','"+num+"','"+email+"','')");
                if(res2>1){
                    response.sendRedirect("../login.jsp?status=1");
                }
            }
            break;
        case "loginuser":
            String username=request.getParameter("uname");
            String password=request.getParameter("pass");            
            String resuser=db.checkUserLogin(username, password);
            if(resuser=="0"){
                response.sendRedirect("../login.jsp?status=0");
            }else{
                session.setAttribute("userlogin",resuser);
                response.sendRedirect("../index.jsp");
            }
            break;
        case "serviceprovlogin":
            String username1=request.getParameter("uname");
            String password1=request.getParameter("pass");            
            String resuser1=db.checkServiceUserLogin(username1, password1);
            if(resuser1=="0"){
                response.sendRedirect("../login.jsp?status=0");
            }else{
                session.setAttribute("servicelogin",resuser1);
                response.sendRedirect("../service-home.jsp");
            }
            break;
        case "updateuserprofie":
            String uid=request.getParameter("uid");
            String fname1=request.getParameter("fname"); 
            String address1=request.getParameter("address"); 
            String num1=request.getParameter("num"); 
            String email1=request.getParameter("email"); 
            int resuserpro=db.update_delete("update user_profile set full_name='"+fname1+"', address='"+address1+"',mobile_no='"+num1+"',email_id='"+email1+"' where user_id="+uid);
            if(resuserpro>0){
                response.sendRedirect("../user-profile.jsp?status=1");
            }else{
                response.sendRedirect("../user-profile.jsp?status=0");
            }
            break;
        case "updatepassword":
            int userid=Integer.parseInt((String)session.getAttribute("userlogin"));
            String pwd=request.getParameter("pwd"); 
            String npwd=request.getParameter("npwd");
            int userpro=db.update_delete("update user set password='"+npwd+"' where password='"+pwd+"' and id="+userid);
            if(userpro>0){
                response.sendRedirect("../user-pwd.jsp?status=1");
            }else{
                response.sendRedirect("../user-pwd.jsp?status=0");
            }
            break;
        case "updatestatusrequest":
            String reqstatus=request.getParameter("status"); 
            String userreqid=request.getParameter("userreqid");
            int userreqres=db.update_delete("update user_request set status='"+reqstatus+"' where id="+userreqid);
            if(userreqres>0){
                out.print(1);
            }else{
                out.print(0);
            }
            break;
        case "paypayment":
            String typecomm=request.getParameter("type"); 
            String userreqidcomm=request.getParameter("userreqid");
            int userreqress=db.update_delete("update user_request set status='pay' where id="+userreqidcomm);
            if(userreqress>0){
                db.insert_update_delete("insert into comments(user_request_id,comment) values('"+userreqidcomm+"','"+typecomm+"')");
                out.print(1);
            }else{
                out.print(0);
            }
            break;
            
        case "sendmsg":
            String msg=request.getParameter("msg"); 
            String service=request.getParameter("type"); 
            String userreqidmsg=request.getParameter("userreqid");
            int userreqressd=db.insert_update_delete("insert into messages(user_request_id,message,sender) values('"+userreqidmsg+"','"+msg+"','"+service+"')");
            if(userreqressd>0){
                out.print(1);
            }else{
                out.print(0);
            }
            break;
         case "newserviceuserreg":
            String fname2=request.getParameter("fname");
            String uname2=request.getParameter("uname");
            String address2=request.getParameter("address");
            String pass2=request.getParameter("pass");
            String num2=request.getParameter("num");
            String email2=request.getParameter("email");
            
            int res2=db.insert_update_delete("insert into user (`username`, `password`, `user_role`, `status`) VALUES ('"+uname2+"','"+pass2+"','service_provider','0')");
            if(res2>1){
                int res22=db.insert_update_delete("INSERT INTO `service_provider_profile` ( `user_id`, `full_name`, `address`, `mobile_no`, `email_id`, `image`) VALUES ('"+res2+"','"+fname2+"','"+address2+"','"+num2+"','"+email2+"','')");
                if(res22>1){
                    response.sendRedirect("../login.jsp?status=1");
                }
            }
            break;
        case "updateserviceprof":
            String fname3=request.getParameter("fname");
            String address3=request.getParameter("address");
            String num3=request.getParameter("num");
            String email3=request.getParameter("email");
            String descr=request.getParameter("descr");
            int serid=Integer.parseInt((String)session.getAttribute("servicelogin"));
                int res22=db.update_delete("update `service_provider_profile` set `full_name`='"+fname3+"', `address`='"+address3+"', `mobile_no`='"+num3+"', `email_id`='"+email3+"',descr='"+descr+"' where user_id="+serid);
                if(res22>0){
                    response.sendRedirect("../service-profile.jsp?status=1");
                }else{
                    response.sendRedirect("../service-profile.jsp?status=0");
                }
            
            break;
        case "updateservicepwd":
            int servid=Integer.parseInt((String)session.getAttribute("servicelogin"));
            String pwds=request.getParameter("pwd"); 
            String npwds=request.getParameter("npwd");
            int userpros=db.update_delete("update user set password='"+npwds+"' where password='"+pwds+"' and id="+servid);
            if(userpros>0){
                response.sendRedirect("../service-pwd.jsp?status=1");
            }else{
                response.sendRedirect("../service-pwd.jsp?status=0");
            }
            break;
         case "postservice":
            String service_type=request.getParameter("service_type");
            String service_name=request.getParameter("service_name");
            String start_price=request.getParameter("start_price");
            String end_price=request.getParameter("end_price");
            String facilities=request.getParameter("facilities");
            int us=Integer.parseInt((String)session.getAttribute("servicelogin"));
            
            int resfoodintert=db.insert_update_delete("insert into services (`service_name`, `facilities`, `service_type`, `start_price`, `end_price`, `service_provider_id`, `status`, `image`) VALUES ('"+service_name+"','"+facilities+"','"+service_type+"','"+start_price+"','"+end_price+"','"+us+"','1','')");
            if(resfoodintert>=1){
               response.sendRedirect("../add-service.jsp?status=1");
            }
            break;
        case "updateservice":
            String uservice_type=request.getParameter("service_type");
            String uservice_name=request.getParameter("service_name");
            String ustart_price=request.getParameter("start_price");
            String uend_price=request.getParameter("end_price");
            String ufacilities=request.getParameter("facilities");
            String urid=request.getParameter("id");
            int uus=Integer.parseInt((String)session.getAttribute("servicelogin"));
            
            int uresfoodintert=db.insert_update_delete("update services set `service_name`='"+uservice_name+"',`facilities`='"+ufacilities+"',`service_type`='"+uservice_type+"',`start_price`='"+ustart_price+"',`end_price`='"+uend_price+"' where id = "+urid);
            if(uresfoodintert>=1){
               response.sendRedirect("../my-services.jsp?status=1");
            }
            response.sendRedirect("../my-services.jsp?status=1");
            break;
        case "addcontact":
            String name=request.getParameter("name");
            String emaill=request.getParameter("email");
            String subject=request.getParameter("subject");
            String message=request.getParameter("message");
          
            int resaddcontact=db.insert_update_delete("insert into contact (`name`, `email`, `subject`, `message`) VALUES ('"+name+"','"+emaill+"','"+subject+"','"+message+"')");
            if(resaddcontact>=1){
               response.sendRedirect("../contact.jsp?status=1");
            }
            break;
        case "userforgotpassowrd":
            String forgotemail=request.getParameter("email");
            int resuserforgot=db.checkUserEmailExist(forgotemail);
            if(resuserforgot > 0){
                    String noo=db.getRandomNumberString();
                    System.out.println(noo);
                    String subject1 = "New OTP for reset Password";
                    session.setAttribute("otpsession",noo);
                    db.URLConnectionReader(forgotemail, forgotemail, noo, subject1);
                response.sendRedirect("../user-reset-password.jsp?status=1&email="+forgotemail);
            }else{
                response.sendRedirect("../user-forgot-password.jsp?status=0");
            }
            break;
        case "userresetpassword":
            String otp1=request.getParameter("otp");
            String forgotemail1=request.getParameter("email");
            String pass1=request.getParameter("pass");
            String confpass=request.getParameter("confpass");
            int resuserforgot1=db.checkUserEmailExist(forgotemail1);
            if(resuserforgot1 > 0){
                if(pass1.equals(confpass)){
                    String otpsess = "";
                    try{
                       otpsess=(String)session.getAttribute("otpsession");
                    }catch(Exception e){
                        otpsess = "";
                    }
            
                    if(otpsess.equals(otp1)){
                            int userpro1=db.update_delete("update user set password='"+pass1+"' where id="+resuserforgot1);
                            if(userpro1>0){
                                response.sendRedirect("../login.jsp?status=11");
                            }else{
                                response.sendRedirect("../login.jsp?status=10");
                            }
                        }
                        else{
                            response.sendRedirect("../user-reset-password.jsp?status=2&email="+forgotemail1);
                        }
                }else{
                    response.sendRedirect("../user-reset-password.jsp?status=3&email="+forgotemail1);
                }
                
            }else{
                response.sendRedirect("../user-forgot-password.jsp?status=0");
            }
        break;
            
            case "serviceforgotpassowrd":
                String sforgotemail=request.getParameter("email");
                int sresuserforgot=db.checkServiceEmailExist(sforgotemail);
                if(sresuserforgot > 0){
                        String noo=db.getRandomNumberString();
                        System.out.println(noo);
                        String subject1 = "New OTP for reset Password";
                        session.setAttribute("otpsession",noo);
                        db.URLConnectionReader(sforgotemail, sforgotemail, noo, subject1);
                    response.sendRedirect("../service-reset-password.jsp?status=1&email="+sforgotemail);
                }else{
                    response.sendRedirect("../service-forgot-password.jsp?status=0");
                }
            break;
            
            case "serviceresetpassword":
            String sotp1=request.getParameter("otp");
            String sforgotemail1=request.getParameter("email");
            String spass1=request.getParameter("pass");
            String sconfpass=request.getParameter("confpass");
            int sresuserforgot1=db.checkServiceEmailExist(sforgotemail1);
            if(sresuserforgot1 > 0){
                if(spass1.equals(sconfpass)){
                    String otpsess = "";
                    try{
                       otpsess=(String)session.getAttribute("otpsession");
                    }catch(Exception e){
                        otpsess = "";
                    }
            
                    if(otpsess.equals(sotp1)){
                            int userpro1=db.update_delete("update user set password='"+spass1+"' where id="+sresuserforgot1);
                            if(userpro1>0){
                                response.sendRedirect("../login.jsp?status=11");
                            }else{
                                response.sendRedirect("../login.jsp?status=10");
                            }
                        }
                        else{
                            response.sendRedirect("../service-reset-password.jsp?status=2&email="+sforgotemail1);
                        }
                }else{
                    response.sendRedirect("../service-reset-password.jsp?status=3&email="+sforgotemail1);
                }
                
            }else{
                response.sendRedirect("../service-forgot-password.jsp?status=0");
            }
        break;
    }
    %>
