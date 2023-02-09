package university;

import java.sql.*;
import java.util.*;

public class DB {

	static Connection con = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	static PreparedStatement pstmt = null;

	static String driver = "com.mysql.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/micom";;

	public static void loadConnect() {
		try {
			// 연결을 닫는다.
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException ex) {
		}
		;

		// 드라이버 로딩
		try {
			Class.forName(driver);

		} catch (java.lang.ClassNotFoundException e) {
			System.err.println("** Driver loaderror in loadConnect: " + e.getMessage());
			e.printStackTrace();

		}

		try {

			// 연결하기
			con = DriverManager.getConnection(URL, "root", "onlyroot");

			System.out.println("\n" + URL + "에 연결됨");

		} catch (SQLException ex) {

			System.err.println("** connection error in loadConnect: " + ex.getMessage());
			ex.printStackTrace();
		}

	}

	public static void disconnect() {
		try {
			// 연결을 닫는다.
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException ex) {
		}
		;
	}

	public static ResultSet selectQuery(String sql) {
		try {
			// Statement 생성
			stmt = con.createStatement();

			rs = stmt.executeQuery(sql);

		} catch (SQLException ex) {
			System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage());
		}

		return rs;

	}

	public static int updateQuery(String sql) {
		int count;

		try {
			// Statement 생성
			stmt = con.createStatement();
			count = stmt.executeUpdate(sql);
			return count;

		} catch (SQLException ex) {
			System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage());
			return 0;
		}
	}

	public static ResultSet selectCustomer(String id) {
		String sql = "select * from customer where id = '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	public static ResultSet selectAdmin(String id) {
		String sql = "select * from admin where id= '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}
	public static ResultSet selectordertable() {
		String sql = "select * from corder;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}
	public static ResultSet selectcusordertable(String id) {
		String sql = "select * from corder where id= '"+ id +"';";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}
	public static ResultSet insertCustomer(Customer cus) {
		String sql = "insert into customer values ('" + cus.getName() + "','" + cus.getId() + "','" + cus.getPw()
				+ "','" + cus.getAddress() + "','" + cus.getPhnumber() + "','" + cus.getEmail() + "','" + cus.getDate()
				+ "' );";
		System.out.println("   >> SQL : " + sql + "\n");
		
		try {
			rs=selectAdmin(cus.getId());
			if(rs.next()) {
				return rs;
			}else {
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
				
	
		int count = updateQuery(sql);
		System.out.println(count);
		if (count == 1)
			return null;
		else
			return selectCustomer(cus.getId());
		
	}
	public static ResultSet selectadminproduct() {
        String sql = "select * from product;";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
	public static ResultSet selectAllProduct() {
        String sql = "select photo, pdname, price, stock from product;";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
	public static ResultSet selectpopularProduct() {
        String sql = "select photo, pdname, price, stock from product where ordercount >= 20;";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
	public static ResultSet selectsaleProduct() {
        String sql = "select photo, pdname, price, stock from product where sale > 0;";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
     public static ResultSet selectPhoto(String photo) {
        String sql = "select * from product where photo = "+photo+";";
        System.out.println("   >> SQL : " + sql + "\n");

        return selectQuery(sql);
     }
     public static ResultSet selectCorder() {
         String sql = "select * from corder;";
         System.out.println("   >> SQL : " + sql + "\n");

         return selectQuery(sql);
      }
   public static ResultSet selectIngredient(String ig)
      {
         String sql = "select * from ingredient;";
         System.out.println("   >> SQL : " + sql + "\n");
         return selectQuery(sql);
      }

   public static void updateOrder(int onum) {        
       String sql = "update corder set dstate='취소대기' where onum= '"+ onum +"';";
        
        updateQuery(sql);
       
    }
   
  
   
   
      public static ResultSet insertIngredient(Ingredient ig)
      {
         String sql = "insert into ingredient values ('"+ig.getIgname()+"', '"+ig.getPrice()+"', '"
               +ig.getGram()+"', '"+ig.getKal()+"', '"+ig.getCountry()+"');";
         
         System.out.println("   >> SQL : " + sql + "\n");
         int count = updateQuery(sql);
         System.out.println(count);
         if (count == 1)
            return null;
         else
            return selectIngredient(ig.getIgname());
      }
      public static int MinusStock(String pdname, int ordercount) {
            String sql = "update product join corder on product.pdname = corder.pdname set stock = stock - '"+ordercount+"' where product.pdname='"+pdname+"';";
            
            
         return updateQuery(sql);
         }
      public static int UpSaleproduct(String pdname, int basic, int sale) {
          String sql = "update product set price = price * 100/(100-'"+basic+"') / 100 * (100-'"+sale+"') where pdname='"+pdname+"';";
          
          
       return updateQuery(sql);
       }
      public static int DownSaleproduct(String pdname, int basic, int sale) {
          String sql = "update product set price = (price * 100)/(100-'"+basic+"') / 100 * (100-'"+sale+"') where pdname='"+pdname+"';";
          
          
       return updateQuery(sql);
       }
      public static int Plusordercount(String pdname, int ordercount) {
          String sql = "update product join corder on product.pdname = corder.pdname set product.ordercount = product.ordercount + '"+ordercount+"' where product.pdname='"+pdname+"';";
          
          
       return updateQuery(sql);
       }
      public static ResultSet selectProduct(String pdname)
      {
         String sql = "select * from product;";
         System.out.println(" >>SQL:" + sql + "\n");
         return selectQuery(sql);
      }
      
      public static ResultSet insertProduct(Product pro)
      {
         String sql = "insert into product values ('"+pro.getPhoto()+"','"+pro.getPdname()+"','"+pro.getPrice()+"','"
               +pro.getStock()+"','"+pro.getTime()+"','"+pro.getServing()+"','"+pro.getSale()+"','"
               +pro.getOrdercount()+ "');";
         System.out.println(" >>SQL:" + sql + "\n");
         int count = updateQuery(sql);
         System.out.println(count);
         if(count == 1)
            return null;
         else
            return selectProduct(pro.getPdname());
      }
	public static ResultSet insertCorder(corder corder) {
        String sql = "insert into corder values ('" + corder.getOnum()+"','"+corder.getOdate()+"','"
                                +corder.getId()+"','"+corder.getPdname()+"',"
                                +corder.getOrdercount()+",'"+corder.getDstate()+"');";
        System.out.println("   >> SQL : " + sql + "\n");
           
         int count = updateQuery(sql);
         
         if (count==1)
             return selectCorder();
          else
             return null;
     }
	
	public static boolean deleteMember(String id, String pw) {
        boolean result = false;
        try{
            String dbpw="";
           
            pstmt = con.prepareStatement("select pw from customer where id=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dbpw= rs.getString("pw");
                if(dbpw.equals(pw)){
                    pstmt = con.prepareStatement("delete from customer where id=?");
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    result = true; //회원탈퇴 성공
                }
            }   
        }catch (SQLException e) {
	
			e.printStackTrace();
		}
		
		return result;
	}
	
	 public ArrayList<Customer> select(){
	        ArrayList<Customer> list = new ArrayList<Customer>();
	        try{
	            
	            pstmt = con.prepareStatement("select * from members where name=? and email=?");
	            pstmt.setString(1, "name");
	            pstmt.setString(2, "email");
	            rs = pstmt.executeQuery();
	            while(rs.next()){
	            	Customer dto = new Customer();
	            	dto.setName(rs.getString("name"));
	                dto.setId(rs.getString("id"));
	                dto.setPw(rs.getString("pw"));
	                dto.setAddress(rs.getString("address"));
	                dto.setPhnumber(rs.getString("phnumber"));
	                dto.setEmail(rs.getString("email"));
	                dto.setDate(rs.getString("birthday"));
	                
	                list.add(dto);
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	            try{rs.close();}catch(SQLException e){}
	            try{pstmt.close();}catch(SQLException e){}
	            try{con.close();}catch(SQLException e){}
	        }
	        return list;
	    }
	
	 public static void updateMember(Customer dto) {
	        try{	            
	            pstmt = con.prepareStatement("update customer set name=?,pw=?,address=?,phnumber=?,email=?,birthday=? where id=?");
	            pstmt.setString(1, dto.getName());
	            pstmt.setString(2, dto.getPw());
	            pstmt.setString(3, dto.getAddress());
	              pstmt.setString(4, dto.getPhnumber());
	              pstmt.setString(5, dto.getEmail());
	              pstmt.setString(6, dto.getDate());
	              pstmt.setString(7, dto.getId());
	              pstmt.executeUpdate();

	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	 public static void updateProduct(Product pro) {
	        try{	            
	            pstmt = con.prepareStatement("update product set photo=?,price=?,stock=?,time=?,serving=?,sale=?,ordercount=? where pdname=?");
	            pstmt.setString(1, pro.getPhoto());
	            pstmt.setInt(2, pro.getPrice());
	              pstmt.setInt(3, pro.getStock());
	              pstmt.setString(4, pro.getTime());
	              pstmt.setString(5, pro.getServing());
	              pstmt.setInt(6, pro.getSale());
	              pstmt.setInt(7, pro.getOrdercount());
	              pstmt.setString(8, pro.getPdname());
	              pstmt.executeUpdate();

	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	 public static ResultSet findSale(String pdname){
		 String sql = "select sale from product where pdname ='"+pdname+"';";
         
         
         return selectQuery(sql);
			
	 }

	 
	
	   public static Product getProduct(String pdname){
			Product pro = null; //객체 레퍼런스 생성
			//왜 null인가? 정보가 생성되는 시점은 rs에 있을때이다.
			//따라서 rs가 없을땐 굳이 만들필요가 없다.

			try{
			//5-1. 드라이브로드 디비연결
			
			//5-2. SQL & pstmt 생성
			String sql = "select * from product where pdname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pdname);
			//5-3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//5-4. 데이터처리 : DB에 있는 회원정보 저장 후 memberinfo페이지로 전달
			//5-4-1. MemberBean mb = null; //객체 레퍼런스 생성
			//DB의컬럼명을 입력할 것
				if(rs.next()){
					pro = new Product();
					pro.setPhoto(rs.getString("photo"));
					pro.setPdname(rs.getString("pdname"));
					pro.setPrice(rs.getInt("price"));
					pro.setStock(rs.getInt("stock"));
					pro.setTime(rs.getString("time"));
					pro.setServing(rs.getString("serving"));
					pro.setSale(rs.getInt("sale"));
					pro.setOrdercount(rs.getInt("ordercount"));
					

					System.out.println("상품정보저장완료");
				}
				System.out.println("sql구문실행완료");
			}catch (SQLException e) {
		
				e.printStackTrace();
			}
			
			return pro;
		}
	   public static Customer getMember(String id){
			Customer cus = null; //객체 레퍼런스 생성
			//왜 null인가? 정보가 생성되는 시점은 rs에 있을때이다.
			//따라서 rs가 없을땐 굳이 만들필요가 없다.

			try{
			//5-1. 드라이브로드 디비연결
			
			//5-2. SQL & pstmt 생성
			String sql = "select * from customer where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//5-3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//5-4. 데이터처리 : DB에 있는 회원정보 저장 후 memberinfo페이지로 전달
			//5-4-1. MemberBean mb = null; //객체 레퍼런스 생성
			//DB의컬럼명을 입력할 것
				if(rs.next()){
					cus = new Customer();
					cus.setName(rs.getString("name"));
					cus.setId(rs.getString("id"));
					cus.setPw(rs.getString("pw"));
					cus.setAddress(rs.getString("address"));
					cus.setPhnumber(rs.getString("phnumber"));
					cus.setEmail(rs.getString("email"));
					cus.setDate(rs.getString("birthday"));
					

					System.out.println("회원정보저장완료");
				}
				System.out.println("sql구문실행완료");
			}catch (SQLException e) {
		
				e.printStackTrace();
			}
			
			return cus;
		}
	   


	public static int login(String id, String pw) {
		try {
			String sql = "select pw from customer where id ='" + id + "';";
			
			stmt = con.createStatement();

			rs = stmt.executeQuery(sql);

			System.out.println("   >> SQL : " + sql + "\n");// 첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			
			if (rs.next()) {
				
				if (rs.getString(1).equals(pw)) {
					
					return 1;
				} else
					return 0;
			}else {
				rs=selectAdmin(id);
		
				if(rs.next()) 
					if(rs.getString("pw").equals(pw)) {
						return 2;
					}else
						return 0;
				else
					return -1;
								
			}
			
			
		} catch (SQLException ex) {
			System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage());
		}
		return -2;
	}
	public static Review getReview (String id){
	      Review review = null;
	      
	      try {
	      String sql = "select * from review where id=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();

	         if(rs.next()){
	            review = new Review();
	            review.setReviewNum(1);
	            review.setStarGrade("stargrade");
	            review.setPdname("pdname");
	            review.setContent("content");
	            review.setId("id");
	            
	            System.out.println("리뷰저장완료");
	         }
	         System.out.println("sql구문실행완료");
	      }catch (SQLException e) {   
	         e.printStackTrace();
	      }      
	      return review;
	   }
	public static ResultSet selectReview() {
	      String sql = "select * from review;";
	      System.out.println("   >> SQL : " + sql + "\n");

	       return selectQuery(sql);
	   }
	public static ResultSet insertReview (Review review) {
	      String sql = "insert into review values ('" + review.getReviewNum()+"','"+review.getStarGrade()+"','"
	                +review.getPdname()+"','"+review.getContent()+"','"
	                +review.getId()+"');";
	      
	      System.out.println("   >> SQL : " + sql + "\n");
	         rs=selectReview();
	                                           
	         int count = updateQuery(sql);
	         System.out.println(count);
	         if (count == 1)
	            return null;
	         else
	            return selectReview();
	      
	   }
	public static ResultSet selectCancel() {
		String sql = "select * from cancel;";
		System.out.println("   >> SQL : " + sql + "\n");
		return selectQuery(sql);
	}
	public static ResultSet selectpd(String pdname) {
		String sql = "select * from product where pdname='"+pdname+"';";
		System.out.println("   >> SQL : " + sql + "\n");
		return selectQuery(sql);
	}
	public static ResultSet selectCorder(int onum) {
		String sql = "select * from corder where onum=" + onum + ";";
		System.out.println("   >> SQL : " + sql + "\n");
		return selectQuery(sql);
	}
	public static void cancelAction(int onum) {
		String sql = "update corder set dstate='취소완료' where onum= '" + onum + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		updateQuery(sql);
		ResultSet rs = selectCorder(onum);
		String pdname = "";
		int ordercount=0;
		try {
			while (rs.next()) {
				pdname = rs.getString("pdname");
				ordercount=rs.getInt("ordercount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rs=selectpd(pdname);
		int stock=0;
		int pdordercount=0;
		try {
			while(rs.next()) {
				stock=rs.getInt("stock");
				pdordercount=rs.getInt("ordercount");				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		stock+=ordercount;
		pdordercount-=ordercount;
		sql="update product set stock="+stock+",ordercount="+pdordercount+" where pdname='"+pdname+"';";
		
		System.out.println("   >> SQL : " + sql + "\n");
		updateQuery(sql);		
		
		sql = "delete from cancel where onum=" + onum + ";";
		System.out.println("   >> SQL : " + sql + "\n");
		updateQuery(sql);

	}
	public static void insertCancel(Cancel cancel) {
		String sql = "insert into cancel values(" + cancel.getOnum() + ",'" + cancel.getDate() + "','" + cancel.getId()
				+ "','" + cancel.getPdname() + "'," + cancel.getOrdercount() + ",'" + cancel.getDstate() + "');";

		System.out.println("   >> SQL : " + sql + "\n");
		updateQuery(sql);
	}
	public static void updatedstate(int onum, String dstate) {
		String sql = "update corder set dstate = '"+dstate+"' where onum='"+onum+"';";
		
		updateQuery(sql);
	}
	public static ResultSet selectReviewProduct(String pdname) {
        String sql = "select * from review where pdname = '"+pdname+"';";
        System.out.println("   >> SQL : " + sql + "\n");

         return selectQuery(sql);
     }
	public static ResultSet protoreview(String photo) {
        String sql = "select pdname from product where photo = '"+photo+"';";
        System.out.println("   >> SQL : " + sql + "\n");

         return selectQuery(sql);
     }

}
