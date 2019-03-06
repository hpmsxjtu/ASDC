import x10.regionarray.Array;
import x10.util.Random;

public class Agent {
	private var location:Point(2);//Agentλ����Ϣ
	private var state:Int;//Agent״̬��Ϣ
	
	//AddCode
	private var neighbors:Array[Int];//������Ϸ�����ھ�

	public def this()
	{
		location=[((new Random().nextDouble()*Grid.Grid_XMax) as Int)+1, ((new Random().nextDouble()*Grid.Grid_YMax) as Int)+1];//������Ϸ����Agentλ�ñ�ʶ
		state=0 as Int;	//������Ϸ����Agent���  0���  1����
		neighbors=new Array[Int](8,0 as Int);//������Ϸ����Agent�ھ�
	}
	public def this(po:Point(2),s:Int)
	{
		location=po;
		state=s;
		neighbors=new Array[Int](8,0 as Int);
	}
	public def getLocation():Point(2)
	{
		return location;
	}
	public def getState():Long
	{
		return state;
	}
	public def setState(sta:Int)
	{
		state=sta;
	}
	public def getNeighbors():Array[Int]
	{
		return neighbors;
	}
	public def setNeighbors(neigh:Array[Int])
	{
		neighbors=neigh;
	}
	
}