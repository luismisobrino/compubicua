import com.google.gson.Gson;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PruebaChart extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        @Resource(name="poolConexiones")
        DataSource pool;
//        String db_url= "jdbc:mysql://localhost:3306/prueba";
//        String user="root";
//        String pass="";
        String sql=null;
        Connection con= null;
        Statement stat=null;
	List<Integer> respuesta= new ArrayList<>();
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            //con = DriverManager.getConnection(db_url,user,pass);
            con=pool.getConection();
            stat= con.createStatement();
            sql="Select * from historico where id_planta= 1";
            ResultSet rs= stat.executeQuery(sql);
            while(rs.next()){
            	int valor= rs.getInt("humedad_aire");
            	respuesta.add(valor);
            }	
            rs.close();
            con.close();
            String json= new Gson().toJson(respuesta);
            out.print(json);
        }catch(Exception e){ out.print(e);

       }
    }
}
	
