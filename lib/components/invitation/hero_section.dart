import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// Full-bleed hero: names, date, church/venue and a **live countdown**.
///
/// The countdown values are updated every second by the inline script in
/// `pages/invitation.dart` (see the `cd-*` element ids below).
class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  /// Ids consumed by the countdown script.
  static const _ids = ['cd-days', 'cd-hours', 'cd-mins', 'cd-secs'];

  /// Placeholder values shown before the script runs.
  static const _initial = ['000', '00', '00', '00'];

  @override
  Component build(BuildContext context) {
    return div(id: 'home', classes: 'hero', [
      div(classes: 'hero-bg', []),
      div(classes: 'hero-overlay', []),
      div(classes: 'hero-content', [
        p(classes: 'hero-eyebrow', attributes: {'data-scroll': '', 'data-scroll-delay': '1'}, [
          .text(heroInvitationLabel),
        ]),
        h1(classes: 'hero-names', attributes: {'data-scroll': '', 'data-scroll-delay': '2'}, [
          span([.text(brideName)]),
          span(classes: 'hero-amp', [.text('&')]),
          span([.text(groomName)]),
        ]),
        div(classes: 'hero-meta', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, [
          p(classes: 'hero-date', [.text('$weddingWeekday, $weddingDateFull')]),
          p(classes: 'hero-place', [.text('$heroChurchName · $heroVenueName')]),
        ]),
        div(classes: 'countdown', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '4'}, [
          for (var i = 0; i < countdownLabels.length; i++)
            div(classes: 'countdown-cell', [
              span(id: _ids[i], classes: 'countdown-value', [.text(_initial[i])]),
              span(classes: 'countdown-label', [.text(countdownLabels[i])]),
            ]),
        ]),
        div(classes: 'hero-scroll', [
          span([.text('Scroll')]),
          span(classes: 'hero-scroll-icon', [.text('⌄')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero', [
      css('&').styles(
        position: .relative(),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        width: 100.percent,
        minHeight: 100.vh,
        padding: .only(top: 4.5.rem),
        overflow: .clip,
        backgroundColor: inverseSurface,
      ),
      css('.hero-bg').styles(
        position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        backgroundImage: ImageStyle.url(heroImageUrl),
        backgroundSize: .cover,
        backgroundPosition: BackgroundPosition.center,
        opacity: 0.62,
      ),
      css('.hero-overlay').styles(
        position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        raw: const {
          'background':
              'linear-gradient(to bottom, rgba(24, 20, 17, 0.62) 0%, rgba(24, 20, 17, 0.34) 45%, rgba(24, 20, 17, 0.78) 100%)',
        },
      ),
    ]),

    css('.hero-content', [
      css('&').styles(
        position: .relative(),
        zIndex: const ZIndex(1),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        maxWidth: 60.rem,
        padding: .symmetric(vertical: 2.rem, horizontal: 1.5.rem),
        textAlign: .center,
        color: inverseOnSurface,
      ),
      css('.hero-eyebrow').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.72.rem,
        fontWeight: .w500,
        letterSpacing: 6.px,
        textTransform: .upperCase,
        color: primaryFixedDim,
      ),
      css('.hero-names').styles(
        margin: .only(top: 1.5.rem),
        fontFamily: headingFont,
        fontSize: 6.2.rem,
        fontWeight: .w400,
        lineHeight: 1.02.em,
        letterSpacing: 1.px,
        color: inverseOnSurface,
      ),
      css('.hero-amp').styles(
        margin: .symmetric(horizontal: 1.rem),
        fontStyle: .italic,
        fontSize: 0.6.em,
        color: primaryFixedDim,
        opacity: 0.95,
      ),
      css('.hero-meta').styles(
        margin: .only(top: 1.9.rem),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: Gap.column(0.5.rem),
      ),
      css('.hero-date').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 1.85.rem,
        letterSpacing: 2.px,
        color: inverseOnSurface,
      ),
      css('.hero-place').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.74.rem,
        fontWeight: .w400,
        letterSpacing: 4.px,
        textTransform: .upperCase,
        color: const Color('rgba(246, 239, 230, 0.8)'),
      ),
      css('.countdown').styles(
        margin: .only(top: 2.75.rem),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.countdown-cell', [
        css('&').styles(
          position: .relative(),
          display: .flex,
          flexDirection: .column,
          alignItems: .center,
          padding: .symmetric(horizontal: 1.75.rem),
        ),
        css('& + .countdown-cell').styles(
          border: .only(left: BorderSide.solid(color: Color('rgba(246, 239, 230, 0.28)'), width: 1.px)),
        ),
      ]),
      css('.countdown-value').styles(
        minWidth: 3.2.rem,
        textAlign: .center,
        fontFamily: headingFont,
        fontSize: 2.5.rem,
        fontWeight: .w400,
        lineHeight: 1.em,
        color: inverseOnSurface,
        raw: const {'font-variant-numeric': 'tabular-nums'},
      ),
      css('.countdown-label').styles(
        margin: .only(top: 0.5.rem),
        fontFamily: bodyFont,
        fontSize: 0.6.rem,
        fontWeight: .w500,
        letterSpacing: 3.px,
        textTransform: .upperCase,
        color: const Color('rgba(246, 239, 230, 0.68)'),
      ),
      css('.hero-scroll').styles(
        margin: .only(top: 3.25.rem),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: Gap.column(0.25.rem),
        fontFamily: bodyFont,
        fontSize: 0.6.rem,
        fontWeight: .w500,
        letterSpacing: 3.px,
        textTransform: .upperCase,
        color: const Color('rgba(246, 239, 230, 0.6)'),
      ),
      css('.hero-scroll-icon').styles(
        fontSize: 1.1.rem,
        animation: const Animation(
          name: 'heroBounce',
          duration: Duration(seconds: 2),
          count: 100,
          curve: Curve.easeInOut,
        ),
      ),
    ]),

    // Gentle bob for the scroll cue.
    css.keyframes('heroBounce', {
      '0%, 100%': Styles(transform: Transform.translate(y: 0.px)),
      '50%': Styles(transform: Transform.translate(y: 6.px)),
    }),

    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.hero-names').styles(fontSize: 5.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.hero-names').styles(fontSize: 3.6.rem, lineHeight: 1.08.em),
      css('.hero-amp').styles(margin: .symmetric(horizontal: 0.6.rem)),
      css('.hero-date').styles(fontSize: 1.35.rem),
      css('.countdown-cell').styles(padding: .symmetric(horizontal: 1.1.rem)),
      css('.countdown-value').styles(fontSize: 2.05.rem, minWidth: 2.4.rem),
      css('.hero-scroll').styles(margin: .only(top: 2.25.rem)),
    ]),
    css.media(MediaQuery.screen(maxWidth: 420.px), [
      css('.hero-names').styles(fontSize: 3.rem),
      css('.countdown-cell').styles(padding: .symmetric(horizontal: 0.75.rem)),
      css('.countdown-value').styles(fontSize: 1.7.rem, minWidth: 2.rem),
    ]),
  ];
}
