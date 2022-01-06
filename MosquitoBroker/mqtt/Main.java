package mqtt;
class Main{
	public static void main(String[] args){
		try{
		if(args[0].equals("publicar")){
			Publisher.send(args[1],args[2]+" "+args[3]+" "+args[4]+" "+args[5]+" "+args[6]);
		}
		else{
			System.exit(0);
		}
		}catch(Exception e){
			System.exit(0);
		}
	}
}
