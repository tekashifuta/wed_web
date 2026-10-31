import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// Closing footer: a handwritten sign-off, the couple's names and links.
class FooterSection extends StatelessComponent {
  const FooterSection({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'invite-footer', [
      div(classes: 'footer-inner', [
        p(classes: 'footer-signoff', attributes: {'data-scroll': ''}, [.text(footerSignOff)]),
        p(classes: 'footer-names', attributes: {'data-scroll': '', 'data-scroll-delay': '1'}, [
          .text(coupleNames),
        ]),
        div(classes: 'footer-hashtag', attributes: {'data-scroll': '', 'data-scroll-delay': '2'}, [
          .text(weddingHashtag),
        ]),
        div(classes: 'footer-links', [
          a(href: 'mailto:$contactEmail', [.text('Contact')]),
          a(href: '#', [.text('Privacy')]),
          a(href: '#', [.text('Samples')]),
        ]),
        p(classes: 'footer-copy', [.text('© 2026 $coupleNames · Made with ♥')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.invite-footer', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: inverseSurface,
        textAlign: .center,
      ),
      css('.footer-inner').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        maxWidth: 40.rem,
      ),
      css('.footer-signoff').styles(
        margin: .zero,
        fontFamily: scriptFont,
        fontSize: 2.rem,
        fontWeight: .w400,
        lineHeight: 1.3.em,
        color: primaryFixedDim,
      ),
      css('.footer-names').styles(
        margin: .only(top: 0.35.rem),
        fontFamily: headingFont,
        fontSize: 3.rem,
        fontWeight: .w400,
        lineHeight: 1.15.em,
        color: inverseOnSurface,
      ),
      css('.footer-hashtag').styles(
        margin: .only(top: 1.5.rem),
        padding: .symmetric(vertical: 0.5.rem, horizontal: 1.25.rem),
        radius: .all(.circular(999.px)),
        border: Border.all(color: Color('rgba(201, 174, 126, 0.35)'), width: 1.px),
        fontFamily: bodyFont,
        fontSize: 0.68.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        color: primaryFixedDim,
      ),
      css('.footer-links', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: Gap.column(1.75.rem),
          margin: .only(top: 2.5.rem),
        ),
        css('a').styles(
          fontFamily: bodyFont,
          fontSize: 0.68.rem,
          fontWeight: .w500,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          color: const Color('rgba(252, 250, 248, 0.7)'),
          textDecoration: TextDecoration(line: .none),
          transition: const Transition('color', duration: Duration(milliseconds: 200)),
        ),
        css('a:hover').styles(color: primaryFixedDim),
      ]),
      css('.footer-copy').styles(
        margin: .only(top: 2.5.rem),
        fontFamily: bodyFont,
        fontSize: 0.66.rem,
        fontWeight: .w400,
        letterSpacing: 1.px,
        color: const Color('rgba(252, 250, 248, 0.45)'),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.invite-footer').styles(padding: .symmetric(vertical: 4.rem, horizontal: 1.5.rem)),
      css('.footer-names').styles(fontSize: 2.3.rem),
      css('.footer-links').styles(gap: Gap.column(1.25.rem)),
    ]),
  ];
}
