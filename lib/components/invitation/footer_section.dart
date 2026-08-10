import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// Simple footer shown at the bottom of the invitation page.
class FooterSection extends StatelessComponent {
  const FooterSection({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'invite-footer', [
      p(classes: 'footer-names', [.text(coupleNames)]),
      p(classes: 'footer-hashtag', [.text(weddingHashtag)]),
      p(classes: 'footer-contact', [
        .text('Questions? Reach us at '),
        a(href: 'mailto:$contactEmail', [.text(contactEmail)]),
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
        gap: Gap.all(0.5.rem),
        padding: .symmetric(vertical: 3.rem, horizontal: 1.5.rem),
        backgroundColor: gardenInk,
        textAlign: .center,
      ),
      css('.footer-names').styles(
        margin: .zero,
        fontFamily: scriptFont,
        fontSize: 1.8.rem,
        color: Colors.white,
      ),
      css('.footer-hashtag').styles(
        margin: .zero,
        fontFamily: bodyFont,
        letterSpacing: 1.px,
        fontSize: 0.85.rem,
        color: gardenGold,
      ),
      css('.footer-contact', [
        css('&').styles(margin: .only(top: 0.5.rem), fontFamily: bodyFont, fontSize: 0.85.rem, color: const Color('#B9BDAE')),
        css('a').styles(color: gardenGold, textDecoration: TextDecoration(line: .underline)),
      ]),
    ]),
  ];
}
