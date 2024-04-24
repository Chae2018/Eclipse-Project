package catePkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CateDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public static CateDao instance = new CateDao();

	public static CateDao getInstance() {
		return instance;
	}

	private CateDao(){

	}

	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	public int categoryInsert(CateBean cb) throws Exception {
		conn = getConnection();

		String sql = "insert into cate values(cseq.nextval,?,?)";

		ps = conn.prepareStatement(sql);
		ps.setString(1, cb.getCname());
		ps.setString(2, cb.getCcode());

		int cnt = ps.executeUpdate();

		return cnt;
	}
	public ArrayList<CateBean> cateList() throws Exception{
		conn = getConnection();

		ArrayList<CateBean> lists = new ArrayList<CateBean>();
		CateBean cb = null;
		String sql = "select * from cate order by cnum";

		ps = conn.prepareStatement(sql);

		rs = ps.executeQuery();
		while(rs.next()) {
			cb = new CateBean();
			cb.setCnum(rs.getInt("cnum"));
			cb.setCname(rs.getString("cname"));
			cb.setCcode(rs.getString("ccode"));

			lists.add(cb);
		}
		return lists;
	}
	public CateBean updateSelCate(int cnum) throws Exception {
		conn = getConnection();
		CateBean cb = null;
		String sql ="select * from cate where cnum = ?";
		ps = conn.prepareStatement(sql);

		ps.setInt(1, cnum);
		rs = ps.executeQuery();
		if(rs.next()) {
			cb = new CateBean();
			cb.setCnum(rs.getInt("cnum"));
			cb.setCname(rs.getString("cname"));
			cb.setCcode(rs.getString("ccode"));
		}
		return cb;
	}
	public int updateCate(CateBean cb) throws Exception {
		conn = getConnection();
		
		int cnt = -1;
		String sql = "update cate set cname=?, ccode=? where cnum = ?";
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, cb.getCname());
		ps.setString(2, cb.getCcode());
		ps.setInt(3, cb.getCnum());
		System.out.println(cb.getCname());
		System.out.println(cb.getCcode());
		System.out.println(cb.getCnum());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	public int deleteCate(int cnum) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String sql = "delete from cate where cnum = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, cnum);
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
}
