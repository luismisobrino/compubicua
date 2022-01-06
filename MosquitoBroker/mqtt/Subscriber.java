package mqtt;
import org.eclipse.paho.client.mqttv3.*;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
import java.util.StringTokenizer;


public class Subscriber implements MqttCallback {
    private static final String brokerUrl ="tcp://localhost:2000";
    private static final String clientId = "clientId";
    private static String topico="";
    private static String sql=null;
    private static Connection con= null;
    private static Statement stat=null;

    public Subscriber(String topico){
    	this.topico=topico;
    }

    public void subscribe() {

        try
        {
            MqttClient sampleClient = new MqttClient(brokerUrl, clientId);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);
            System.out.println("checking");
            System.out.println("Mqtt Connecting to broker: " + brokerUrl);
            sampleClient.connect(connOpts);
            System.out.println("Mqtt Connected");
            sampleClient.setCallback(this);
            sampleClient.subscribe(topico);
            System.out.println("Subscribed");
            System.out.println("Listening");
        } catch (MqttException me) {
            System.out.println(me);
        }
    }
    //Called when the client lost the connection to the broker
    public void connectionLost(Throwable arg0) {
    }
    //Called when a outgoing publish is complete
    public void deliveryComplete(IMqttDeliveryToken arg0) {
    }
    public void messageArrived(String topic, MqttMessage message) {
        //ESTRUCTURA DE MENSAJE RECIBIDO: IDPLANTA VALOR
        System.out.println("Topic:" + topic);
        System.out.println("Message: " +message.toString());

        try {
            StringTokenizer tokens = new StringTokenizer(message.toString()," ");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root","");
            stat= con.createStatement();
            int parametros= tokens.countTokens();
            String idPlanta= tokens.nextToken();
            String haire= tokens.nextToken();
            String htierra= tokens.nextToken();
            String luz= tokens.nextToken();
            String temperatura= tokens.nextToken();
            if (topic.equals("DB/mediciones") && parametros==5) {

                sql = "INSERT INTO historico (`id_planta`, `humedad_aire`, `humedad_tierra`, `luz`, `temperatura`) VALUES("+"\'"+ idPlanta+ "\'" + "," +"\'" +haire +"\'"+ "," +"\'" +htierra +"\'"+ "," +"\'"+ luz +"\'"+ "," +"\'"+ temperatura +"\'"+ ")";
                stat.executeUpdate(sql);
                if(comprobarRiego(stat,idPlanta,htierra)){
                    Publisher.send("ESP32/regar","1");
                }
                if(comprobarRiego(stat,idPlanta,htierra)){
                    Publisher.send("ESP32/ventilar","1");
                }
            }
            stat.close();
            con.close();
        }catch(Exception e){
            System.out.println("ERROR");
            System.out.println(e.toString());
        }
    }
    public Boolean comprobarRiego(Statement stat,String idPlanta,String htierra) throws java.sql.SQLException{
    
        ResultSet rs=stat.executeQuery("SELECT humedad_tierra_min FROM tipo WHERE nombre=(SELECT tipo FROM planta WHERE id="+idPlanta+")");
        rs.next();
        int min= rs.getInt("humedad_tierra_min");
        rs.close();
        return min>Integer.parseInt(htierra);
    }
    public Boolean comprobarVentilador(Statement stat,String idPlanta,String temperatura) throws java.sql.SQLException{
    
        ResultSet rs=stat.executeQuery("SELECT temperatura_max FROM tipo WHERE nombre=(SELECT tipo FROM planta WHERE id="+idPlanta+")");
        rs.next();
        int tempMax= rs.getInt("temperatura_max");
        rs.close();
	
        return tempMax<Integer.parseInt(temperatura);
    }
    public static void main(String[] args){
		Subscriber s=new Subscriber(args[0]);
		s.subscribe();
	}
}






