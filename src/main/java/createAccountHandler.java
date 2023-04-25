import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.DataBaseHolder;
import com.daniel.UserInformation;

@WebServlet("/createAccountHandler")
public class createAccountHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public createAccountHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("fristName") + " " + request.getParameter("lastName");
		String accountNumber = request.getParameter("accountNumber");
		String emial = request.getParameter("email");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cPassword");
		UserInformation information = null;
		if (!fullName.isEmpty() && !accountNumber.isEmpty() && !emial.isEmpty() && !password.isEmpty()
				&& !cpassword.isEmpty()) {
			if (password.equals(cpassword)) {
				// 1, Call the constructor of user information to provide user information;
				information = new UserInformation(fullName, accountNumber, emial, password, cpassword);
				// 2, Call the constructor of database holder to get database method
				DataBaseHolder dataBaseHolder = new DataBaseHolder();
				int result = dataBaseHolder.insert(information);
				// 3 display some sort of information for the user
				PrintWriter out = response.getWriter();
				out.println("<html lang=\"en\">");
				out.println("<head>");
				out.println("</head>");
				out.println("<body bgcolor=pink>");
				out.println("<center>");
				out.println("<h1> Ethio Bank</h1>");
				out.println("<h3> Your Account is Created By The  Following Information</h3>");
				out.println("<center>");
				out.println("<table><tr><td><h3>Full Name:</td><td></h3><h3>" + information.getFullName()
						+ "</h3></td></tr>");
				out.println("<tr><td><h3>Account Number :</td><td></h3><h3>" + information.getAccountNumber()
						+ "</h3></td></tr>");
				out.println("<tr><td><h3> Email Address :</td><td></h3><h3>" + information.getEmailAddress()
						+ "</h3></td></tr>");
				out.println("<tr><td><h3> We are glad for your choose Thank you</p></h3></td></tr>");
				out.println("<tr><td><h3><a href='/EthioBankWebApplication/Componet/createAccount.jsp'>Back</a></h3></td></tr></table>");
				out.println("</body>");
				out.println("</html >");
			} else {
				response.getWriter().println("<h1>Your Password Is Not Confrmed Please Check Your Password <h1>");
			}
		} else {
			response.getWriter().println("<h1> Please  Fill The Form All Properly <h1>");
		}
	}

}
