package database;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.*;
import java.util.Random;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_service","root","");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    
    public Boolean checkLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from server_login where username=? and password=?");
            pst.setString(1, uname);
            pst.setString(2, pwd);
            rs=pst.executeQuery();
            
            if(rs.next())
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean checkCurrentPwdExist(String pwd)
    {
        try {
            pst=con.prepareStatement("select * from server_login where password=?");
            pst.setString(1, pwd);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public int checkUserEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select u.id from user u left join user_profile up on u.id=up.user_id  where up.email_id=? and u.status=1");
            pst.setString(1, email);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getInt("id");
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int checkServiceEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select u.id from user u left join service_provider_profile up on u.id=up.user_id  where up.email_id=? and u.status=1");
            pst.setString(1, email);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getInt("id");
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public boolean updateUserImage(int userid,String saveFile){
         try {
            pst=con.prepareStatement("update user_profile set image='"+saveFile+"' where user_id="+userid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public String checkUserLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from user where username='"+uname+"' and password='"+pwd+"' and user_role='user' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("id");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return "0";
    }
    
    public String checkServiceUserLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from user where username='"+uname+"' and password='"+pwd+"' and user_role='service_provider' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("id");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return "0";
    }
    public ResultSet select_row(String query)
    {
        try {
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            if(rs!=null)
            {
                System.out.println(1);
                return rs;
            }
            else
            {
                return null;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public int insert_update_delete(String query)
    {
        try {
            pst=con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            int n=pst.executeUpdate();
            ResultSet rs = pst.getGeneratedKeys();
            if(n==1)
            {
                rs.first();
                int last_inserted_id = rs.getInt(1);
                return last_inserted_id;
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
        public int update_delete(String query)
    {
        try {
            pst=con.prepareStatement(query);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public Boolean changePassword(String pwd1)
    {
        try {
            pst=con.prepareStatement("update server_login set password='"+pwd1+"'");
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            System.out.println("error while val"+e);
            return false;
        }
    }
    
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
    public void URLConnectionReader(String email,String name,String otp,String subject) throws MalformedURLException, IOException {
        
            URL yahoo = new URL("http://threeartisans.com/sendmail.php?type=elabor&email="+email+"&full_name="+name+"&otp="+otp+"&subject="+URLEncoder.encode(subject , "UTF-8" ));
            URLConnection yc = yahoo.openConnection();
            BufferedReader in = new BufferedReader(
                                    new InputStreamReader(
                                    yc.getInputStream()));
            String inputLine;
            System.out.println(yahoo);
            while ((inputLine = in.readLine()) != null) 
                System.out.println(inputLine);
            in.close();
    }
}

