import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// The full-screen "envelope" cover guests see first.
///
/// Tapping **Tap to open** (or **Skip**) adds `.cover-open` to the `<html>`
/// element — see the inline script in `pages/invitation.dart` — which fades
/// the cover away and unlocks page scrolling.
class CoverScreen extends StatelessComponent {
  const CoverScreen({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'cover', classes: 'cover', [
      div(classes: 'cover-glow', []),
      div(classes: 'cover-card', [
        p(classes: 'cover-kicker', attributes: {'data-scroll': '', 'data-scroll-delay': '1'}, [
          .text(coverKicker),
        ]),
        div(classes: 'cover-seal', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '2'}, [
          .text(monogramShort),
        ]),
        h1(classes: 'cover-names', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, [
          span([.text(brideName)]),
          span(classes: 'cover-amp', [.text('&')]),
          span([.text(groomName)]),
        ]),
        div(classes: 'cover-rule', attributes: {'data-scroll': '', 'data-scroll-delay': '4'}, []),
        p(classes: 'cover-date', attributes: {'data-scroll': '', 'data-scroll-delay': '4'}, [
          .text('$weddingWeekday, $weddingDateFull'),
        ]),
        button(
          classes: 'cover-cta',
          attributes: {'data-open-cover': '', 'type': 'button'},
          [.text(coverCta)],
        ),
      ]),
      a(
        href: '#home',
        classes: 'cover-skip',
        attributes: {'data-open-cover': ''},
        [.text(coverSkipLabel)],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.cover', [
      css('&').styles(
        position: .fixed(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        zIndex: const ZIndex(200),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        justifyContent: .center,
        padding: .symmetric(vertical: 4.rem, horizontal: 1.5.rem),
        overflow: .clip,
        backgroundColor: surface,
        transition: const Transition(
          'opacity, transform, visibility',
          duration: Duration(milliseconds: 850),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        ),
      ),
      // Soft champagne glow behind the invitation card.
      css('.cover-glow').styles(
        position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        raw: const {
          'background':
              'radial-gradient(120% 90% at 50% 0%, rgba(232, 217, 190, 0.55) 0%, rgba(251, 248, 243, 0) 60%), '
              'radial-gradient(90% 70% at 50% 110%, rgba(192, 138, 134, 0.18) 0%, rgba(251, 248, 243, 0) 55%)',
        },
      ),
    ]),

    // The "envelope" card.
    css('.cover-card', [
      css('&').styles(
        position: .relative(),
        zIndex: const ZIndex(1),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        maxWidth: 33.rem,
        padding: .symmetric(vertical: 3.25.rem, horizontal: 2.5.rem),
        radius: .all(.circular(3.px)),
        backgroundColor: const Color('rgba(255, 255, 255, 0.7)'),
        border: Border.all(color: primaryFixedDim, width: 1.px),
        backdropFilter: Filter.blur(8.px),
        shadow: ambientShadow,
        textAlign: .center,
      ),
      css('.cover-kicker').styles(
        margin: .zero,
        maxWidth: 22.rem,
        fontFamily: bodyFont,
        fontSize: 0.7.rem,
        fontWeight: .w400,
        letterSpacing: 3.px,
        lineHeight: 1.9.em,
        textTransform: .upperCase,
        color: onSurfaceVariant,
      ),
      css('.cover-seal').styles(
        margin: .only(top: 2.rem),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        width: 5.5.rem,
        height: 5.5.rem,
        radius: .all(.circular(999.px)),
        border: Border.all(color: primaryFixedDim, width: 1.px),
        backgroundColor: surface,
        fontFamily: headingFont,
        fontSize: 1.9.rem,
        letterSpacing: 1.px,
        color: primaryColor,
        shadow: softShadow,
      ),
      css('.cover-names').styles(
        margin: .only(top: 1.75.rem),
        fontFamily: headingFont,
        fontSize: 4.4.rem,
        fontWeight: .w400,
        lineHeight: 1.05.em,
        color: onSurface,
      ),
      css('.cover-amp').styles(
        margin: .symmetric(horizontal: 0.6.rem),
        fontStyle: .italic,
        fontSize: 0.75.em,
        color: primaryColor,
      ),
      css('.cover-rule').styles(
        margin: .symmetric(vertical: 1.5.rem),
        width: 3.5.rem,
        height: 1.px,
        backgroundColor: primaryFixedDim,
      ),
      css('.cover-date').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.76.rem,
        fontWeight: .w400,
        letterSpacing: 3.px,
        textTransform: .upperCase,
        color: onSurfaceVariant,
      ),
      css('.cover-cta').styles(
        margin: .only(top: 2.5.rem),
        padding: .symmetric(vertical: 0.95.rem, horizontal: 2.4.rem),
        radius: .all(.circular(999.px)),
        border: Border.all(color: primaryColor, width: 1.px),
        backgroundColor: const Color('rgba(251, 248, 243, 0)'),
        fontFamily: bodyFont,
        fontSize: 0.74.rem,
        fontWeight: .w500,
        letterSpacing: 3.px,
        textTransform: .upperCase,
        color: primaryColor,
        cursor: .pointer,
        transition: const Transition('background-color, color', duration: Duration(milliseconds: 250)),
      ),
      css('.cover-cta:hover').styles(backgroundColor: primaryColor, color: onPrimary),
    ]),

    css('.cover-skip').styles(
      position: Position.absolute(bottom: 2.25.rem, left: 0.px, right: 0.px),
      textAlign: .center,
      fontFamily: bodyFont,
      fontSize: 0.68.rem,
      fontWeight: .w500,
      letterSpacing: 3.px,
      textTransform: .upperCase,
      color: onSurfaceVariant,
      opacity: 0.75,
      textDecoration: TextDecoration(line: .none),
      cursor: .pointer,
      transition: const Transition('opacity', duration: Duration(milliseconds: 200)),
    ),
    css('.cover-skip:hover').styles(opacity: 1, color: primaryColor),

    // Open state — added to <html> by the inline script.
    css('html.cover-open .cover').styles(
      opacity: 0,
      visibility: .hidden,
      transform: Transform.scale(1.04),
      raw: const {'pointer-events': 'none'},
    ),

    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.cover-card').styles(padding: .symmetric(vertical: 2.5.rem, horizontal: 1.5.rem)),
      css('.cover-names').styles(fontSize: 3.1.rem),
      css('.cover-seal').styles(width: 4.5.rem, height: 4.5.rem, fontSize: 1.55.rem),
    ]),
  ];
}
