library application;

import 'dart:html';

import 'package:Dnd_Project/src/component.dart';

class Application {
  Header header;
  DivElement shell = DivElement();

  Application() {
    init();
  }

  void alertTest() {
    window.alert('Made it here');
  }


  void init() {
    shell = document.querySelector('#shell');

    Map configuration = {
      'Home' : alertTest
    };
    header = Header(configuration, 'Table Tool');
    shell.append(header.element);

  }
}