package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	private BoardDao() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	
	public ArrayList<BoardBean> BoardList(int start, int end) throws Exception{
		conn = getConnection();
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		
		String sql = "select num, writer, title, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, title, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, title, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc)) ";
		sql += "where rank between ? and ? ";	
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		rs = ps.executeQuery();
		while(rs.next()) {
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String passwd = rs.getString("passwd");
			Timestamp reg_date = rs.getTimestamp("reg_date");
			int readcount = rs.getInt("readcount");
			int ref = rs.getInt("ref");
			int re_step = rs.getInt("re_step");
			int re_level = rs.getInt("re_level");
			String content = rs.getString("content");
			String ip = rs.getString("ip");
			
			BoardBean bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setWriter(writer);
			bb.setTitle(title);
			bb.setPasswd(passwd);
			bb.setReg_date(reg_date);
			bb.setReadcount(readcount);
			bb.setRef(ref);
			bb.setRe_step(re_step);
			bb.setRe_level(re_level);
			bb.setContent(content);
			bb.setIp(ip);

			lists.add(bb);
		}
		return lists;
	}
	public int BoardCount() throws Exception {
		conn = getConnection();
		String sql = "select count(*) as cnt from board";
		int count = 0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		return count;
	}
	public int BoardInsert(BoardBean bb) throws Exception {
		conn = getConnection();
		String sql = "insert into board(num,writer,title,passwd,"
				+ "reg_date,ref,re_step,re_level,content,ip) "
				+ "values(bseq.nextval,?,?,?,?,bseq.currval,?,?,?,?)";
		
		int cnt = -1;
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, bb.getWriter());
		ps.setString(2, bb.getTitle());
		ps.setString(3, bb.getPasswd());
		ps.setTimestamp(4,bb.getReg_date());
		ps.setInt(5, 0);
		ps.setInt(6, 0);
		ps.setString(7, bb.getContent());
		ps.setString(8, bb.getIp());
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	public BoardBean BoardContent(int num) throws Exception {
		conn = getConnection();
		
		String sql2 ="update board set readcount=readcount + 1 where num =?";
		String sql = "select * from board where num = ?";
		BoardBean bb = null;
		
		ps = conn.prepareStatement(sql2);
		ps.setInt(1, num);
		int cnt = ps.executeUpdate();
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		rs = ps.executeQuery();
		if(rs.next()) {
			bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setWriter(rs.getString("writer"));
			bb.setTitle(rs.getString("title"));
			bb.setPasswd(rs.getString("passwd"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));
			
		}
		return bb;
	}
	public BoardBean updateSelNum(int num) throws Exception {
		conn = getConnection();
		
		String sql = "select * from board where num = ?";
		BoardBean bb = null;
		
		ps = conn.prepareStatement(sql);
		
		ps.setInt(1, num);
		rs = ps.executeQuery();
		while(rs.next()) {
			bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setWriter(rs.getString("writer"));
			bb.setTitle(rs.getString("title"));
			bb.setPasswd(rs.getString("passwd"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));
			
		}
		return bb;
	}
	public int BoardUpdate(BoardBean bb) throws Exception {
		conn = getConnection();
	
		String sql = "select passwd from board where num = ?";
		String sql2 = "update board set writer = ?, title = ?, content = ? where num = ?";
	
		int cnt = -1;
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, bb.getNum());
		rs = ps.executeQuery();
		
		if(rs.next()) {
			if(bb.getPasswd().equals(rs.getString("passwd"))) {
				ps = conn.prepareStatement(sql2);
				ps.setString(1, bb.getWriter());
				ps.setString(2, bb.getTitle());
				ps.setString(3, bb.getContent());
				ps.setInt(4, bb.getNum());
				
				cnt = ps.executeUpdate();
			
				}
			}
		return cnt;
	}
	public int BoardDelete(int num, String id, String passwd) throws Exception {
		conn = getConnection();
		int cnt = -1;

		String sql = "select writer, passwd from board where num=?";
		System.out.println(id);
		System.out.println(num);
		System.out.println(passwd);
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			if(passwd.equals(rs.getString("passwd")) && id.equals(rs.getString("writer"))){
				String sql2 = "delete from board where num=?";
				ps = conn.prepareStatement(sql2);
				ps.setInt(1, num);
				
				cnt = ps.executeUpdate();
			}
		}
		return cnt;
	}
	public int BoardReply(BoardBean bb) throws Exception {
		conn = getConnection();
		
		String sql2 = "update board set re_step=re_step+1 where ref = ? and re_step>?";
		
		String sql = "insert into board(num,writer,title,passwd,reg_date,ref,re_step,re_level,content,ip) values(bseq.nextval,?,?,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		ps = conn.prepareStatement(sql2);
				
		ps.setInt(1, bb.getRef());
		ps.setInt(2, bb.getRe_step());
		
		cnt = ps.executeUpdate();
		
		int re_step = bb.getRe_step()+1;
		int re_level = bb.getRe_level()+1;
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, bb.getWriter());
		ps.setString(2, bb.getTitle());
		ps.setString(3, bb.getPasswd());
		ps.setTimestamp(4,bb.getReg_date());
		ps.setInt(5, bb.getRef());
		ps.setInt(6, re_step);
		ps.setInt(7, re_level);
		ps.setString(8, bb.getContent());
		ps.setString(9, bb.getIp());
		cnt = ps.executeUpdate();
				
				return cnt;
	}
}
