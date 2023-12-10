
public class Q4 {
	
	enum TrafficLight {
		RED(30),GREEN(30),YELLOW(40);
		
		private int duration;
		TrafficLight(int duration){
			this.duration=duration;
		}
		
		int getDuration() {
			return duration;
		}
		
		
	}

	public static void main(String[] args) {
		TrafficLight[] lights= {TrafficLight.RED,TrafficLight.GREEN,TrafficLight.YELLOW};
		for(TrafficLight light:lights) {
			System.out.println("Traffic Light : "+light);
			System.out.println("Duration : "+light.getDuration());
			System.out.println("Ordinal : "+light.ordinal());
			System.out.println();
		}
		
		
	}

}
