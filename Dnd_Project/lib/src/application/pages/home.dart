part of application;

class HomePage {
  DivElement shell = document.querySelector('#shell');
  DivElement content = DivElement()..id = 'content';
  HomePage() {
    init();
  }

  void init() {
    String markup = '''
      <div class="home-page">
        <div class="intro">
          <div class="title-container">
            <div class="page-title">The Table Tool</div>
            <div class="page-sub-title">A Tool for DMs and Their Players</div>
          </div>
        </div>
      </div>
    ''';

    NodeValidator validator = NodeValidator();
    content.setInnerHtml(markup, treeSanitizer: NodeTreeSanitizer(validator));
    shell.append(content);
  }
}