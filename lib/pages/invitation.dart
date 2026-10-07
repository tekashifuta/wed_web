import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../components/invitation/details_section.dart';
import '../components/invitation/footer_section.dart';
import '../components/invitation/gallery_section.dart';
import '../components/invitation/hero_section.dart';
import '../components/invitation/nav_bar.dart';
import '../components/invitation/rsvp_section.dart';
import '../components/invitation/schedule_section.dart';
import '../components/invitation/story_section.dart';

// -----------------------------------------------------------------------
// 🌿 Garden Wedding Invitation Page
//
// This page is fully editable:
// - Text, dates, names, images -> edit `lib/constants/wedding_data.dart`
// - Colors & fonts             -> edit `lib/constants/theme.dart`
// - Layout of a single section -> edit the matching file in
//                                 `lib/components/invitation/`
//
// The page is reachable at the `/invitation` route (see `lib/app.dart`).
// -----------------------------------------------------------------------
@client
class Invitation extends StatelessComponent {
  const Invitation({super.key});

  /// Inline IntersectionObserver script that watches all [data-scroll]
  /// elements and adds `.in-view` when they enter the viewport.
  static const _scrollObserverJs = r'''
(function(){
  function init(){
    var io=new IntersectionObserver(function(es){
      es.forEach(function(e){if(e.isIntersecting)e.target.classList.add('in-view');});
    },{threshold:0.1,rootMargin:'0px 0px -60px 0px'});
    document.querySelectorAll('[data-scroll]').forEach(function(el){io.observe(el);});
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);
  else init();
})();
''';

  @override
  Component build(BuildContext context) {
    return div(classes: 'invitation-page', [
      const NavBar(),
      const HeroSection(),
      const StorySection(),
      const DetailsSection(),
      const ScheduleSection(),
      const GallerySection(),
      const RsvpSection(),
      const FooterSection(),
      // Scroll-animation observer — runs once on the client.
      script(id: 'scroll-observer', content: _scrollObserverJs),
    ]);
  }

  // Shared styles for the section "kicker" and "title" labels used across
  // multiple invitation sections (Our Story, Event Details, Schedule, Gallery...).
  @css
  static List<StyleRule> get styles => [
    css('.invitation-page', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
      ),
      css('.section-kicker', [
        css('&').styles(
          margin: .zero,
          letterSpacing: 4.px,
          textTransform: .upperCase,
          fontFamily: bodyFont,
          fontSize: 0.8.rem,
          fontWeight: .w600,
          color: primaryColor,
        ),
        css('&.light').styles(color: primaryFixedDim),
      ]),
      css('.section-title', [
        css('&').styles(
          margin: .only(top: 0.75.rem),
          fontFamily: headingFont,
          fontSize: 2.5.rem,
          lineHeight: 1.1.em,
          textAlign: .center,
          color: onSurface,
        ),
        css('&.light').styles(color: inverseOnSurface),
      ]),
    ]),

    // -------------------------------------------------------------------
    // 🎞️  Scroll-reveal animation system
    //
    // Any element with [data-scroll] starts hidden and transitions in
    // when the IntersectionObserver adds `.in-view`.
    //
    // Variants:
    //   data-scroll            → fade-up  (default)
    //   data-scroll="left"     → slide in from left
    //   data-scroll="right"    → slide in from right
    //   data-scroll="scale"    → scale up
    //
    // Stagger with:  data-scroll-delay="1" … "6"  (100 ms steps)
    // -------------------------------------------------------------------

    // Default: fade-up
    css('[data-scroll]', [
      css('&').styles(
        opacity: 0,
        transform: Transform.translate(y: 32.px),
        transition: const Transition(
          'all',
          duration: Duration(milliseconds: 800),
          curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        ),
      ),
      css('&.in-view').styles(
        opacity: 1,
        transform: Transform.none,
      ),
    ]),

    // Variant: slide from left
    css('[data-scroll="left"]', [
      css('&').styles(
        opacity: 0,
        transform: Transform.translate(x: Unit.pixels(-48)),
      ),
      css('&.in-view').styles(
        opacity: 1,
        transform: Transform.none,
      ),
    ]),

    // Variant: slide from right
    css('[data-scroll="right"]', [
      css('&').styles(
        opacity: 0,
        transform: Transform.translate(x: 48.px),
      ),
      css('&.in-view').styles(
        opacity: 1,
        transform: Transform.none,
      ),
    ]),

    // Variant: scale up
    css('[data-scroll="scale"]', [
      css('&').styles(
        opacity: 0,
        transform: Transform.scale(0.88),
      ),
      css('&.in-view').styles(
        opacity: 1,
        transform: Transform.none,
      ),
    ]),

    // Stagger delays (100 ms steps) — use raw CSS since transitionDelay
    // is not a typed parameter in Jaspr's styles API.
    css('[data-scroll-delay="1"]').styles(raw: const {'transition-delay': '100ms'}),
    css('[data-scroll-delay="2"]').styles(raw: const {'transition-delay': '200ms'}),
    css('[data-scroll-delay="3"]').styles(raw: const {'transition-delay': '300ms'}),
    css('[data-scroll-delay="4"]').styles(raw: const {'transition-delay': '400ms'}),
    css('[data-scroll-delay="5"]').styles(raw: const {'transition-delay': '500ms'}),
    css('[data-scroll-delay="6"]').styles(raw: const {'transition-delay': '600ms'}),
  ];
}
