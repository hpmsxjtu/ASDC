/*
 * �������У�right!
 * ÿ��Agent��Label��һ��,0�ǿ�,1��Predator,2��Prey.
 * ÿ��Agent����8���ھ�
 * ¥�·�����ʵ��ʹ��
 * ʵ����
 * 1600*1600,
 * equal number
 * Predator:20000-180000/40000
 * Prey:20000-180000/40000
 * Prey���ԣ������ո�Ǩ�ƣ�������Predator��Ӱ�죻
 * Predator���ԣ�����Prey�ͳԵ���û����������һ���ո������ÿո�
 * ���Լ���Prey=0������ʱ��
 */

public class PPRun {
	
	public static def main(Rail[String]):void 
	{
	    var Step:Int=0 as Int;
		val Run=new PPModel();
		val DC:DataCollection = new DataCollection();
		
		var Uptime:Long = -System.nanoTime();	
		
		Run.initSchedule();//���ȳ�ʼ��
		Run.getRunner().run();

		Uptime += System.nanoTime();
		Uptime /= 1000000;//��ʱ��������ת��Ϊ����
		DC.RecordWrite(""+Uptime+" \t1600*1600_Predator:20000-Prey:20000_numAllPlaces:"+Place.numAllPlaces()+"  numPlaces()"+Place.numPlaces());
		//Console.OUT.println(""+Uptime+" \t1600*1600_Predator:20000-Prey:20000_numAllPlaces:"+Place.numAllPlaces()+"  numPlaces()"+Place.numPlaces());
		Console.OUT.println("\n\r"+" Predator-Prey model is over.\n"+"  "+"Total time consuming is "+"Total time consuming is "+ Uptime +"ms.");
	}

}