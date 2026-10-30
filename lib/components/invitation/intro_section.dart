import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// Centered editorial paragraph that introduces the celebration.
class IntroSection extends StatelessComponent {
  const IntroSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'intro', classes: 'intro', [
      div(classes: 'intro-ornament', attributes: {'data-scroll': 'scale'}, [.text('❧')]),
      p(classes: 'intro-text', attributes: {'data-scroll': '', 'data-scroll-delay': '2'}, [
        .text(introParagraph),
      ]),
      div(classes: 'intro-rule', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
        textAlign: .center,
      ),
      css('.intro-ornament').styles(
        margin: .only(bottom: 2.rem),
        fontSize: 1.5.rem,
        lineHeight: 1.em,
        color: primaryFixedDim,
      ),
      css('.intro-text').styles(
        margin: .zero,
        maxWidth: 46.rem,
        fontFamily: headingFont,
        fontSize: 1.85.rem,
        fontWeight: .w400,
        lineHeight: 1.6.em,
        color: onSurface,
      ),
      css('.intro-rule').styles(
        margin: .only(top: 2.5.rem),
        width: 4.rem,
        height: 1.px,
        backgroundColor: primaryFixedDim,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.intro').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.intro-text').styles(fontSize: 1.4.rem, lineHeight: 1.65.em),
    ]),
  ];
}
