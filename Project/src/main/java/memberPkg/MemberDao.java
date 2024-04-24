package memberPkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {

	}

	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}

	public int insertMember(MemberBean mb) throws Exception {
		conn = getConnection();

		String sql = "insert into member values(mseq.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		int cnt = -1;
		ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getId());
		ps.setString(2, mb.getPassword());
		ps.setString(3, mb.getName());
		ps.setString(4, mb.getEmail1());
		ps.setString(5, mb.getEmail2());
		ps.setString(6, mb.getResiNum());
		ps.setString(7, mb.getResiNum2());
		ps.setString(8, mb.getGender());
		ps.setString(9, mb.getHp1());
		ps.setString(10, mb.getHp2());
		ps.setString(11, mb.getHp3());
		System.out.print(mb.getResiNum());
		System.out.print(mb.getResiNum2());
		cnt = ps.executeUpdate();
		return cnt;
	}

	public boolean searchId(String id) throws Exception {
		conn = getConnection();
		boolean check = false;

		String sql = "select * from member where id = ?";

		ps = conn.prepareStatement(sql);
		ps.setString(1, id);

		rs = ps.executeQuery();
		if(rs.next()) {
			check = true;
		}

		return check;
	}
	public MemberBean loginCheck(String id, String password) throws Exception {
		conn = getConnection();
		String sql = "select * from member where id = ? and password = ?";
		MemberBean mb = null;

		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, password);

		rs = ps.executeQuery();
		while(rs.next()) {
			mb = getMemberBean(rs);

		}
		return mb;

	}
	public ArrayList<MemberBean> allUser() throws Exception {
		conn = getConnection();

		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		MemberBean mb = null;
		String sql = "select * from member order by no";

		ps = conn.prepareStatement(sql);

		rs = ps.executeQuery();
		while(rs.next()) {
			mb = getMemberBean(rs);
			
			lists.add(mb);
		}
		return lists;
	}
	public int memberDelete(int no) throws Exception {
		conn = getConnection();
		
		String sql = "delete from member where no = ?";
		int cnt = -1;
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, no);
		
		cnt = ps.executeUpdate();
		
		return cnt;
		
	}
	public MemberBean updateSelMember(int no) throws Exception {
		conn = getConnection();
		MemberBean mb = null;
		String sql = "select * from member where no = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, no);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			mb = getMemberBean(rs);
		}
		
		return mb;
	}
	public int updateMember(MemberBean mb) throws Exception {
		conn = getConnection();
		
		String sql = "update member set id= ?, password= ?, name= ?, email1= ?, email2= ?, resiNum= ?, resiNum2= ?,"
				+ "gender= ?, hp1= ?, hp2= ?, hp3= ? where no = ?";
		int cnt = -1;
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, mb.getId());
		ps.setString(2, mb.getPassword());
		ps.setString(3, mb.getName());
		ps.setString(4, mb.getEmail1());
		ps.setString(5, mb.getEmail2());
		ps.setString(6, mb.getResiNum());
		ps.setString(7, mb.getResiNum2());
		ps.setString(8, mb.getGender());
		ps.setString(9, mb.getHp1());
		ps.setString(10, mb.getHp2());
		ps.setString(11, mb.getHp3());
		ps.setInt(12, mb.getNo());
		
		System.out.println(mb.getId());
		System.out.println(mb.getName());
		System.out.println(mb.getNo());
		System.out.println(mb.getEmail1());
		System.out.println(mb.getHp1());
		System.out.println(mb.getResiNum());
		System.out.println(mb.getResiNum2());
		System.out.println(mb.getGender());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public MemberBean getMemberBean(ResultSet rs) throws SQLException {
		MemberBean mb = new MemberBean();
		mb.setNo(rs.getInt("no"));
		mb.setId(rs.getString("id"));
		mb.setPassword(rs.getString("password"));
		mb.setName(rs.getString("name"));
		mb.setEmail1(rs.getString("email1"));
		mb.setEmail2(rs.getString("email2"));
		mb.setResiNum(rs.getString("resiNum"));
		mb.setResiNum2(rs.getString("resiNum2"));
		mb.setGender(rs.getString("gender"));
		mb.setHp1(rs.getString("hp1"));
		mb.setHp2(rs.getString("hp2"));
		mb.setHp3(rs.getString("hp3"));
		
		return mb;
	}
	public MemberBean findId(String name, String hp1, String hp2, String hp3) throws Exception {
		conn = getConnection();
		String sql = "select * from member where name = ? and hp1 = ? and hp2 = ? and hp3 = ? ";
		MemberBean mb = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, hp1);
		ps.setString(3, hp2);
		ps.setString(4, hp3);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			mb = getMemberBean(rs);
		}
		return mb;
	}
	public MemberBean findPw(String id, String name) throws Exception {
		conn = getConnection();
		String sql = "select * from member where id = ? and name = ?";
		MemberBean mb = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			mb = getMemberBean(rs);
		}
		return mb;
	}
}
