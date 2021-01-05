package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import crypt.BCrypt;
import crypt.SHA256;
import oracle.jdbc.driver.DBConversion;

public class MemberDAO {
	
	public List<MemberDTO> memberList(){
		List<MemberDTO> items=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();//select문일때만 사용
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setJoin_date(rs.getDate("join_date"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return items;
	}//memberList()
	
	public void insert(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append(" (userid,passwd,name,email,hp) values ");
			sql.append("(?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();//update, insert, delete
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end insert()
	
	public MemberDTO memberDetail(String userid) {
		MemberDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql="select * from member where userid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setUserid(userid);
				dto.setPasswd(rs.getNString("passwd"));
				dto.setName(rs.getNString("name"));
				dto.setEmail(rs.getNString("email"));
				dto.setHp(rs.getNString("hp"));
				dto.setJoin_date(rs.getDate("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return dto;
	}//end memberDetail()

	public void update(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("update member set ");
			sb.append(" passwd=?, name=?, email=?, hp=? ");
			sb.append(" where userid=? ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getUserid());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end update()

	public void delete(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "delete from member where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);//?에 입력될 값
			pstmt.executeUpdate();//레코드 삭제
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end delete()

	public String loginCheck(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member where userid=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next()) {//로그인 성공
				result = rs.getString("name")+ "님 환영합니다.";
			}else {//로그인 실패
				result = "로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	//오라클 암호화를 적용한 코드
	public void insertCrypt(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append("(userid,passwd,name,email,hp) values ");
			sql.append("(?,PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?),?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

	public String loginCheckOracle(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member "
					+ "where userid=? "
					+ " and passwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?)";
			System.out.println(sql);
			System.out.println(dto);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next()) {//로그인 성공
				result = rs.getString("name")+ "님 환영합니다.";
			}else {//로그인 실패
				result = "로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	//SHA256 방식의 암호화 처리
	public void insertSha256(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append(" (userid,passwd,name,email,hp) values ");
			sql.append("(?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			SHA256 sha = SHA256.getInstance();
			//스트링을 바이트배열로 변환한 후 암호문 생성
			String shaPass = sha.getSha256(dto.getPasswd().getBytes());
			//암호화된 비밀번호 입력
			pstmt.setString(2, shaPass);
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//insertSha256()

	//SHA256 방식의 로그인 체크
	public String loginCheckSha256(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member where userid=? and passwd=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			SHA256 sha = SHA256.getInstance();
			String shaPass = sha.getSha256(dto.getPasswd().getBytes());
			pstmt.setString(2, shaPass);
			rs = pstmt.executeQuery();
			if (rs.next()) {//로그인 성공
				result = rs.getString("name")+ "님 환영합니다.";
			}else {//로그인 실패
				result = "로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	// bcrypt 방식의 비밀번호 암호화 처리
	public void insertBcrypt(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append(" (userid,passwd,name,email,hp) values ");
			sql.append("(?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			String passwd = BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt());
			//암호화된 비밀번호 입력
			pstmt.setString(2, passwd);
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end insertBcrypt()

	//Bcrypt 방식 로그인
	public String loginCheckBcrypt(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member where userid=? "; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String passwd = rs.getString("passwd");
				//checkpw(평문, 암호문)
				if (BCrypt.checkpw(dto.getPasswd(), passwd)) {
					result = rs.getString("name")+ "님 환영합니다.";
				} else {
					result = "로그인 실패...";
				}
			} else {
				result = "로그인 실패...";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	public int loginCheck(String userid, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT PASSWORD FROM JSP_MEMBER WHERE userid=?");
 
            conn = DB.getConn();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
	public String findid(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member where name=? and hp=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			rs = pstmt.executeQuery();
			if (rs.next()) {//로그인 성공
				result = rs.getString("name")+ "님 의아이디는 "+rs.getNString("userid")+"입니다.";
			}else {//로그인 실패
				result = "정보를 확인해주세요";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	public String findps(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql="select * from member where userid=? and hp=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getHp());
			rs = pstmt.executeQuery();
			if (rs.next()) {//로그인 성공
				result = rs.getString("userid")+ "님의 비밀번호는 "+rs.getString("passwd")+"입니다.";
			}else {//로그인 실패
				result = "정보를 확인해주세요";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
    
    /**
     * 아이디 중복체크를 한다.
     * @param id 아이디
     * @return x : 아이디 중복여부 확인값
     */
    public boolean duplicateIdCheck(String userid)
    {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT ID FROM JSP_MEMBER WHERE userid=?");
                        
            conn = DB.getConn();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, userid);
            rs = pstm.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
            return x;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstm != null ){ pstm.close(); pstm=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck



	

}