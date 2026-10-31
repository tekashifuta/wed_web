import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// Slim, translucent top navigation bar with anchor links to every section.
///
/// The active link is highlighted by the scroll-spy script in
/// `pages/invitation.dart`.
class NavBar extends StatelessComponent {
  const NavBar({super.key});

  /// `(href, label)` pairs — edit freely.
  static const links = <({String href, String label})>[
    (href: '#story', label: 'Story'),
    (href: '#film', label: 'Film'),
    (href: '#gifts', label: 'Gifts'),
    (href: '#details', label: 'Where'),
    (href: '#day', label: 'The Day'),
    (href: '#entourage', label: 'Entourage'),
    (href: '#attire', label: 'Attire'),
    (href: '#rsvp', label: 'RSVP'),
    (href: '#photos', label: 'Photos'),
  ];

  @override
  Component build(BuildContext context) {
    return div(classes: 'nav-bar', [
      a(href: '#home', classes: 'nav-brand', [
        span([.text(brideName)]),
        span(classes: 'nav-amp', [.text('&')]),
        span([.text(groomName)]),
      ]),
      nav(
        classes: 'nav-links',
        [
          for (final link in links) a(href: link.href, classes: 'nav-link', [.text(link.label)]),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.nav-bar', [
      css('&').styles(
        position: .fixed(top: 0.px, left: 0.px, right: 0.px),
        zIndex: const ZIndex(60),
        display: .flex,
        alignItems: .center,
        justifyContent: .spaceBetween,
        gap: Gap.column(1.5.rem),
        height: 4.5.rem,
        padding: .symmetric(horizontal: 1.75.rem),
        backgroundColor: const Color('rgba(252, 250, 248, 0.82)'),
        backdropFilter: Filter.blur(14.px),
        border: .only(bottom: BorderSide.solid(color: Color('rgba(221, 217, 213, 0.55)'), width: 1.px)),
      ),
      css('.nav-brand').styles(
        display: .flex,
        alignItems: .center,
        gap: Gap.column(0.35.rem),
        flex: Flex(shrink: 0),
        fontFamily: headingFont,
        fontSize: 1.35.rem,
        letterSpacing: 1.px,
        textDecoration: TextDecoration(line: .none),
        color: onSurface,
      ),
      css('.nav-amp').styles(color: primaryColor, fontStyle: .italic),
      css('.nav-links').styles(
        display: .flex,
        alignItems: .center,
        gap: Gap.column(0.15.rem),
        overflow: Overflow.only(x: .auto, y: .hidden),
        raw: const {'scrollbar-width': 'none'},
      ),
      css('.nav-links .nav-link', [
        css('&').styles(
          padding: .symmetric(vertical: 0.5.rem, horizontal: 0.7.rem),
          radius: .all(.circular(999.px)),
          fontFamily: bodyFont,
          fontSize: 0.7.rem,
          fontWeight: .w500,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          color: onSurfaceVariant,
          textDecoration: TextDecoration(line: .none),
          whiteSpace: .noWrap,
          transition: const Transition('color, background-color', duration: Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(color: primaryColor),
        css('&.active').styles(color: primaryColor, backgroundColor: accentContainer),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.nav-bar').styles(padding: .symmetric(horizontal: 1.rem), gap: Gap.column(0.75.rem)),
      css('.nav-brand').styles(fontSize: 1.1.rem),
      css('.nav-links .nav-link').styles(
        padding: .symmetric(vertical: 0.45.rem, horizontal: 0.5.rem),
        fontSize: 0.64.rem,
        letterSpacing: 1.4.px,
      ),
    ]),
  ];
}
