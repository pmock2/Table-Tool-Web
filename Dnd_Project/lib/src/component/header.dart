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
    _createDomTrees();
    _wireDropsDowns();
  }


  void _createDomTrees() {
    configuration.forEach((k, v) {
      DivElement headerOption = DivElement()
        ..classes.add('header_option')
        ..text = k;
      element.append(headerOption);

      _addHeaderSubOptions(headerOption, v);
    });
  }

  //recursively loops through a given map and creates a UL/LI Tree from it. Appends the tree to the given header Element.
  void _addHeaderSubOptions(Element headerOption, options) {
    UListElement list = UListElement()
      ..classes.add('dropdown_list');

    void buildOptionsTree(var items, [Element parentLI]) {
      UListElement newParent = UListElement()
        ..classes.add('submenu')
        ..dataset['submenu_is_open'] = 'false';

      if (items is Map) {
        items.forEach((k, v) {
          LIElement item = LIElement()
            ..id = 'header_option_${k.toString().toLowerCase().replaceAll(' ', '_')}'
            ..classes.add('menu_option');

          //menu has children
          if (v is List || v is Map) {
            item.dataset['has_children'] = 'true';
            DivElement optionTitle = DivElement()
              ..setInnerHtml(k, treeSanitizer: NullTreeSanitizer())
              ..classes.add('option_title');

            DivElement rightArrow = DivElement()
              ..classes.addAll(['fas', 'fa-caret-right', 'submenu_right_caret']);
            item.append(optionTitle);
            optionTitle.append(rightArrow);

            //loop through the children
            buildOptionsTree(v, item);
          }
          else if (v is Function) {
            item.setInnerHtml(k, treeSanitizer: NullTreeSanitizer());
            item.onClick.listen((_) => v());
          }
          else if (v == '') {
            item.text = k;

            //add generic dialog
            item.onClick.listen((e) {
              element.querySelector('.header_option[data-is_open=true').dataset['is_open'] = 'false';

              String message = '''
              <div>You just clicked the <b>[${k}]</b> option.</div>
              ''';
              DialogWindow('$k Menu Opened', message, 'header_option_clicked', level: Level.GOOD, type: DialogType.OK);
            });
          }
          else {
            print("Encountered a problem when building header option tree. K : $k V : $v");
          }

          if (parentLI != null) {
            newParent.append(item);
            parentLI.append(newParent);
          }
          else {
            list.append(item);
          }
        });
      }
      else if (items is List) {
        items.forEach((listItem) {
          LIElement item = LIElement()
            ..text = listItem
            ..id = 'header_option_${listItem.toString().toLowerCase().replaceAll(' ', '_')}'
            ..classes.add('menu_option');
          newParent.append(item);
          if (parentLI != null) {
            parentLI.append(newParent);
          }
          else {
            print('Tried to create LIs from List with no parent element');
          }
        });
      }
      else if (items is Function) {
        headerOption.dataset['hasFunction'] = 'true';
        headerOption.onClick.listen((e) {
          items();
          e.stopPropagation();
        });
      }
      else if (items is String) {
        Element link = Element.tag('a')
        ..classes.add('header-link')
        ..attributes['href'] = items;
        headerOption.append(link);
      }
      else {
        print('Something bad happened');
      }
    }

    buildOptionsTree(options);
    headerOption.append(list);
  }

  void _wireDropsDowns() {
    element.querySelectorAll('.header_option').forEach((option) {
      option.dataset['is_open'] = 'false';

      //wire up the header to open the drop down
      option.onClick.listen((e) {
        Element target = (e.target as Element);
        if (target.classes.contains('header_option') && target.dataset['hasFunction'] != 'true') {
          element.querySelectorAll('.header_option').forEach((item) {
            if (item.text != option.text && item.dataset['is_open'] == 'true') {
              item.dataset['is_open'] = 'false';
            }
          });

          if (target.dataset['is_open'] == 'false') {
            target.dataset['is_open'] = 'true';
          }
          else {
            target.dataset['is_open'] = 'false';
          }
        }
      });
    });
  }

  void close() {
    element.querySelectorAll('[data-is_open=true]').forEach((element) {
      element.dataset['is_open'] = 'false';
    });
  }
}