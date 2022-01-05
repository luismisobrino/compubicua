import com.google.gson.Gson;
import javax.annotation.Resource;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
public class GetHistorial extends HttpServlet{
    
    @Resource(name="poolConexiones")
    private DataSource pool;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html");
	PrintWriter out= response.getWriter();
	String idPlanta = request.getParameter("idPlanta");
        String sql=null;
        Connection con= null;
        Statement stat=null;
        ArrayList<ArrayList<String>> respuesta= new ArrayList<>();
        ArrayList<String> aire= new ArrayList<>();
        ArrayList<String> tierra= new ArrayList<>();
        ArrayList<String> luz= new ArrayList<>();
        ArrayList<String> temperatura= new ArrayList<>();
        ArrayList<String> fecha= new ArrayList<>();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  

        try{
            con=pool.getConnection();
            stat= con.createStatement();
            sql="Select * from historico where id_planta="+"'"+idPlanta+"'"+";";
            ResultSet rs= stat.executeQuery(sql);
            while(rs.next()){
                aire.add(String.valueOf(rs.getInt("humedad_aire")));
                tierra.add(String.valueOf(rs.getInt("humedad_tierra")));
                luz.add(String.valueOf(rs.getInt("luz")));
                temperatura.add(String.valueOf(rs.getInt("temperatura"))); 
                fecha.add(dateFormat.format(rs.getDate("created_at")));
            }
            respuesta.add(aire);
            respuesta.add(tierra);
            respuesta.add(luz);
            respuesta.add(temperatura);
            respuesta.add(fecha);
            rs.close();
            con.close();	
            String json= new Gson().toJson(respuesta);
            out.print(json);
        }catch(Exception e){ out.print(e);

        }
    }
}

