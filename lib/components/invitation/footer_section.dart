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
      div(classes: 'footer-brand', [
        span([.text('R ')]),
        span(classes: 'footer-amp', [.text('&')]),
        span([.text(' D')]),
      ]),
      div(classes: 'footer-links', [
        a(href: '#', [.text('Contact Us')]),
        a(href: '#', [.text('Privacy Policy')]),
      ]),
      p(classes: 'footer-message',
          [.text("We can't wait to celebrate this special day with you.")]),
      p(classes: 'footer-copy', [.text('© 2026 $coupleNames')]),
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
        padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainerLow,
        border: .only(top: BorderSide.solid(color: Color('rgba(195, 200, 191, 0.3)'), width: 1.px)),
        textAlign: .center,
      ),
      css('.footer-brand').styles(
        margin: .only(bottom: 1.5.rem),
        fontFamily: headingFont,
        fontSize: 1.5.rem,
        letterSpacing: Unit.pixels(-1),
        color: primaryColor,
      ),
      css('.footer-amp').styles(opacity: 0.6),
      css('.footer-links', [
        css('&').styles(
          display: .flex,
          gap: Gap.all(1.5.rem),
          margin: .only(bottom: 2.rem),
        ),
        css('a').styles(
          fontFamily: bodyFont,
          fontSize: 0.95.rem,
          color: onSurfaceVariant,
          opacity: 0.8,
          textDecoration: TextDecoration(line: .none),
          transition: Transition('color', duration: const Duration(milliseconds: 200)),
        ),
        css('a:hover').styles(color: primaryColor, opacity: 1),
      ]),
      // Message shown only on mobile (the mobile design omits the links).
      css('.footer-message').styles(
        display: .none,
        margin: .zero,
        maxWidth: 20.rem,
        fontFamily: bodyFont,
        fontSize: 1.02.rem,
        lineHeight: 1.6.em,
        color: onSurfaceVariant,
      ),
      css('.footer-copy').styles(
        margin: .only(top: 2.rem),
        fontFamily: bodyFont,
        fontSize: 0.75.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        textTransform: .upperCase,
        color: onSurfaceVariant,
        opacity: 0.6,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.footer-links').styles(display: .none),
      css('.footer-message').styles(display: .block),
    ]),
  ];
}
