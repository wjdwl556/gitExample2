package check;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		checkDAO dao = new checkDAO();
		
		String jungbokid = dao.selectid(req.getParameter("id"));
		//db�� ���� �ִ��� Ȯ�� ������ id�� ������ null ����
		
		if(jungbokid==null){			
			jungbokid="";
			//�ش� ���̵� ������ �������� ó��
		}
		req.setAttribute("jungbokid", jungbokid);
		req.setAttribute("id", req.getParameter("id"));
		
		RequestDispatcher dis = req.getRequestDispatcher("CheckID.jsp");
		dis.forward(req, resp);
		
		
	}
}
