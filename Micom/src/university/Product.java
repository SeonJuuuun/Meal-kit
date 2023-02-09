package university;

public class Product {
	private String photo;
	private String pdname;
	private int price;
	private int stock;
	private String time;
	private String serving;
	private int sale;
	private int ordercount;
	
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	public String getPdname()
	{
		return pdname;
	}
	public void setPdname(String pdname)
	{
		this.pdname = pdname;
	}
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price = price;
	}
	public void setPrice(String price)
	{
		this.price = Integer.parseInt(price);
	}
	public int getStock()
	{
		return stock;
	}
	public void setStock(int stock)
	{
		this.stock = stock;
	}
	public void setStock(String stock)
	{
		this.stock = Integer.parseInt(stock);
	}
	public String getTime()
	{
		return time;
	}
	public void setTime(String time)
	{
		this.time = time;
	}
	public String getServing()
	{
		return serving;
	}
	public void setServing(String serving)
	{
		this.serving = serving;
	}
	public int getSale()
	{
		return sale;
	}
	public void setSale(int sale)
	{
		this.sale = sale;
	}
	public void setSale(String sale)
	{
		this.sale = Integer.parseInt(sale);
	}
	public int getOrdercount()
	{
		return ordercount;
	}
	public void setOrdercount(int ordercount)
	{
		this.ordercount = ordercount;
	}
	public void setOrdercount(String ordercount) {
	      this.ordercount = Integer.parseInt(ordercount);
	}

}
