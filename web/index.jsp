<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    label{
        color: #414141;
        font-family: Arial, sans-serif;
    }
    h1 {
        font-size: 36px;
        line-height: 44px;
        letter-spacing: 1px;
        font-weight: normal;
        font-family: "sofiapro-light",Tahoma,sans-serif;
        color: #4a494b;;
    }
    h3{
        margin-bottom: 0px;
        font-family: Garamond,serif;
        letter-spacing: 2px;
        font-weight: normal;
        color: #414141;
        text-rendering: optimizelegibility;
    }
    .controls{
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 6px;
        padding-right: 6px;
        width: 192px;
        height: 35px;
    }
    .inputpos{
        width: 459px;
        height: 65px;
    }
    #login:focus{
        border: 1px solid #13af5d;
        box-shadow: 0 0px 5px #31be71;
        border-radius: 3px;

    }
    #password:focus{
        border: 1px solid #13af5d;
        box-shadow: 0 0 5px #31be71;
        border-radius: 3px;

    }

    .upperbox{
        height: 50px;
        background-color:#f9faf7;
        padding-top: 5px;
        border-bottom: 1px solid rgb(204, 204, 204);
    }
    .upperboxfill{
        width: 1000px;
        padding: 10px 30px;
        margin-right: auto;
        margin-left: auto;
    }
    .upperboxlogo{
        color: #4a494b;
        font-family: Garamond,serif;
        float: left;
        font-size: 12px;
        position: relative;
        top: 4px;
        left: 20px;
    }
    .upperboxadd{
        text-align: right;
        float:left
    }
    .accounts{
        color: #4a494b;
        font-family: Garamond,serif;
        font-size: 12px;
        position: relative;
        top: 1px;
    }
    .lowerbox{
        position:relative;
        background-color:#f9faf7;
        height:100%
    }
    .container{
        width: 1000px;
        padding: 10px 30px;
        margin-right: auto;
        margin-left: auto;
    }
    .mainbox{
        margin-top: 15px;
        -moz-box-sizing: border-box;
        box-shadow: 0px 1px 2px 1px rgba(0, 0, 0, 0.25);
        background-color: rgb(255, 255, 255);
        border-radius: 1px;
        padding: 30px 30px 48px;
        margin-left: -3.19149%;
        width: 106.383%;
        height: 70%;
    }
    .mainboxleft{
        float: left;
        min-height: 1px;
        margin-left: 20px;
        border-right: 1px solid rgb(217, 217, 217);
        padding-top:20px;
    }
    .mainboxright{
        float: left;
        min-height: 1px;
        width: 380px;
        padding: 20px;
    }
    .row{

    }
    .row1{
        border-bottom: 1px solid rgb(204, 204, 204);
    }
    .singin{
        float: left;
        min-height: 1px;
        margin-left: 20px;
        padding: 7px 0px;
        border-bottom: 1px solid rgb(217, 217, 217);
        margin-bottom: 0px;
    }
    .submit{
        background-color: #16612e;
        width: 100px;
        height: 30px;
        border: none;
        color: #fefffc;
    }
    .no-account-yet {
        padding-left: 20px;
    }
    .singup{
        font-family: Garamond,serif;
        font-weight: normal;
        color: #414141;
    }
    a{
        cursor: pointer;
        text-decoration: none;
    }
    .logo{
        color: #4a494b;
        font-family: Garamond,serif;
    }
    .invalid{
        color: #e0695e;
        border: none;
    }
</style>

<html>
  <head>
    <title></title>
  </head>
  <body>
  <div class="upperbox">
      <div class="upperboxfill">
          <div class="upperboxlogo">
              <a class="logo" href="/signin">Logotype</a>
          </div>
          <div class="upperboxadd">
          <span style="margin:0px 10px 0px 37px;color:#717171;"> |  </span>
            <span class="accounts">
                Accounts
            </span>
          </div>
      </div>
  </div>


  <div class="lowerbox">
      <div class="container">
          <div class="mainbox">
              <div class="row1" >
                  <div class="signin">
                        <h1>Sign In</h1>
                  </div>
              </div>
              <div class="mainboxleft">
                  <form action="${pageContext.request.contextPath}/MongoSignup" method="post">
                      <div class="inputpos">
                          <label for="email">Login</label>
                          <br>
                          <input class="controls" placeholder="Login or E-mail" name="email" title="Enter your login or email" id="email">
                      </div>

                      <div class="inputpos">
                          <label for="password">Password</label>
                          <br>
                          <input class="controls" name="password" type="password" placeholder="Password" title="Enter your password" id="password">
                      </div>




                          <c:if test="${sessionScope.invalid =="ololo"}">

                          </c:if>
                      <div>
                          <% if(request.getSession().getAttribute("invalid") == null)
                                request.getSession().setAttribute("invalid", ""); %>

                            <label class="invalid" name ="invalid"><%=request.getSession().getAttribute("invalid")%></label>
                         <%--<input class="invalid" name="invalid" type="text" value="" readonly>--%>
                            <%--<label class="invalid" name ="invalid" hidden=<%=request.g<%=request.getSession().getAttribute("invalid")%>etSession().getAttribute("invalid")%> >fdhdhdhdhdhdhhhhhhhhhhhhhhhhhh</label>--%>
                         <%--<input class="invalid" name="invalid" type="text" value="" readonly>--%>


                      </div>
                      <br>
                      <input class="submit" type="submit" name="submit" value="Login" />
                  </form>
              </div>
              <div class="mainboxright">
                  <div class="no-account-yet">
                      <h3>
                          No Account Yet?
                      </h3>
                      <p class="singup">
                          <a href="signup.jsp">Sign Up</a> today!
                      </p>
                  </div>
              </div>
          </div>
      </div>

  </div>
  <div class="container">
  </div>
    </body>
</html>