public with sharing class TelegramVO {
        public boolean ok;
	public cls_result[] result;
	public class cls_result {
		public Integer update_id;	//113818273
		public cls_message message;
	}
	public class cls_message {
		public Integer message_id;	//12
		public cls_from fromm;
		public cls_chat chat;
		public Integer data;	//1635193401
		public String text;	//teste
	}
	public class cls_from {
		public Integer id;	//2011552626
		public boolean is_bot;
		public String first_name;	//Guilherme
		public String last_name;	//Assis
		public String language_code;	//pt-br
	}
	public class cls_chat {
		public Integer id;	//2011552626
		public String first_name;	//Guilherme
		public String last_name;	//Assis
		public String type;	//private
	}
}