<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.daniel.DataBaseHolder"%>
<%@ page import="com.daniel.Transaction"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Your Account is loading </title>
    <meta charset="utf-8" />
    <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS v5.2.1 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
  </head>
  <body>
     
    <header>
      <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top mb-5"  id="navbarone" >
        <div class="container-fluid text-white">
          <a class="navbar-brand" href="#">EhioBank</a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
            <div class="row gx-4">
              <div class="d-flex col">
                <h5><a class="nav-link" href="#">Home</a></h5>
              </div>
              <div class="col d-flex">
                <h5><a class="nav-link" href="#">About</a></h5>
              </div>
              <div class="col d-flex">
                <a href="#"
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="26"
                    height="26"
                    fill="white"
                    class="bi bi-envelope"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"
                    />
                  </svg>
                </a>
              </div>
              <div class="col d-flex">
                <profile class=" dropdown-toggle" type="text" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false"><svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="26"
                    height="26"
                    fill="currentColor"
                    class="bi bi-person-fill"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"
                    />
                  </svg>
                </profile>
                <div class="dropdown-menu col-5 bg-black justify-content-center" aria-labelledby="defaultDropdown">
                  <!-- for updating user information-->
                   <% String  accontNumber=(String)request.getSession().getAttribute("accountNumber"); 
                  com.daniel.DataBaseHolder data=new com.daniel.DataBaseHolder();
                   Double balanceStored=data.balanceChack((String)request.getSession().getAttribute("accountNumber"));
                   String userName=data.userName((String)request.getSession().getAttribute("accountNumber"));
                   String userEmail=data.userEmail((String)request.getSession().getAttribute("accountNumber"));
                   String userPassword=data.userPasword((String)request.getSession().getAttribute("accountNumber"));

           
        %>
                  <form action="/EthioBankWebApplication/userUpdate" class="" method="post"> 
    
        <!-- look the difrance -->
                    <div class="row justify-content-center bg-opacity-100 bg-white  shadow mx-5 ">
                      <h3 class="text-center mb-3  ">Your Information   </h3>
                      <div class="col-7 col-sm-12 mt-2">
                        <label for="fullNameEdit" class="form-label "><h5 class="text-center">Full Name </h5></label>
                        <input type="text" class="form-control" id="fullNameEdit" name="fullname" placeholder="Enter the amount of money "  value="<%=userName%>">
                      </div>
                      <div class="col-7 col-sm-12 mt-2">
                        <label for="emailAddress" class="form-label "><h5 class="text-center">Email Address </h5></label>
                        <input type="email" class="form-control" id="emailAddress" name="emailAddressEdit" value="<%=userEmail%>"  placeholder="Don't Enter Account unless you use Transfer" >
                      </div>
                      <div class="col-7 col-sm-12 mt-2">
                        <label for="accontNumberEdit" class="form-label "><h5 class="text-center">Account Number</h5></label>
                          <input type="number" class="form-control" name="accontNumberEdit" id="accontNumberEdit" placeholder="Don't Enter Account unless you use Transfer" value="<%=accontNumber%>" disabled>
                      </div>
                          <div class="col-7 col-sm-12 mt-2">
                        <label for="accontPassword" class="form-label "><h5 class="text-center">Account Password</h5></label>
                          <input type="number" class="form-control" name="accontPassword" id="accontPassword" value="<%=userPassword%>"  placeholder="Don't Enter Account unless you use Transfer" value="<%=accontNumber%>" >
                      </div>
                      <div class="col-6  mt-2 ">
                        <button type="submit" class="btn btn-primary btn-lg">Save change</button>
                      </div>
                    </div>
                    </form>
                </div>
              </div>

              <div class="col d-flex">
                <a class="nav-link" href="logOut.jsp"
                  >
           <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg></a>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </header>
    <main class="m-5">
      <div class="row p-5 m-5 shadow ">
        <div class="col-lg-5 col-sm-12  p-2 shadow  ">
          <div class="align-items-centet text-center">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="80"
            height="80"
            fill="#6b09eb"
            class="bi bi-cash-coin"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"
            />
            <path
              d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"
            />
            <path
              d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"
            />
            <path
              d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"
            />
          </svg>
          <h3 class=" ">EthioBank Is Your Bank </h3>
          </div>
         
            <div class="justify-content-start ">
              <ul class="align-content-end">
                <li class="">The people’s bank.</li>
                <li class="">Your kind of people… your kind of bank.</li>
                <li class="">Worth Our Weight In Gold.</li>
                <li class="">Working Hard For Your Money.</li>
                <li class="">A Company You Can Bank On.</li>
                <li class="">Working for a better tomorrow.</li>
                <li class="">Smart way to Bank.</li>
              </ul>
            </div>
        </div>
        
    
        <div class="col-lg-5 col-sm-12 mx-2 pt-5 shadow">
           <h2 class="text-center">You Information</h2>
          <label for="b"><h3 class="text-center">Owner Name:</h3></label>
          <input type="text" name="balance" id="b" disabled value="<%=userName%>">
          <label for="b0"><h3 class="text-center">Your Account: </h3></label>
          <input type="text" name="balance" id="b0" disabled value="<%=accontNumber%>">
          <label for="b1"><h3 class="text-center">Your Balance : </h3></label>
            <input type="text" name="balance" id="b1" disabled value="<%=balanceStored%>">
        </div>
      </div>
      <!--form to accept the user input for transactions-->
      <form action="/EthioBankWebApplication/bankTransactionHandler" class="form-control" method="post"> 
      <div class="row justify-content-center bg-opacity-100 bg-transparent  shadow m-5 ">
        <h1 class="text-center mb-3 mt-5 ">Your Tasks Are Below  </h1>
        <div class="col-7  mt-3">
          <label for="amountOfMoney" class="form-label "><h3 class="text-center">Enter The Amount</h3></label>
          <input type="number" class="form-control" id="amountOfMoney" name="amountOfMoney" placeholder="Enter the amount of money ">
        </div>
        <div class="col-7  mt-3">
          <label for="accontNumber" class="form-label "><h3 class="text-center">Enter The Account </h3></label>
          <input type="number" class="form-control" id="accontNumber" name="reciverAccount" placeholder="Don't Enter Account unless you use Transfer">
        </div>
        <div class="col-7  mt-3">
          <label for="type" class="form-label "><h3 class="text-center">Select The Type of Transaction </h3></label>
          <select class="form-control" id="type" aria-label="Default select example" name="tType">
            <option selected>Enter the Transaction </option>
             <option value="Deposit">Deposit</option>
             <option value="Withdrawal">Withdrawal</option>
            <option value="Transfare">Transfer</option>
            </select>
        </div>
        <div class="col-6  m-3 ">
          <button type="submit" class="btn btn-primary btn-lg">Execute Transaction</button>
        </div>
      </div>
      </form>
      <!-- for comparative of money check of the bank -->
      <div class="row justify-content-center align-items-center  m-5 shadow">
        <div class="col-4 p-5">
          <div class="card " style="width: 100%; height: 100%;">
            <div class="card-body">
              <p class="card-title">CURRENT MONTHLY BILL</p>
              <h4 class="card-text">$20.00</h4>
            </div>
            <div class="card-footer">
              <a href="#" class="text-decoration-none" >switch to monthly income -> </a>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card " style="width: 100%; height: 100%;">
            <div class="card-body">
              <p class="card-title">NEXT PAYMENT </p>
              <h4 class="card-text">July 20</h4>
            </div>
            <div class="card-footer">
              <a href="#" class="text-decoration-none " >view payment history -> </a>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card text-white "style="background-color:#6b09eb; width: 100% height: 100%;">
            <div class="card-body " > 
              <p class="card-title">CURRENT PLAN </p>
              <h4 class="card-text">Freelancer</h4>
            </div>
            <div class="card-footer">
              <a href="#" class="text-decoration-none text-white" > Up grade plan  -> </a>
            </div>
          </div>
        </div>
      </div>
      <!-- this is for payment methods by using card layout -->
      <div class="row justify-content-center align-items-center m-5 shadow" >
        <h5>PAYMENT METHODS</h5>
        <div class="col-6 ">
          <div class="card border-primary">
            <img class="card-img-top" src="Asset File/msc.PNG" alt="Title" />
            <div class="card-body">
              <a href="#" class="card-links text-decoration-none mb-5">Edit</a>
              <a href="#" class="card-links text-decoration-none mb-5"
                >Remove</a
              >
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card border-primary">
            <img class="card-img-top" src="Asset File/vsa.PNG" alt="Title" />
            <div class="card-body">
              <a href="#" class="card-links text-decoration-none mb-5">Edit</a>
              <a href="#" class="card-links text-decoration-none mb-5"
                >Remove</a
              >
            </div>
          </div>
        </div>

        <div class="col-6">
          <div class="card border-primary">
            <img class="card-img-top" src="Asset File/america.PNG" alt="Title" />
            <div class="card-body">
              <a href="#" class="card-links text-decoration-none mb-5">Edit</a>
              <a href="#" class="card-links text-decoration-none mb-5"
                >Remove</a
              >
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card border-primary">
            <div class="card-body">
            <img class="card-img-top" src="Asset File/banklog.PNG" alt="Title"   width="80" height="100"/>
              
            </div>
          </div>
        </div>
      </div>
      <!-- this is for tabular data displaying  for transation history -->
  
  
  
  
   
  
  
      
      <div class="row justify-content-center align-items-center m-5 shadow">
      <div class="table-responsive">
       <h5> <caption class="justify-content-center">
          PAYMENT HISTORY
        </caption></h5>
        <table class="table table-striped table-hover">
          <thead class="table-dark">
            <tr>
              <th>Transaction ID</th>
              <th>Date</th>
              <th>Account</th>
              <th>Amount</th>
              <th>Transaction Type</th>
            </tr>
          </thead>
          <tbody class="table-group-divider">
          <%List<Transaction> dataHistory = (List<Transaction>)session.getAttribute("his");
    		  int number=0;
    		  for(Transaction tran:dataHistory){
    			  
    			  number+=1;
             %>
            <tr>
              <td scope="row">#0<%=number %></td>
              <td><%=tran.getDate() %></td>
              <td><%=tran.getAccount() %></td>
              <td><%=tran.getAmount()%></td>
              <td><%=tran.gettType() %></td>
           
            </tr>
            <% } %>
          </tbody>
          <tfoot></tfoot>
        </table>
      </div>
    </div>
    </main>

    <footer class="p-4">
        <hr/>
      <div
        class="d-flex flex-column flex-sm-row align-items-center justify-content-between small"
      >

        <div class="me-sm-3 mb-2 mb-sm-0">
          <div class="fw-500 text-dark">Copyright © Your Website 2023</div>
        </div>
        <div class="ms-sm-3">
          <a class="fw-500 text-decoration-none text-dark" href="#">Privacy</a>
          <a class="fw-500 text-decoration-none mx-4 text-dark" href="#">Terms</a>
          <a class="fw-500 text-decoration-none text-dark" href="#">Helps</a>
        </div>
      </div>
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
      integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
      integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
