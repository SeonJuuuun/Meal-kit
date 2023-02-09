package university;
import java.time.*;

public class corder {
	   private int onum;
	   private LocalDateTime odate;
	   private String id;
	   private String pdname;
	   private int ordercount;
	   private String dstate;
	   
	   
	   public int getOnum() {
	      return onum;
	   }
	   public void setOnum(int onum) {
	      this.onum = onum;
	   }
	   public void setOnum(String onum) {
	      this.onum = Integer.parseInt(onum);
	   }
	  
	   public void setOdate(LocalDateTime odate) {
	      this.odate = odate;
	   }
	   public LocalDateTime getOdate() {
		      return odate;
	   }
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      this.id = id;
	   }
	   
	   public String getPdname() {
	      return pdname;
	   }
	   public void setPdname(String pdname) {
	      this.pdname = pdname;
	   }
	   
	   public int getOrdercount() {
	      return ordercount;
	   }
	   public void setOrdercount(int ordercount) {
	      this.ordercount = ordercount;
	   }
	   public void setOrdercount(String ordercount) {
	      this.ordercount = Integer.parseInt(ordercount);
	   }
	   
	   public String getDstate() {
	      return dstate;
	   }
	   public void setDstate(String dstate) {
	      this.dstate = dstate;
	   }
	}