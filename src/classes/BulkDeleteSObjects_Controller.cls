public class BulkDeleteSObjects_Controller 
{
	public List<SObjectWrapper> sObjectWrapperList {get; private set;}
	public String selectString {get;set;}

	public class sObjectWrapper
	{
		public SObject sObj {get; private set;}
		public Object name {get; private set;}
		public Boolean deleteThis {get; set;}

		public sObjectWrapper(SObject so)
		{
			this.sObj = so;
			try
			{
				this.name = this.sObj.get('Name');
			}
			catch(Exception e){}
		}
	}

	public BulkDeleteSObjects_Controller()
	{
		this.sObjectWrapperList = new List<sObjectWrapper>();

	}

	public PageReference executeSelect()
	{
		try
		{
			loadData(Database.query(this.selectString));
		}
		catch(Exception e){
			logError(e.getMessage());
		}
		return null;
	}

	private void loadData(List<SObject> sObjs)
	{
		this.sObjectWrapperList = new List<sObjectWrapper>();
		for(SObject s : sObjs)
		{
			this.sObjectWrapperList.add(new sObjectWrapper(s));
		}
	}

	public PageReference deleteSelected()
	{
		try
		{
			List<SObject> sObjs = new List<SObject>();
			for(sObjectWrapper so : this.sObjectWrapperList)
			{
				if(so.deleteThis == true)
				{
					sObjs.add(so.sObj);
				}
			}
			delete sObjs;
			executeSelect();
		}
		catch(Exception e)
		{
			logError(e.getMessage());
		}
		return null;
	}

	private void logError(String errorString)
	{
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, errorString));
	}
}