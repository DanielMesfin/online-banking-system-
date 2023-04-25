
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/trasactionAccountHolder")
public class trasactionAccountHolder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public trasactionAccountHolder() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// String accontNumber=request.getParameter("accountNumber");
		response.sendRedirect("/EthioBankWebApplication/Componet/dashBord.jsp");
	}
}
