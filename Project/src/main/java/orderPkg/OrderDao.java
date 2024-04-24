package orderPkg;

import java.sql.*;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Products.ProductsBean;

public class OrderDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
	public static OrderDao instance = new OrderDao();
	public static OrderDao getInstance() {
		return instance;
	}
	private OrderDao() {
		
	}
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	public int insertOrder(int no, Vector<ProductsBean> plist) throws Exception {
		conn = getConnection();
		int cnt =0;

		conn.setAutoCommit(false);
		
		for(int i=0;i<plist.size();i++) {
		String sql = "insert into order2 values(oseq.nextval,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, no);
		ps.setInt(2, plist.get(i).getPnum());
		ps.setInt(3, plist.get(i).getPqty());
		ps.setInt(4, plist.get(i).getPrice() * plist.get(i).getPqty());
		cnt += ps.executeUpdate();
		}
		if(cnt==plist.size()) {
			conn.commit();
		}
		
		return cnt;
	}
	public Vector<OrderBean> orderList(String id) throws Exception{
		conn = getConnection();
		Vector<OrderBean> lists = new Vector<OrderBean>();
		
		String sql = "select m.name, m.id , p.pname2, p.pimage, p.point, o.pqty, o.price from"
				+ " (member m inner join order2 o on m.no = o.memno)"
				+ " inner join products p on o.pnum = p.pnum where id= ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		while(rs.next()) {
			OrderBean ob = new OrderBean();
			ob.setMname(rs.getString("name"));
			ob.setMid(rs.getString("id"));
			ob.setPname(rs.getString("pname2"));
			ob.setPimage(rs.getString("pimage"));
			ob.setPqty(rs.getInt("pqty"));
			ob.setPrice(rs.getInt("price"));
			lists.add(ob);
		}
		return lists;
	}
	public Vector<OrderBean> adminorderList(String id) throws Exception {
		conn = getConnection();
		Vector<OrderBean> lists = new Vector<OrderBean>();
		String sql = "select m.name, m.id , p.pname2, p.pimage, o.pqty, o.price from"
				+ " (member m inner join order2 o on m.no = o.memno)"
				+ " inner join products p on o.pnum = p.pnum where id= ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		while(rs.next()) {
			OrderBean ob = new OrderBean();
			ob.setMname(rs.getString("name"));
			ob.setMid(rs.getString("id"));
			ob.setPname(rs.getString("pname2"));
			ob.setPimage(rs.getString("pimage"));
			ob.setPqty(rs.getInt("pqty"));
			ob.setPrice(rs.getInt("price"));
			lists.add(ob);
		}
		return lists;
	}
}
