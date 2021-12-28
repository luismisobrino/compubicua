import com.google.gson.Gson;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ServletAjax extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        String db_url= "jdbc:mysql://localhost:3306/pruebadb";
        String user="demo";
        String pass="demo";
        String name= request.getParameter("name");
        String sql=null;
        String realPwd=null;
        Connection con= null;
        Statement stat=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(db_url,user,pass);
            stat= con.createStatement();
            sql="Select password from login where user= 'hugo'";
            ResultSet rs= stat.executeQuery(sql);
            rs.next();
            realPwd= rs.getString("password");
            rs.close();
            con.close();
            String json= new Gson().toJson(realPwd);
            out.print(json);
        }catch(Exception e){ out.print(e);

       }
    }
}
	
