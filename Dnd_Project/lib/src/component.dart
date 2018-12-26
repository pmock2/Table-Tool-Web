library component;

import 'dart:html';
import 'dart:async';

part 'component/header.dart';
part 'component/dialog.dart';

class NullTreeSanitizer implements NodeTreeSanitizer {
  @override
  void sanitizeTree(Node node) {}
}

num highestZIndex = 0;

num getHighestZIndex() {
  List<Element> elements = document.querySelectorAll('*');

  elements.forEach((element) {
    String zIndex = element.getComputedStyle().zIndex.toString();
    if (zIndex != null && zIndex is String && zIndex != 'auto') {
      num zIndexVal = num.parse(zIndex);
      if (zIndexVal > highestZIndex) {
        highestZIndex = zIndexVal;
      }
    }
  });

  return highestZIndex;
}