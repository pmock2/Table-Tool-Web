part of component;

class Header {
  DivElement element = DivElement();
  Map configuration = Map();
  String headerTitle;
  Header(this.configuration, this.headerTitle) {
    init();
  }

  void init() {
    element.classes.add('header-container');
    DivElement title = DivElement()
      ..text = headerTitle
      ..classes.addAll(['header-section', 'header-title']);

    element.append(title);
    _buildHeader();
  }


  /*
    'title' : function,
    'title' : {
      'sub-title' : function,
      'sub-title' : function,
      'sub-title' : {
        'sub-sub-title' : function
      },
    },
   */
  void _buildHeader({Element parentElement, Map config}) {
    configuration.forEach((k, v) {
      if (k is String) {
        DivElement headerSection = DivElement()
          ..innerHtml = '''<span>${k}</span>''';
        if (config == null) {
          config = configuration;
          headerSection.classes.add('header-section');
        }
        else {
          headerSection.classes.add('header-sub-section');
        }
        if (v is Function) {
          headerSection.onClick.listen((e) {
            v();
          });
        }
        else if (v is Map) {
          _buildHeader(config: v, parentElement: headerSection);
        }

        if (parentElement != null) {
          parentElement.append(headerSection);
        }
        else {
          element.append(headerSection);
        }
      }
    });
  }
}