public class GameOfLifeRun {
	
	public static def main(Rail[String]):void 
	{
		var Step:Int=0 as Int;
		val Run=new GameOfLifeModel();
		var Uptime:Long = -System.nanoTime();				
		
		Run.initSchedule();//���ȳ�ʼ��
		Run.getRunner().run();

		Uptime += System.nanoTime();
		Uptime /= 1000000;//��ʱ��������ת��Ϊ����
		Console.OUT.println("\n\r"+"Game of life is over.\n"+"  "+"Total time consuming is "+"Total time consuming is "+ Uptime +"ms.");
	}

}