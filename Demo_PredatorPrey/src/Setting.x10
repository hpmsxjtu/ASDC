public class Setting {
	
	//�趨
	public static val PreyNum:Int=20000 as Int;//Agent��ʼ����
	public static val PredatorNum:Int=20000 as Int;//Agent��ʼ����
	public static val N:Int=20000 as Int;//Agent��ʼ����
	public static val Iteration_Step=(4+3*Setting.N) as Int;//������Ϸ��������
	
	public static val File_Location="../DataCollection/DC_File1.xls" as String;//�����ռ�λ��
	//public static val File_Location="../DataCollectionTest1/DC_File3.xls" as String;//�����ռ�λ��
	
	/**
	 * The default number of agents in Context.
	 * 
	 * It's also the len of agentArray.
	 * 
	 * It should less then size of a real projection, 
	 * such as: MAX_NUM_AGENT < Grid.width * Grid.height.
	 */
	public static val MAX_NUM_AGENT = 1000000;//The initial count of agent
	
	
	
	/**
	 * The default len of Heap in PriorityQueue.
	 */
	public static val LEN_PRIORITYQUEUE = 1000000;//The length of priority queue
	
}