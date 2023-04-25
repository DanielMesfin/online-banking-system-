import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.DataBaseHolder;
import com.daniel.Transaction;
import com.daniel.Account2Account;
@WebServlet("/bankTransactionHandler")
public class bankTransactionHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public bankTransactionHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String account = (String) request.getSession().getAttribute("accountNumber");
		String accountReciver=request.getParameter("reciverAccount");
		String tType = request.getParameter("tType");
		Double amount = Double.parseDouble(request.getParameter("amountOfMoney"));
		Transaction transacton = new Transaction();
		transacton.setAccount(account);
		transacton.setAmount(amount);
		transacton.settType(tType);
		DataBaseHolder ethioBankDataBasee = new DataBaseHolder();
		if (!tType.isEmpty() && !amount.isNaN()) {
			if (tType.equals("Deposit")) {
				boolean depositeState = ethioBankDataBasee.saveData(transacton.getAccount());
				boolean trans = false;
				if (depositeState) {
					trans = ethioBankDataBasee.transactionCredit(transacton);		
					} else {
     				trans = ethioBankDataBasee.transactionDeposit(transacton);
        			}
				response.setContentType("text/html");
				Double totalBalance = ethioBankDataBasee.balanceChack(transacton.getAccount());
				String userN = ethioBankDataBasee.userName(transacton.getAccount());
				if (trans) {
					out.println("<html lang=\"en\">");
					out.println("<head>");
					out.println("</head>");
					out.println("<body bgcolor=pink>");
					out.println("<center>");
					out.println("<h1> Ethio Bank</h1>");
					out.println("<center>");
					out.println("<h3> Your Transaction is Cometid By The Following Inforamtion<h3>");
					out.println("<table><tr><td><h3>Account User :</td><td></h3><h3>" + userN + "</h3></td></tr>");
					out.println("<tr><td><h3>Account Number :</td><td></h3><h3>" + account + "</h3></td></tr>");
					out.println("<tr><td><h3>Transaction Type :</td><td></h3><h3>" + tType + "</h3></td></tr>");
					out.println("<tr><td><h3> Amount Credited:</td><td></h3><h3>" + amount + " ETB</h3></td></tr>");
					out.println("<tr><td><h3> Balance :</td><td></h3><h3>"
							+ ethioBankDataBasee.balanceChack(transacton.getAccount()) + "ETB</h3></td></tr></table>");
					out.println(" <tr><td><p>We are glad for your choose Thank you</p></td>");
					out.println("<td><a href='/EthioBankWebApplication/Componet/dashBord.jsp'>Back</a> </td></tr></table>");					
					out.println("</body>");
					out.println("</html >");
				} else {
					response.getWriter().print(trans);
					
				}
			}

			if (tType.equals("Withdrawal")) {
				// for with withdrawal
				boolean withdrawal = ethioBankDataBasee.transactionWithdrawal(transacton);
				Double balanceSenn = ethioBankDataBasee.balanceChack(account);
				String user = ethioBankDataBasee.userName(account);
				response.setContentType("text/html");
				if (withdrawal) {
					out.println("<html lang=\"en\">");
					out.println("<head>");
					out.println("</head>");
					out.println("<body bgcolor=pink>");
					out.println("<center>");
					out.println("<h1> Ethio Bank</h1>");
					out.println("<center>");
					out.println("<h3> Your Transaction is Cometid By The Following Inforamtion<h3>");
					out.println("<table><tr><td><h3>Account User :</td><td></h3><h3>" + user + "</h3></td></tr>");
					out.println("<tr><td><h3>Account Number :</td><td></h3><h3>" + account + "</h3></td></tr>");
					out.println("<tr><td><h3>Transaction Type :</td><td></h3><h3>" + tType + "</h3></td></tr>");
					out.println("<tr><td><h3> Amount Debited :</td><td></h3><h3>" + amount + "ETB</h3></td></tr>");
					out.println("<tr><td><h3>Total Balance :</td><td></h3><h3>" + balanceSenn
							+ "ETB</h3></td></tr></table>");
					out.println(" <tr><td><p>We are glad for your choose Thank you</p></td>");
					out.println("<td><a href='/EthioBankWebApplication/Componet/dashBord.jsp'>Back</a> </td></tr></table>");
					
					out.println("</body>");
					out.println("</html >");
				} else {
					out.println("<html lang=\"en\">");
					out.println("<head>");
					out.println("</head>");
					out.println("<body bgcolor=pink>");
					out.println("<center>");
					out.println("<h1> Ethio Bank</h1>");
					out.println("<center>");
					out.println(
							"<h3  style='color:red'> Your Transaction is Not Cometid By The Following Inforamtion<h3>");
					out.println("<table><tr><td><h3>Account User :</td><td></h3><h3>" + user + "</h3></td></tr>");
					out.println("<tr><td><h3>Account Number :</td><td></h3><h3>" + account + "</h3></td></tr>");
					out.println("<tr><td><h3>Transaction Type :</td><td></h3><h3>" + tType + "</h3></td></tr>");
					out.println("<tr><td><h3 style='color:red'> Amount Debited :</td><td></h3><h3>" + amount
							+ "ETB</h3></td></tr>");
					out.println("<tr><td><h3>Total Balance :</td><td></h3><h3>" + balanceSenn + "ETB</h3></td></tr>");
					out.println("<tr><td><h3  style='color:red'> Total Balance :</td><td></h3><h3>" + balanceSenn
							+ "ETB is less than current request " + amount + "ETB</h3></td></tr></table> ");
					out.println(" <tr><td><p>We are glad for your choose Thank you</p></td>");
					out.println("<td><a href='/EthioBankWebApplication/Componet/dashBord.jsp'>Back</a> </td></tr></table>");
					out.println("</body>");
					out.println("</html >");
				}
			}
			if (tType.equals("Transfare")) {
				Account2Account a2a= new Account2Account(account, accountReciver, amount, tType);
				boolean transefer = ethioBankDataBasee.transactionTransfared(a2a);
				response.setContentType("text/html");
				if (transefer) {
					out.println("<html lang=\"en\">");
					out.println("<head>");
					out.println("</head>");
					out.println("<body bgcolor=pink>");
					out.println("<center>");
					out.println("<h1> Ethio Bank<h1>");
					out.println("<center>");
					out.println("<h3> Your Transaction is Cometid By The Following Inforamtion<h3>");
					out.println("<h5> Thank Your , "+amount+" Is Transefed To "+ethioBankDataBasee.userName(accountReciver)+" Form "+ethioBankDataBasee.userName(account)+"<h3>");
					out.println("<p>We are glad for your choose Thank you</p>");
					out.println("<a href='/EthioBankWebApplication/Componet/dashBord.jsp'>Back</a>");
					out.println("</body>");
					out.println("</html >");
				} else {
					out.println("<h3> Your Transaction is  Not Cometid <h3>");
					out.println(amount+" "+accountReciver+"reciver "+account+tType);
				}
			}
		} else {
			out.println("<html lang=\"en\">");
			out.println("<head>");
			out.println("</head>");
			out.println("<body bgcolor=pink>");
			out.println("<center>");
			out.println("<h1> Ethio Bank</h1>");
			
			out.println("<center>");
			out.println("<h3> Please Fill All The Information Correctly<h3>");
			out.println(" <p>We are glad for your choose Thank you</p>");
			out.println("</body>");
			out.println("</html >");
		}
		}
		}
	

