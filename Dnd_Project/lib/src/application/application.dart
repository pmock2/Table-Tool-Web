library application;

import 'dart:html';
import 'dart:async';

import 'package:Dnd_Project/src/component.dart';

part 'pages/home.dart';
part 'pages/login.dart';
part 'pages/signup.dart';

class Application {
  Header header;
  DivElement shell = DivElement();
  String _page;

  Application(this._page) {
    init();
  }

  void alertTest() {
    window.alert('Made it here');
  }


  void init() {
    Element loader = document.querySelector('#loader-roller');
    if (loader != null) {
      loader.remove();
    }
    shell = document.querySelector('#shell');

    Map configuration = {
      'Home' : '/index.html',
      'Log in' : '/login.html'
    };
    header = Header(configuration, 'Table Tool');

    String userMarkup = '''
      <div class="fas fa-user user-icon"></div>
      <div class="user-name">Example User</div>
    ''';
    DivElement userContainer = DivElement()
      ..classes.add('user-container')
      ..setInnerHtml(userMarkup, treeSanitizer: NullTreeSanitizer());
    header.element.append(userContainer);
    shell.append(header.element);

    switch (_page) {
      case 'home' :
        HomePage();
        break;
      case 'login':
        LoginPage();
        break;
      case 'signup' :
        SignUpPage();
        break;
    }
  }
}