import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class checklogin extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		String name= request.getParameter("name");
		String pwd= request.getParameter("pwd");
		String db_url= "jdbc:mysql://localhost:3306/pruebadb";
		String user="demo";
		String pass="demo";
		
		String realPwd=null;
		String sql=null;
	
		Connection con= null;
		Statement stat=null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(db_url,user,pass);
			stat= con.createStatement();
			sql="Select password from login where user='"+name+"'";
			ResultSet rs= stat.executeQuery(sql);
			rs.next();
			realPwd= rs.getString("password");
			rs.close();
			con.close();			
		}catch(SQLException se){ 
			out.print("<h2>Usuario o contraseña incorrectos</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("/loginform.html");
			rd.include(request,response);
			}
		catch(Exception e){ out.print(e);}
		
		if(realPwd.equals(pwd)){
			RequestDispatcher rd= request.getRequestDispatcher("/welcome.html");	
			rd.forward(request,response);
		}else{
			out.print("<h2> Usuario o contraseña incorrectos <h2>");
			RequestDispatcher rd = request.getRequestDispatcher("/loginform.html");
			rd.include(request,response);
		}		
	}	
}
	
