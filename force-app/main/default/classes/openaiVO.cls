public with sharing class openaiVO{
	public String gui;	
	public String objeto;	
	public Integer created;	
	public String model;	
	public cls_choices[] choices;
	public cls_usage usage;
	class cls_choices {
		public String text;	
		public Integer index;	
		public cls_logprobs logprobs;
		public String finish_reason;	
	}
	class cls_logprobs {
	}
	class cls_usage {
		public Integer prompt_tokens;	
		public Integer completion_tokens;	
		public Integer total_tokens;	
	}
	public static openaiVO parse(String json){
		return (openaiVO) System.JSON.deserialize(json, openaiVO.class);
	}
}