import com.google.gson.Gson;
import javax.annotation.Resource;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ChartHumedadTierra extends HttpServlet{
    
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
        List<Integer> respuesta= new ArrayList<>();
        try{
            con=pool.getConnection();
            stat= con.createStatement();
            sql="Select * from historico where id_planta="+"'"+idPlanta+"'"+";";
            ResultSet rs= stat.executeQuery(sql);
            while(rs.next()){
                int valor= rs.getInt("humedad_tierra");
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

