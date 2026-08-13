import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// A short "welcome" quote section shown right after the hero.
class IntroSection extends StatelessComponent {
  const IntroSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'intro', [
      div(classes: 'intro-ornament', [.text('❀')]),
      p(classes: 'intro-quote', [.text(introQuote)]),
      p(classes: 'intro-signature', [.text('— $coupleNames')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
        textAlign: .center,
      ),
      css('.intro-ornament').styles(
        margin: .only(bottom: 1.25.rem),
        color: primaryColor,
        fontSize: 1.9.rem,
        opacity: 0.5,
      ),
      css('.intro-quote').styles(
        margin: .zero,
        maxWidth: 720.px,
        fontFamily: headingFont,
        fontStyle: .italic,
        fontSize: 2.1.rem,
        lineHeight: 1.4.em,
        color: onSurface,
      ),
      css('.intro-signature').styles(
        margin: .only(top: 2.rem),
        fontFamily: bodyFont,
        letterSpacing: 4.px,
        textTransform: .upperCase,
        fontSize: 0.8.rem,
        fontWeight: .w600,
        color: primaryColor,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.intro').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.intro-quote').styles(fontSize: 1.5.rem),
    ]),
  ];
}
