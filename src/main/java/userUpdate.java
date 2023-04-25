import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.daniel.DataBaseHolder;
import com.daniel. userUpdateInformation;
@WebServlet("/userUpdate")
public class userUpdate extends HttpServlet {
private static final long serialVersionUID = 1L;
    public userUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String userName=request.getParameter("fullname");
     String  accontNumber=(String)request.getSession().getAttribute("accountNumber"); 
     String userEmail=request.getParameter("emailAddressEdit");
     String userPassword=request.getParameter("accontPassword");
    userUpdateInformation uUI= new userUpdateInformation(userName, userEmail, userPassword, accontNumber);
	DataBaseHolder db=new DataBaseHolder();
	boolean updated=db.updateUserInformation(uUI);
	PrintWriter out= response.getWriter();
	response.setContentType("text/html");
	if (updated) {
		out.println("<html lang=\"en\">");
		out.println("<head>");
		out.println("</head>");
		out.println("<body bgcolor=pink>");
		out.println("<center>");
		out.println("<h1> Ethio Bank</h1>");
		out.println("<center >");
		out.println("<h3> Your Transaction is Cometid By The Following Inforamtion<h3>");
		out.println("<table><tr><td><h3>Account User :</td><td></h3><h3>" + userName + "</h3></td></tr>");
		out.println("<tr><td><h3>Account Number :</td><td></h3><h3>" + accontNumber + "</h3></td></tr>");
		out.println("<tr><td><h3>Email Address :</td><td></h3><h3>" + userEmail + "</h3></td></tr>");
		out.println(" <tr><td><p>We are glad for your choose Thank you</p></td>");
		out.println("<td><a href='/EthioBankWebApplication/Componet/dashBord.jsp'>Back</a> </td></tr></table>");
		
		out.println("</body>");
		out.println("</html >");
	}
	else {
		out.println("<html lang=\"en\">");
		out.println("<head>");
		out.println("</head>");
		out.println("<body bgcolor=pink>");
		out.println("<center>");
		out.println("<h1> Ethio Bank</h1>");
		out.println("<center >");
		out.println("<h3> Your Profile is not Updated<h3>");
		out.println("</body>");
		out.println("</html >");
	}
	}
}
