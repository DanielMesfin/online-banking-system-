
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.daniel.DataBaseHolder;
import com.daniel.Login;
import com.daniel.Transaction;
@WebServlet("/loginAccountHandler")
public class loginAccountHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginAccountHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean wind=true;
		String accountNumber = request.getParameter("accountNumber");
		String password = request.getParameter("password");
		Login login = new Login(accountNumber, password);
		DataBaseHolder dataBaseHolder = new DataBaseHolder();
	    List<Transaction>hisData = (List<Transaction>)dataBaseHolder.getAllHistory(accountNumber);
		boolean log = dataBaseHolder.logIn(login);
		if (log) {
			request.getSession().setAttribute("accountNumber", login.getAccountN());
			request.getSession().setAttribute("his", hisData);
			request.getRequestDispatcher("/trasactionAccountHolder").forward(request, response);
			
		} else {
			wind=false;
			PrintWriter out= response.getWriter();
			
			out.println("<html lang=\"en\">");
			out.println("<head>");
			out.println("</head>");
			out.println("<body bgcolor=pink>");
			out.println("<center>");
			out.println("<h1> Ethio Bank</h1>");
			out.println("<center >");
			out.println("<h3> Accont or Password is incorrect!<h3>");
			out.println("</body>");
			out.println("</html >");
			//request.getSession().setAttribute("loged", wind);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
//			response.getWriter().append("Accont or Password is incorrect!");
		}

	}
}
