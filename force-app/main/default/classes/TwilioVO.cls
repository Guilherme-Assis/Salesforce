public class TwilioVO{
	public String first_page_uri;	///2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages.json?PageSize=50&Page=0
	public Integer fim;	//30
	public cls_previous_page_uri previous_page_uri;
	public cls_messages[] messages;
	public String uri;	///2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages.json?PageSize=50&Page=0
	public Integer page_size;	//50
	public Integer start;	//0
	public cls_next_page_uri next_page_uri;
	public Integer page;	//0
	class cls_previous_page_uri {
	}
	class cls_messages {
		public String body;	//You said :Testando.
		public String num_segments;	//1
		public String direction;	//outbound-api
		public String para;	//whatsapp:+14155238886
		public String date_updated;	//Wed, 15 Dec 2021 20:22:02 +0000
		public String price;	//0.00000
		public cls_error_message error_message;
		public String uri;	///2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages/SMa618655ea33729e296d8d5ea520bd0f0.json
		public String account_sid;	//AC79583071451569290369ef4ea10f55b6
		public String num_media;	//0
		public String to;	//whatsapp:+553491448852
		public String date_created;	//Wed, 15 Dec 2021 20:22:01 +0000
		public String status;	//read
		public String sid;	//SMa618655ea33729e296d8d5ea520bd0f0
		public String date_sent;	//Wed, 15 Dec 2021 20:22:01 +0000
		public cls_messaging_service_sid messaging_service_sid;
		public cls_error_code error_code;
		public String price_unit;	//USD
		public String api_version;	//2010-04-01
		public cls_subresource_uris subresource_uris;
	}
	class cls_error_message {
	}
	class cls_messaging_service_sid {
	}
	class cls_error_code {
	}
	class cls_subresource_uris {
		public String media;	///2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages/SMa618655ea33729e296d8d5ea520bd0f0/Media.json
		public String feedback;	///2010-04-01/Accounts/AC79583071451569290369ef4ea10f55b6/Messages/SMa618655ea33729e296d8d5ea520bd0f0/Feedback.json
	}
	class cls_next_page_uri {
	}
}