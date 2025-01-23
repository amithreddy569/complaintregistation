package com.complaintmanagement.constants;

public class Constants {
	
	public enum ComplaintStatus {
		PENDING("pending"),
		RECIEVED("recieved"), 
		ACCEPTED("accepted"),
		REQUEST_DETAILS("request_details"),
		RESOLVED("resolved");
		
		private String status;

	    private ComplaintStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }

	    public boolean equals(String status) {
	      return this.status.equals(status.toUpperCase());
	    }
	}

}
