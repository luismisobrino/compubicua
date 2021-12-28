// *********************DHT11****************************
#include <DHT.h>

#define DHT_SENSOR_TYPE DHT_TYPE_11
#define DHT_SENSOR_TYPE DHT_TYPE_21
#define DHT_SENSOR_TYPE DHT_TYPE_22

static const int DHT_SENSOR_PIN = 2;
DHT_nonblocking dht_sensor( DHT_SENSOR_PIN, DHT_SENSOR_TYPE );
int UmbralAire = 25;
float temp = 0;

// ********************YL69******************************
int rainPin1 = 32;
int rainPin2 = 16;
/*int greenLED = 6;
int redLED = 7;*/
// valor de ajuste del umbral, para la sensibilidad del sensor
int UmbralSuelo = 800;

// **********************VENTILADOR************************
const int pinVentilador = 9;
const float thresholdLOW = 20.0;
const float thresholdHIGH= 30.0;
bool estado_ventilador = false; /// ventilador activo o inactivo
float GetTemperature(){
  return 20.0;  //sustituir en funcion del sensor empleado
}
// **********************VENTILADOR************************
int light = 0;
int pinLight = 34;


// *******************CONTADORES*************
int contador_temp = 0;
int contador_humAire = 0;
int contador_luz = 0;
int contador_humSuelo = 0;

// *******************Conexión***************************
#include <WiFi.h>
#include <PubSubClient.h>

const char* ssid = "nombre de la red";
const char* password = "contraseña";
const char* mqttServer = "m11.cloudmqtt.com";
const int mqttPort = 12948;
const char* mqttUser = "ubicomp";
const char* mqttPassword = "ubicomp";

//************Tópicos***********
#define light_topic “esp32/light"
#define temperature_topic “esp32/temperature“
#define temperature_topic “esp32/ground_humidity“

//declaramos un WIFIClient objeto
WifiCliente espClient;

PubSubClient client(espClient);

void setup(){
  //********conexión********
  Serial.begin(115200);
  WiFi.begin(ssid,password);
  while (WiFi.status()!= WL_CONNECTED) {
    delay(500);
    Serial.println("Connectingto WiFi..");
  }
  Serial.println("Connectedto the WiFi network");
  client.setServer(mqttServer,mqttPort);
  while (!client.connected()){
    Serial.println("Connectingto MQTT...");
    if (client.connect("ESP32Client",mqttUser, mqttPassword )) {
      Serial.println("connected");
    }else {
      Serial.print("failedwith state ");
      Serial.print(client.state());
      delay(2000);
    }
  }
  client.publish("esp/test","Hello from ESP32");
  
  //*********YL69**********
  pinMode(rainPin1, INPUT);
  pinMode(rainPin2, INPUT);
  /*pinMode(greenLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  digitalWrite(greenLED, LOW);
  digitalWrite(redLED, LOW);*/
  
  //*********DHT11*********
  dht_sensor.begin();
  
  //**************VENTILADOR****************
  pinMode(pinVentilador, OUTPUT);  //definir pin como salida

  //*************LUZ****************
  pinMode(pinLight, INPUT);
}



void loop() {

  //***********conexión*********
  client.loop();
  
  //***********YL69*********
  // lectura de la entrada analoga pin en A0:
  int sensorValue1 = analogRead(rainPin1);
  int sensorValue2 = analogRead(rainPin2);
  char buffer_tierra1[10];
  char buffer_tierra2[10];
  if(contador_humSuelo==5){
    dtostrf(sensorValue1,5, 5, buffer_tierra1);
    dtostrf(sensorValue2,5, 5, buffer_tierra2);
    client.publish(light_topic, buffer_tierra);
    client.publish(light_topic, buffer_tierra);

   //accionar bomba

  //*****************DHT11******************
  float humidity;

  temp = dht_sensor.readTemperature();
  char buffer_temperatura[10];
  if(contador_temp==5){
    dtostrf(temp,5, 5, buffer_temperatura);
    client.publish(temperature_topic, buffer_temperatura);
  }
  //accionar ventilador

//*****************LUZ****************
  light = analogRead(pinLight);
  char buffer_luz[10];
  if(contador_luz==5){
    dtostrf(temp,5, 1, buffer_luz);
    client.publish(topicName, buffer_luz);
  }

  
   delay(5000);  // esperar 5 segundos entre mediciones
}
