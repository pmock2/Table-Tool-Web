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
        <div class="intro" style="opacity: 0;">
          <div class="title-container">
            <div class="page-title">The Table Tool</div>
            <div class="page-sub-title" style="opacity: 0">A Tool for DMs and Their Players</div>
            <div class="get-started-button" style="opacity: 0">Get Started</div>
          </div>
        </div>
        <div class="page-section">
          <div class="page-section-title">My Title</div>
          <div class="page-section-content">
          </div>
        </div>
        <div class="page-section">
          <div class="page-section-title">My Title</div>
          <div class="page-section-content">
          </div>
        </div>
      </div>
    ''';

    content.setInnerHtml(markup, treeSanitizer: NullTreeSanitizer());
    shell.append(content);

    Timer(const Duration(milliseconds: 150), () {
      content.querySelector('.intro').style.opacity = '1';
    });

    Timer(const Duration(milliseconds: 650), () {
      content.querySelector('.page-sub-title').style.opacity = '1';
    });

    Timer(const Duration(milliseconds: 1150), () {
      content.querySelector('.get-started-button').style.opacity = '1';
    });
  }
}