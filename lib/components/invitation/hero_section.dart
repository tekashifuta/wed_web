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
        // The hero uses the origin's staged `hero-rise` / `hero-stage-rise`
        // entrance (see the keyframes below) instead of the scroll reveal,
        // because it is the first thing under the cover.
        p(classes: 'hero-eyebrow', [
          .text(heroInvitationLabel),
        ]),
        h1(classes: 'hero-names', [
          span([.text(brideName)]),
          span(classes: 'hero-amp', [.text('&')]),
          span([.text(groomName)]),
        ]),
        div(classes: 'hero-meta', [
          p(classes: 'hero-date', [.text('$weddingWeekday, $weddingDateFull')]),
          p(classes: 'hero-place', [.text('$heroChurchName · $heroVenueName')]),
        ]),
        div(classes: 'countdown', [
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
        // Origin `.animate-kenburns-a`: `9s ease-out both`.
        animation: const Animation(
          name: 'heroKenBurns',
          duration: Duration(seconds: 9),
          curve: Curve.easeOut,
          fillMode: AnimationFillMode.both,
        ),
      ),
      css('.hero-overlay').styles(
        position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        raw: const {
          'background':
              'linear-gradient(to bottom, rgba(93, 84, 76, 0.66) 0%, rgba(93, 84, 76, 0.38) 45%, rgba(93, 84, 76, 0.84) 100%)',
        },
        // Origin `.hero-glow-pulse`: 18s ease-in-out infinite alternate.
        animation: const Animation(
          name: 'heroGlowPulse',
          duration: Duration(seconds: 18),
          curve: Curve.easeInOut,
          direction: AnimationDirection.alternate,
          count: 100,
        ),
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
        // Origin `.hero-rise`: .7s cubic-bezier(.22,1,.36,1) forwards.
        animation: const Animation(
          name: 'heroRise',
          duration: Duration(milliseconds: 700),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
          fillMode: AnimationFillMode.both,
        ),
      ),
      css('.hero-names').styles(
        margin: .only(top: 1.5.rem),
        fontFamily: headingFont,
        fontSize: 6.2.rem,
        fontWeight: .w400,
        lineHeight: 1.02.em,
        letterSpacing: 1.px,
        color: inverseOnSurface,
        animation: const Animation(
          name: 'heroRise',
          duration: Duration(milliseconds: 700),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
          delay: Duration(milliseconds: 120),
          fillMode: AnimationFillMode.both,
        ),
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
        // Origin `.hero-stage-rise`: .9s cubic-bezier(.22,1,.36,1) .48s.
        animation: const Animation(
          name: 'heroStageRise',
          duration: Duration(milliseconds: 900),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
          delay: Duration(milliseconds: 480),
          fillMode: AnimationFillMode.both,
        ),
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
        color: const Color('rgba(252, 250, 248, 0.8)'),
      ),
      css('.countdown').styles(
        margin: .only(top: 2.75.rem),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        raw: const {'flex-wrap': 'wrap'},
        animation: const Animation(
          name: 'heroStageRise',
          duration: Duration(milliseconds: 900),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
          delay: Duration(milliseconds: 600),
          fillMode: AnimationFillMode.both,
        ),
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
          border: .only(left: BorderSide.solid(color: Color('rgba(252, 250, 248, 0.28)'), width: 1.px)),
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
        color: const Color('rgba(252, 250, 248, 0.68)'),
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
        color: const Color('rgba(252, 250, 248, 0.62)'),
        animation: const Animation(
          name: 'heroStageRise',
          duration: Duration(milliseconds: 900),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
          delay: Duration(milliseconds: 720),
          fillMode: AnimationFillMode.both,
        ),
      ),
      // Origin `.hero-bob-slow`: 9s ease-in-out 1.6s infinite alternate.
      css('.hero-scroll-icon').styles(
        fontSize: 1.1.rem,
        animation: const Animation(
          name: 'heroBob',
          duration: Duration(seconds: 9),
          curve: Curve.easeInOut,
          delay: Duration(milliseconds: 1600),
          direction: AnimationDirection.alternate,
          count: 100,
        ),
      ),
    ]),

    // ---------------------------------------------------------------------
    // Hero keyframes — bodies mirror the origin stylesheet
    // (`ceremo-hero-*`, `kenburns-a`). See the RE report §6.
    // ---------------------------------------------------------------------
    css.keyframes('heroRise', {
      '0%': Styles(opacity: 0, raw: const {'transform': 'translateY(14px)'}),
      '100%': Styles(opacity: 1, raw: const {'transform': 'translate(0, 0)'}),
    }),
    css.keyframes('heroStageRise', {
      '0%': Styles(opacity: 0, raw: const {'transform': 'translateY(28px)'}),
      '100%': Styles(opacity: 1, raw: const {'transform': 'translate(0, 0)'}),
    }),
    css.keyframes('heroBob', {
      '0%': Styles(raw: const {'transform': 'translate(0, 0)'}),
      '100%': Styles(raw: const {'transform': 'translateY(-6px)'}),
    }),
    css.keyframes('heroGlowPulse', {
      '0%': Styles(opacity: 0.85, raw: const {'transform': 'scale(1)'}),
      '100%': Styles(opacity: 1, raw: const {'transform': 'scale(1.06)'}),
    }),
    css.keyframes('heroKenBurns', {
      '0%': Styles(raw: const {'transform': 'scale(1.02) translate(0)'}),
      '100%': Styles(raw: const {'transform': 'scale(1.09) translate(-1.4%, -1%)'}),
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
