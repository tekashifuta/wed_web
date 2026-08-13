import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

/// Fixed, glassmorphic top navigation bar with the couple's monogram.
///
/// Mirrors the Stitch "Wedding Home" screen: a centered Playfair monogram on
/// a backdrop-blurred, translucent bar with a fine bottom border.
class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'nav-bar', [
      a(href: '#', classes: 'nav-brand', [
        span([.text('R ')]),
        span(classes: 'nav-amp', [.text('&')]),
        span([.text(' D')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.nav-bar', [
      css('&').styles(
        position: .fixed(top: 0.px, left: 0.px, right: 0.px),
        zIndex: const ZIndex(50),
        display: .flex,
        justifyContent: .center,
        alignItems: .center,
        height: 5.rem,
        padding: .symmetric(horizontal: 1.5.rem),
        backgroundColor: const Color('rgba(255, 248, 246, 0.8)'),
        backdropFilter: Filter.blur(12.px),
        border: .only(bottom: BorderSide.solid(color: Color('rgba(195, 200, 191, 0.2)'), width: 1.px)),
      ),
      css('.nav-brand').styles(
        fontFamily: headingFont,
        fontSize: 1.5.rem,
        letterSpacing: Unit.pixels(-1),
        textDecoration: TextDecoration(line: .none),
        color: onSurface,
      ),
      css('.nav-amp').styles(
        color: primaryColor,
        opacity: 0.7,
      ),
    ]),
  ];
}
