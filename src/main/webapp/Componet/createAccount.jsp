<%@page import="javax.print.attribute.standard.RequestingUserName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title> EthioBank Create New Account</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
      integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
      integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
      crossorigin="anonymous"
    ></script>
  </head>
  <body style="background-color: gery ">
    <main>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xxl-7 col-xl-10">
            <div
              class="card card-raised-shadow-10 mt-5 mb-5 mt-xl-10"
              style="
                background-color: rgb(255, 254, 254);
                border-color: rgb(19, 19, 224);
              " >
              <!--to have 10 paragraph size-->
              <div class="card-body p-10">
                <div class="text-center">
                    <p>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="80"
                      height="70"
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
                  </p>
              
                   <h1 class="display-5">Ethio Bank</h1>
                  <h6 class="subhading-1 mb=5">Fill The Following Form To Have Account </h6>
                </div>
                <!--This is for  input form-->
                <form action="/EthioBankWebApplication/createAccountHandler"  method= "post" novalidate>
                  <div class="row mt-5">
                    <div class="col-sm-6 mb-4 ">
                      <div class="form-floating">
                        <input
                          type="text"
                          class="form-control"
                          autocomplete="off"
                          id="firstName"
                          placeholder="First Name"
                          name="fristName"
                          required
                        />
                        <label for="firstName">First Name</label>
                        <div class="invalid-feedback">First Name Is Required </div>
                      </div>
                    </div>
                    <div class="col-sm-6 mb-4 ">
                      <div class="form-floating">
                        <input
                          type="text"
                          class="form-control"
                          autocomplete="off"
                          id="lastName"
                          name="lastName"
                          placeholder="Last Name"
                          required
                        />
                        <label for="lastName">Last Name </label>
                        <div class="invalid-feedback">Last Name Is Required </div>
                      </div>
                    </div>
                  </div>
                  <!--This is the  email row -->
                    <div class="row ">
                    <div class="col-sm-6 mb-4 ">
                      <div class="form-floating">
                        <input
                          type="number"
                          class="form-control"
                          autocomplete="off"
                          id="accountNumber"
                          name="accountNumber"
                          placeholder="accountNumber"
                          required
                        />
                        <label for="firstName">Account Number</label>
                        <div class="invalid-feedback">Account Number Is Required </div>
                      </div>
                    </div>
                    <div class="col-sm-6 mb-4 ">
                      <div class="form-floating">
                        <input
                         type="email"
                          class="form-control"
                          autocomplete="off"
                          id="idEmail"
                          placeholder="Email"
                          name="email"
                          required
                        />
                        <label for="lastName">Email Address</label>
                        <div class="invalid-feedback">Email Address Is Required </div>
                      </div>
                    </div>
                  </div>                  
                  <!--This is the password row -->
                  <div class="row">
                    <div class="col-sm-6 mb-4">
                      <div class="form-floating">
                        <input
                          type="password"
                          class="form-control"
                          autocomplete="off"
                          id="idPassword"
                          placeholder="Password"
                          required
                          name="password"
                        />
                        <label for="idPassword">Password</label>
                        <div class="invalid-feedback">Password Is Required </div>
                      </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                      <div class="form-floating">
                        <input
                          type="password"
                          class="form-control"
                          autocomplete="off"
                          id="verifyPassword"
                          name="cPassword"
                          placeholder="Password"
                         required
                        />
                        <label for="verifyPassword">Verify Password</label>
                        <div class="invalid-feedback">Verify Password Is Required </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-check mb-5">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      placeholder="un"
                      value="agreed"
                      name="agreement"
                      id="agreement"
                      required
                    />
                    <label class="form-check-label" for="agreement">
                      I agree to the Bank terms and conditions
                    </label>
                    <div class="invalid-feedback">You must agree the Ethio Bank  agreement  </div>
                  </div>
                  <div
                    class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"
                  >
                    <a href="../index.jsp" class="text-decoration-none"
                      >Sign In Instead</a
                    >
                    <button type="submit" class="btn btn-primary">
                      CREATE ACCOUNT
                    </button>
                  </div>
                </form>
                
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </main>
    <footer class="p-4 ">
    <hr/>
      <!-- place footer here -->
      <div
        class="d-flex flex-column flex-sm-row align-items-center justify-content-between small"
      >
        <div class="me-sm-3 mb-2 mb-sm-0">
          <div class="fw-500 text-dark">Copyright ©  Ehtio Bank  2023</div>
        </div>
        <div class="ms-sm-3">
          <a class="fw-500 text-decoration-none text-dark" href="#">Privacy</a>
          <a class="fw-500 text-decoration-none mx-4 text-dark" href="#"
            >Terms</a
          >
          <a class="fw-500 text-decoration-none text-dark" href="#">Helps</a>
        </div>
      </div>
    </footer>
    <script src="FrontFile/formValidation.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"
    ></script>
</body>
</html>