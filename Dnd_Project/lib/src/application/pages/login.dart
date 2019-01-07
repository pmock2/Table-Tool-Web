part of application;

class LoginPage {
  DivElement shell = document.querySelector('#shell');
  DivElement content = DivElement()..id = 'content';

  LoginPage() {
    _init();
  }

  void _init() {
    String markup = '''
      <div class="login-container">
        <div class="tab-content">
          <div class="login-child-container">
            <h1 class="login-title">Welcome Back!</h1>
            <div class="login-input-field">
              <label class="login-label">
                  Email<span class="required-star">*</span>
              </label>
              <input type="text" id="email" maxlength="88" autocomplete="off" class="login-input">
            </div>
            <div class="login-input-field">
              <label class="login-label">
                  Password<span class="required-star">*</span>
              </label>
              <input type="password" id="password" maxlength="100000" autocomplete="off" class="login-input">
            </div>
            <p class="forgot"><a class="login-link" href="forgot_pass.php">Forgot Password?</a></p>
            <p><a class="login-link" href="/signup.html"><b>Not a member?</b></a></p>
            <button id="loginbtn" class="login-button">Log In</button>
            <span id="status"></span>
          </div>
        </div>
      </div>
    ''';
    content.setInnerHtml(markup, treeSanitizer: NullTreeSanitizer());
    shell.append(content);
  }
}