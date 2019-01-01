part of application;

class LoginSignUpPage {
  DivElement shell = document.querySelector('#shell');
  DivElement content = DivElement()..id = 'content';

  LoginSignUpPage() {
    _init();
  }

  void _init() {
    String markup = '''
    <div>You made it here</div>
    ''';
    content.setInnerHtml(markup, treeSanitizer: NullTreeSanitizer());
    shell.append(content);
  }
}