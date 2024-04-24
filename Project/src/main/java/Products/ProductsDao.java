package Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductsDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static ProductsDao instance = new ProductsDao();
	
	public static ProductsDao getInstance() {
		return instance;
	}
	
	private ProductsDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	public ArrayList<ProductsBean> allProducts() throws Exception{
		conn = getConnection();
		ArrayList<ProductsBean> lists = new ArrayList<ProductsBean>();
		ProductsBean pb = null;
		String sql = "select * from products order by pnum";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			pb = getProductsBean(rs);
			
			lists.add(pb);
		}
		return lists;
	}
	
	public ProductsBean getProductsBean(ResultSet rs) throws SQLException {
			ProductsBean pb = new ProductsBean();
		
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPname2(rs.getString("pname2"));
			pb.setPcompany(rs.getString("pcompany"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPspec(rs.getString("pspec"));
			pb.setPcontents(rs.getString("pcontents"));
			pb.setPrice(rs.getInt("price"));
			pb.setPoint(rs.getInt("point"));
			
			return pb;
	}
	public int insertProducts(MultipartRequest mr) throws Exception {
		conn = getConnection();
		
		String sql = "insert into products values(pseq.nextval,?,?,?,?,?,?,?,?,?)";
		int cnt = -1;
		
		ps = conn.prepareStatement(sql);
		
		
		ps.setString(1, mr.getParameter("pname"));
		ps.setString(2, mr.getParameter("pname2"));
		ps.setString(3, mr.getParameter("pcompany"));
		ps.setString(4, mr.getFilesystemName("pimage"));
		ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
		ps.setString(6, mr.getParameter("pspec"));
		ps.setString(7, mr.getParameter("pcontents"));
		ps.setInt(8, Integer.parseInt(mr.getParameter("price")));
		ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	public ProductsBean updateSelProduct(int pnum) throws Exception {
		conn = getConnection();
		ProductsBean pb = null;
		String sql = "select * from products where pnum = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		rs = ps.executeQuery();
		while(rs.next()) {
			pb = getProductsBean(rs);
			
		}
		return pb;
	}
	public int updateProducts(MultipartRequest mr, String img) throws Exception{
		conn = getConnection();
		int cnt = -1;
		String sql = "update products set pname=?, pname2=?, pcompany=?, pimage=?, pqty=?, pspec=?, pcontents=?, price=?, point=? where pnum=?";


			ps = conn.prepareStatement(sql);

			ps.setString(1,mr.getParameter("pname"));
			ps.setString(2,mr.getParameter("pname2"));
			ps.setString(3,mr.getParameter("pcompany"));
			ps.setString(4, img);
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));				
			ps.setString(6,mr.getParameter("pspec"));
			ps.setString(7,mr.getParameter("pcontents"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("price")));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			ps.setInt(10, Integer.parseInt(mr.getParameter("pnum")));

			cnt = ps.executeUpdate();
		
		return cnt;
	}
	public int deleteProduct(int pnum) throws Exception {
		conn = getConnection();
		String sql = "delete from products where pnum = ?";
		int cnt = -1;
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		cnt = ps.executeUpdate();
		return cnt;
	}
	public ArrayList<ProductsBean> listType(String cname) throws Exception {
		conn = getConnection();
		ArrayList<ProductsBean> lists = new ArrayList<ProductsBean>();
		ProductsBean pb = null;
		String sql = "select * from products where pname = ? ";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, cname);
		rs = ps.executeQuery();
		while(rs.next()) {
			pb = getProductsBean(rs);
			lists.add(pb);
		}
		return lists;
	}
	public ArrayList<ProductsBean> mainMall(String spec) throws Exception {
		conn = getConnection();
		
		ArrayList<ProductsBean> lists = new ArrayList<ProductsBean>();
		ProductsBean pb = null;
		
		String sql = "select * from products where pspec = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, spec);
		
		rs = ps.executeQuery();
		while(rs.next()) {
			pb = getProductsBean(rs);
			lists.add(pb);
		}
		return lists;
	}
	public ArrayList<ProductsBean> detailProduct(int pnum) throws Exception {
		conn = getConnection();
		ArrayList<ProductsBean> lists = new ArrayList<ProductsBean>();
		ProductsBean pb = null;
		String sql = "select * from products where pnum = ?";
		ps = conn.prepareStatement(sql);
		
		ps.setInt(1, pnum);
		rs = ps.executeQuery();
		if(rs.next()) {
			pb = getProductsBean(rs);
			
			lists.add(pb);
			}
		return lists;
		
	}
	public ArrayList<ProductsBean> searchItem(String selProduct) throws Exception {
		conn = getConnection();
		ArrayList<ProductsBean> lists = new ArrayList<ProductsBean>();
		String sql = "select * from products where pcontents like ? or pname2 like ?";
		ProductsBean pb = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+selProduct+"%");
		ps.setString(2, "%"+selProduct+"%");
		
		rs = ps.executeQuery();
		while(rs.next()) {
			pb = getProductsBean(rs);
			
			lists.add(pb);
		}
		return lists;
	}
}
