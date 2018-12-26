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
    shell = document.querySelector('#shell');

    Map configuration = {
      'Home' : '/index.html'
    };
    header = Header(configuration, 'Table Tool');
    shell.append(header.element);
    if (goToHome) {
      HomePage();
    }
  }
}