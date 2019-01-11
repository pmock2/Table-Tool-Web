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
        <p><v-btn class="login-link" to="/sign-in"><b>Already a member?</b></v-btn></p>
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
<style>
  .login-container {
    background: rgba(0,0,0,0.8);
    border-radius: 2px;
    box-shadow: 0 0 0 5px rgba(0,0,0,0.8);
    padding: 40px;
    max-width: 600px;
    display: flex;
    height: 100%;
    position: fixed;
    justify-content: center;
    width: 100%;
    left: 50%;
    transform: translateX(-50%);
  }

  .tab-content {
    min-height: 420px;
    padding: 50px 0;
  }

  .login-child-container {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    width: 75%;
  }

  .login-title {
    text-align: center;
    color: #ffffff;
    font-weight: 300;
    margin: 0 0 40px;
    font-size: 32px;
    box-sizing: border-box;
  }

  .login-input-field {
    position: relative;
    margin-bottom: 40px;
  }

  .login-label {
    position: absolute;
    transform: translateY(6px);
    left: 3px;
    color: rgba(255, 255, 255, 0.5);
    transition: all 0.25s ease;
    pointer-events: none;
    font-size: 22px;
    top: 6px;
  }

  .required-star {
    margin: 2px;
    color: #0566ad;
  }

  .login-input {
    font-size: 22px;
    display: block;
    width: 100%;
    height: 100%;
    padding: 10px;
    background: none;
    border: 1px solid #a0b3b0;
    color: #ffffff;
    border-radius: 0;
    transition: border-color .25s ease, box-shadow .25s ease;
    margin-left: -10px;
  }

  .forgot {
    margin-top: -30px;
    text-align: right;
  }

  .login-button {
    width: 100%;
    border: 0;
    outline: auto;
    outline-color: #0566ad;
    border-radius: 0;
    padding: 15px 0;
    font-size: 2rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: .1em;
    background: black;
    color: #ffffff;
    -webkit-transition: all 0.5s ease;
    transition: all 0.5s ease;
    -webkit-appearance: none;
    cursor: pointer;
  }

  .login-button:hover {
    background: #005BB3;
  }

  .login-link {
    color: #179b77 !important;
    border: 0;
    outline: 0;
    text-decoration: none;
    font-weight: bold;
    background: unset !important;
    -webkit-box-shadow: unset !important;
    box-shadow: unset !important;
  }
</style>