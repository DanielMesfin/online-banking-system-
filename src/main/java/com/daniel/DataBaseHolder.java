package com.daniel;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
// Data base class 
public class DataBaseHolder {
	// variable declaration
	final String DB_URL = "jdbc:mysql://localhost:3306/EB";
	final String USERNAME = "root";
	final String PASSWORD = "";
	final String DRIVER = "com.mysql.jdbc.Driver";
	// 1, Loading Driver;
	public void loadDriver(String driver) {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
		}
	}

	// 2, function for connection ;
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}

	// f3 function for creating new user of bank;
	public int insert(UserInformation user) {
		int addedRows = 0;
		String sql = "INSERT INTO usersInformation (FullName, Account, EmialAddress,  password) "
				+ "VALUES ( ?, ?, ?, ?)";
		try {
			loadDriver(DRIVER);
			Connection conn = getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setString(2, user.getAccountNumber());
			preparedStatement.setString(3, user.getEmailAddress());
			preparedStatement.setString(4, user.getPassword());
			addedRows = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		}
		return addedRows;
	}

	// f4 for checking user login;
	public boolean logIn(Login logobj) {
		String accountId = logobj.getAccountN();
		String passwordId = logobj.getPasswordN();
		boolean logInTo = false;
		try {
			String sqli = "SELECT  Account,password FROM usersinformation WHERE Account='" + accountId
					+ "' and password ='" + passwordId + "'";
			loadDriver(DRIVER);
			Connection conn = getConnection();
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sqli);
			if (resultSet.next()) {
				logInTo = true;
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return logInTo;
	}

	// f5 function for checking user already have account or not
	public boolean saveData(String account) {
		boolean haveAccount = false;
		loadDriver(DRIVER);
		Connection conn = getConnection();
		try {
			String sqli = "SELECT  Account FROM  transaction WHERE Account='" + account + "'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sqli);
			if (resultSet.next()) {
				haveAccount = true;
			}
		} catch (Exception e) {
			e.getMessage();
			haveAccount = false;
		}
		return haveAccount;
	}

	// f6 function for new user to have Deposit
	public boolean transactionDeposit(Transaction transaction) {
		loadDriver(DRIVER);
		Connection conn = getConnection();
		boolean excuted = false;
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String dateCurrent = date.format(now);
		//INSERT INTO transaction (Id,Account,tType,Balance,Date) VALUES(0,'40','Deposit',500,Date)
		String sqli = "INSERT INTO transaction (Id,Account,tType,Balance,Date) VALUES (?,?, ?, ?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sqli);
			preparedStatement.setInt(1, 0);
			preparedStatement.setString(2, transaction.getAccount());
			preparedStatement.setString(3, transaction.gettType());
			preparedStatement.setDouble(4, transaction.getAmount());
			preparedStatement.setString(5, dateCurrent);
			int addedRows = preparedStatement.executeUpdate();
			if(addedRows>0) {
				excuted = true;
			}else {
				excuted = false;
			}
		} catch (Exception e) {
			excuted = false;
			System.out.print(e.getMessage());
			
		}
		return excuted;
	}

	// 7,function for deposit the amount to update Deposit--f
	public boolean transactionCredit(Transaction transaction) {
		boolean transactionCredit = false;
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String dateCurrent = date.format(now);
		loadDriver(DRIVER);
		Connection conn = getConnection();
		// get the previous balance form the database
		Double balanceCheck = balanceChack(transaction.getAccount());
		// perform your logic on the data from the database and the user input data
		try {
			Double newBalance = transaction.getAmount();
			balanceCheck = balanceCheck + newBalance;
			String sql1 = "Update  transaction set tType='" + transaction.gettType() + "',Balance=" + balanceCheck
					+ ", Date='" + dateCurrent + "' where Account='" + transaction.getAccount() + "'";
			Statement statement = conn.createStatement();
			statement.executeUpdate(sql1);
			transactionCredit = true;
		} catch (Exception e) {
			transactionCredit = false;
		}
		return transactionCredit;
	}

	// 8, function for withdrawal of money
	public boolean transactionWithdrawal(Transaction transaction) {
		boolean transactionWithdrawal = false;
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String dateCurrent = date.format(now);
		loadDriver(DRIVER);
		Connection conn = getConnection();
		Double balanceCheck = balanceChack(transaction.getAccount());
		if (balanceCheck >= transaction.getAmount()) {
			try {
				Double newBalance = transaction.getAmount();
				balanceCheck = balanceCheck - newBalance;
				String sql1 = "Update  transaction set tType='" + transaction.gettType() + "',Balance=" + balanceCheck
						+ ", Date='" + dateCurrent + "' where Account='" + transaction.getAccount() + "'";
				Statement statement = conn.createStatement();
				statement.executeUpdate(sql1);
				transactionWithdrawal = true;
			} catch (Exception e) {
				transactionWithdrawal = false;
			}
		}
		return transactionWithdrawal;
	}

	// 9, Transfer form one to the other account
	public boolean transactionTransfared(Account2Account a2a) {
		boolean commited = false;
		loadDriver(DRIVER);
		Connection connection = getConnection();
        PreparedStatement preparedStatement1;
    	PreparedStatement preparedStatement2;
    	PreparedStatement preparedStatement3;

		Double senderBalance=balanceChack(a2a.getSender());
		Double reciverBalance=balanceChack(a2a.getReciver());

		try {
			if(senderBalance>=a2a.getAmountPassed()) {
		connection.setAutoCommit(false);
		Double  sender=senderBalance - a2a.getAmountPassed();
		
		// this is for reducing the sender balance
		preparedStatement1 = connection.prepareStatement("Update transaction set Balance ="+sender+",tType='Debited' where Account ='"+a2a.getSender()+"'");
		preparedStatement1.executeUpdate();
		// this is for reciver 
		Double  reciver=reciverBalance + a2a.getAmountPassed();
		preparedStatement2= connection.prepareStatement("Update transaction set Balance ="+reciver+",tType='Credited' where Account ='"+a2a.getReciver()+"'");
		preparedStatement2.executeUpdate();
		// for save the tansaction history 
			String sqli ="INSERT INTO transfer (idT, senderAccoount, reciverAccount, Amount) VALUES ( ?, ?, ?,?)";
			preparedStatement3 = connection.prepareStatement(sqli);
			preparedStatement3.setInt(1, 0);
			preparedStatement3.setString(2, a2a.getSender());
			preparedStatement3.setString(3, a2a.getReciver());
			preparedStatement3.setDouble(4, a2a.getAmountPassed());
			preparedStatement3.executeUpdate();
         connection.commit();
         commited=true;
         
		}

		} catch (Exception e) {
			commited=false;
			System.out.print(e.getMessage());
		}
		return commited;
	}

	// 10, function for check the balance from return double data type
	public Double balanceChack(String accountNumber) {
		loadDriver(DRIVER);
		Connection conn = getConnection();
		Double balance = 0.0;
		try {
			String sqli = "SELECT  Balance FROM  transaction WHERE Account='" + accountNumber + "'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sqli);
			if (resultSet.next()) {
				balance = (double) resultSet.getDouble("Balance");
			}
		} catch (Exception e) {
			balance = 0.0;
		}
		return balance;
	}

	// 11, function for checking user login;
	public String userName(String account) {
		String logInTo = null;
		try {
			String sqli = "SELECT FullName FROM usersinformation WHERE Account='" + account + "'";
			loadDriver(DRIVER);
			Connection conn = getConnection();
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sqli);
			if (resultSet.next()) {
				logInTo = resultSet.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return logInTo;
	}
	// 12. function for displaying transaction history
   public boolean updateUserInformation(userUpdateInformation user) {
	   boolean updated=false;
	   loadDriver(DRIVER);
	   Connection connection = getConnection();
	   String sql="Update usersInformation set FullName ='"+user.getUserName()+"', EmialAddress ='"+user.getEmailAddress()+"', password='"+user.getPassword()+"'  where Account = '"+user.getAccount()+"'";
	   try {
		PreparedStatement preparedStatement =connection.prepareStatement(sql);
	  int up =	preparedStatement.executeUpdate();
	  if(up>0) {
		  updated=true;
	  }else {
		  updated=false;
	  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		updated=false;
	}
	   
	   return updated;
   }

//11, function for checking user email;
	public String userEmail(String account) {
		String logInTo = null;
		try {
			String sqli = "SELECT  EmialAddress FROM usersinformation WHERE Account='" + account + "'";
			loadDriver(DRIVER);
			Connection conn = getConnection();
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sqli);
			if (resultSet.next()) {
				logInTo = resultSet.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return logInTo;
	}
	// 11, function for checking user password;
	public String userPasword(String account) {
			String logInTo = null;
			try {
				String sqli = "SELECT password FROM usersinformation WHERE Account='" + account + "'";
				loadDriver(DRIVER);
				Connection conn = getConnection();
				Statement statement = conn.createStatement();
				ResultSet resultSet = statement.executeQuery(sqli);
				if (resultSet.next()) {
					logInTo = resultSet.getString(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return logInTo;
		}
   // list history he will need
	public List<Transaction> getAllHistory(String account){
		List<Transaction>histroy=new ArrayList<Transaction>();
		
		loadDriver(DRIVER);
		Connection conn=getConnection();
		try {
			Transaction transaction=null;
			PreparedStatement ps=conn.prepareStatement("select * from log where Account='"+account+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				transaction=new Transaction();
				transaction.setAccount(rs.getString(2));
				transaction.settType(rs.getString(3));
				transaction.setAmount(rs.getDouble(4));
				transaction.setDate(rs.getTimestamp(5));
				histroy.add(transaction);
			}
			return histroy;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}