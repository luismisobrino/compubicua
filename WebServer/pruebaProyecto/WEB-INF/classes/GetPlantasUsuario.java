import com.google.gson.Gson;
import javax.annotation.Resource;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import javax.annotation.Resource;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
public class GetPlantasUsuario extends HttpServlet{
    
    @Resource(name="poolConexiones")
    private DataSource pool;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        String usuario = request.getParameter("usuario");
        String sql=null;
        Connection con= null;
        Statement stat=null;
        HashMap<Integer,String> respuesta= new HashMap<>();
        try{
            con=pool.getConnection();
            stat= con.createStatement();
            sql="select id,nombre from planta where id_invernadero=(select id_invernadero from 			invernadero_usuario where id_usuario='"+usuario+"');";
            ResultSet rs= stat.executeQuery(sql);
            while(rs.next()){
                int id= rs.getInt("id");
                String nombre= rs.getString("nombre");
                respuesta.put(id,nombre);
            }
            rs.close();
            con.close();
            String json= new Gson().toJson(respuesta);
            out.print(json);
        }catch(Exception e){ out.print(e);

        }
    }
}

