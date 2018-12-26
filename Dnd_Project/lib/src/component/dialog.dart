part of component;

enum DialogType {OK_CANCEL, OK, RESTART, YES_NO}
enum Level {INFORMATION, WARNING, ERROR, GOOD}

class DialogWindow {
  //when the affirmative button is clicked
  StreamController _onAffirmativeController = StreamController.broadcast();
  Stream get onAffirmativeClicked => _onAffirmativeController.stream;

  //when the cancel/no/close button is clicked
  StreamController _onNegativeController = StreamController.broadcast();
  Stream get onNegativeClicked => _onNegativeController.stream;

  //message displayed on the dialog
  String _innerHtml;

  //enum for the level of the message - Good, Warning, Error, Information
  Level _level;

  //id of the dialog - can be used for custom logic
  String _id;

  //title of the dialog
  String _title;

  //dialog element
  DivElement element;

  //background blocker made when the dialog is created
  DivElement _backgroundBlocker;

  //enum for the dialog type - OK_CANCEL, OK, RESTART, YES_NO
  DialogType _type;

  //list for the listeners in the dialog
  List<StreamSubscription> listeners = List();

  //button for the user to proceed with the affirmative action
  Element _affirmativeButton;

  //button for the user to proceed with the negative action
  Element _negativeButton;

  bool _blockBackground;

  DialogWindow(this._title, this._innerHtml, this._id, {DialogType type = DialogType.OK, Level level = Level.WARNING, bool blockBackground = true}) {
    if (_title == null || _innerHtml == null || _id == null) {
      print(
          'Dialog Box Recieved a null value. title : $_title message : $_innerHtml id : $_id');
      return;
    }
    _type = type;
    _level = level;
    _blockBackground = blockBackground;

    init();
    _wireItUp();
  }

  void init() {
    String dialogMarkup = '''
    <div class="dialog_side_container fas"></div>
    <div class="dialog_inner_container">
      <div class="dialog_title">${_title}</div>
      <i class="fas fa-times dialog_close" id="${_id}_dialog_close"></i>
      <hr class="dialog_hr" />
      <div class="dialog_message">
        ${_innerHtml}
      </div>
      <div class="dialog_button_container">
      <button class="dialog_button affirmative" id="${_id}_dialog_affirmative"></button>
      <button class="dialog_button negative" id="${_id}_dialog_negative"></button>
      </div>
    </div>
    ''';

    element = DivElement()
      ..setInnerHtml(dialogMarkup, treeSanitizer: NullTreeSanitizer())
      ..classes.add('dialog_window')
      ..id = _id;

    _affirmativeButton = element.querySelector('#${_id}_dialog_affirmative');
    _negativeButton = element.querySelector('#${_id}_dialog_negative');

    switch (_type) {
      case DialogType.OK:
        _affirmativeButton.text = 'Ok';
        _affirmativeButton.dataset['text'] = 'ok';
        _negativeButton.style.display = 'none';
        break;
      case DialogType.OK_CANCEL:
        _affirmativeButton.text = 'Ok';
        _affirmativeButton.dataset['text'] = 'ok';
        _negativeButton.text = 'Cancel';
        break;
      case DialogType.RESTART:
        _affirmativeButton.text = 'Restart';
        _affirmativeButton.dataset['text'] = 'restart';
        _negativeButton.text = 'Cancel';
        break;
      case DialogType.YES_NO:
        _affirmativeButton.text = 'Yes';
        _affirmativeButton.dataset['text'] = 'yes';
        _negativeButton.text = 'No';
        break;
    }

    DivElement sideBar = element.querySelector('.dialog_side_container');
    switch (_level) {
      case Level.INFORMATION:
        sideBar.dataset['info'] = 'true';
        break;
      case Level.ERROR:
        sideBar.dataset['error'] = 'true';
        break;
      case Level.WARNING:
        sideBar.dataset['warning'] = 'true';
        break;
      case Level.GOOD:
        sideBar.dataset['good'] = 'true';
        break;
    }
  }

  void _wireItUp() {
    //X button clicked
    listeners.add(
        element.querySelector('#${_id}_dialog_close').onClick.listen((e) {
          _onNegativeController.add(true);
          close();
        })
    );

    //cancel/no button clicked
    listeners.add(
        element.querySelector('#${_id}_dialog_negative').onClick.listen((e) {
          _onNegativeController.add(true);
          close();
        })
    );

    //affirmative button clicked
    listeners.add(
        element.querySelector('#${_id}_dialog_affirmative').onClick.listen((e) {
          _onAffirmativeController.add(true);
        })
    );

    //listen for enter and escape key
    listeners.add(
        window.onKeyDown.listen((KeyboardEvent e) {
          //enter
          if (e.keyCode == 13) {
            _onAffirmativeController.add(true);
          }
          //escape
          else if (e.keyCode == 27) {
            _onNegativeController.add(true);
            close();
          }
        })
    );
  }

  void show() {
    if (_blockBackground) {
      _backgroundBlocker = DivElement()
        ..classes.add('dialog_background_blocker');

      _backgroundBlocker.style.zIndex = (getHighestZIndex() + 1).toString();

      document.body.append(_backgroundBlocker);
    }

    element.style.zIndex = (getHighestZIndex() + 1).toString();
    element.style.opacity = '0';
    document.body.append(element);
    Timer(const Duration(milliseconds: 25), () {
      element.style.removeProperty('opacity');
    });
  }

  void close() {
    listeners.forEach((listener) {
      listener.cancel();
    });

    listeners.clear();
    element.style.opacity = '0';
    _backgroundBlocker.style.opacity = '0';
    Timer(const Duration(milliseconds: 200), () {
      element.remove();
      element = null;
      if (_blockBackground) {
        _backgroundBlocker.remove();
        _backgroundBlocker = null;
      }
    });
  }

}