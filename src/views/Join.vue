<template>
  <div class="login-container">
    <div class="tab-content">
      <div class="login-child-container">
        <h1 class="login-title">Sign Up For Table Tool</h1>
        <div class="login-input-field">
          <label class="login-label">
            Email<span class="required-star">*</span>
          </label>
          <input type="text" id="email" maxlength="88" autocomplete="off" class="login-input">
        </div>
        <div class="login-input-field">
          <label class="login-label">
            Username<span class="required-star">*</span>
          </label>
          <input type="text" id="text" maxlength="88" autocomplete="off" class="login-input">
        </div>
        <div class="login-input-field">
          <label class="login-label">
            Password<span class="required-star">*</span>
          </label>
          <input type="password" id="password" maxlength="100000" autocomplete="off" class="login-input">
        </div>
        <div class="login-input-field">
          <label class="login-label">
            Confirm Password<span class="required-star">*</span>
          </label>
          <input type="password" id="confrim-password" maxlength="100000" autocomplete="off" class="login-input">
        </div>
        <p><a class="login-link" href="/login.html"><b>Already a member?</b></a></p>
        <button id="loginbtn" class="login-button">SIGN UP NOW</button>
        <span id="status"></span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "join",
  components: {}
};
</script>
