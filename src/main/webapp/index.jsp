<%@page import="javax.print.attribute.standard.RequestingUserName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>login to your account for more </title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
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

  <body style="background-color: rgb(226, 223, 231)">
    <header>
      <!-- place navbar here -->
    </header>
    <main>
    <!--  -->
 
    <!--  -->
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xxl-5 col-xl-6 mb-5">
            <div
              class="card card-raised-shadow-10 mt-5 mb-4 mt-xl-10"
              style="
                background-color: rgb(255, 254, 254);
                border-color: rgb(19, 19, 224);
              "
            >
              <!--to have 5 paragraph size-->
              <div class="card-body p-5">
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
                  <h1 class="display-3">Ethio Bank</h1>
                  <h6 class="subhading-1 mb=5">LogIn</h6>
                </div>
                <!--for input form-->
                <form action="/EthioBankWebApplication/loginAccountHandler" method="post"  novalidate>
                  <div class="form-floating mb-3 mt-5">         
                    <input
                      type="number"
                      class="form-control"
                      autocomplete="off"
                      id="accountNumberOne"
                      placeholder=""
                      name="accountNumber"
                      required
                    />
                    <label for="accountNumberOne">Account Number</label>
                    <div class="invalid-feedback">
                      Account Number Is Required
                    </div>
                  </div>
                  <div class="form-floating">
                    <input
                      type="password"
                      class="form-control"
                      autocomplete="off"
                      id="fPassword"
                      placeholder="Password"
                      name="password"
                      required
                    />
                    <label for="fPassword">Password</label>
                    <div class="invalid-feedback">Password Is Required</div>
                  </div>
                  <div class="form-check mb-5 mt-5">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      placeholder="un"
                      value="agreed"
                      name="agreement"
                      id="checkInput"
                    />
                    <label class="form-check-label" for="checkInput">
                      Remember password
                    </label>
                  </div>
                  <div
                    class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"
                  >
                    <a href="login.html" class="text-decoration-none"
                      >Forgot Password?</a
                    >
                    <a href="Syatem_service.html">
                      <button type="submit" class="btn btn-primary">
                        LOGIN
                      </button>
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="text-center">
          <a href="Componet/createAccount.jsp" class="text-decoration-none text-dark"
            >Need an account? Sign up!</a
          >
        </div>
      </div>
    </main>
      <!-- place footer here -->
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
          <a class="fw-500 text-decoration-none mx-4 text-dark" href="#"
            >Terms</a
          >
          <a class="fw-500 text-decoration-none text-dark" href="#">Helps</a>
        </div>
      </div>
    </footer>
    <script src="Componet/FrontFile/formValidation.js"></script>
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
