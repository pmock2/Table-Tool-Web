library application;

import 'dart:html';

import 'package:Dnd_Project/src/component.dart';

part 'pages/home.dart';

class Application {
  Header header;
  DivElement shell = DivElement();
  bool goToHome = false;

  Application([this.goToHome]) {
    init();
  }

  void alertTest() {
    window.alert('Made it here');
  }


  void init() {
    document.querySelector('#loader-roller').remove();
    shell = document.querySelector('#shell');

    Map configuration = {
      'Home' : '/index.html'
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
    if (goToHome) {
      HomePage();
    }
  }
}