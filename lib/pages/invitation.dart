import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/invitation/attire_section.dart';
import '../components/invitation/cover_screen.dart';
import '../components/invitation/details_section.dart';
import '../components/invitation/entourage_section.dart';
import '../components/invitation/faq_section.dart';
import '../components/invitation/footer_section.dart';
import '../components/invitation/gallery_section.dart';
import '../components/invitation/gifts_section.dart';
import '../components/invitation/hero_section.dart';
import '../components/invitation/intro_section.dart';
import '../components/invitation/nav_bar.dart';
import '../components/invitation/prenup_section.dart';
import '../components/invitation/reminders_section.dart';
import '../components/invitation/rsvp_section.dart';
import '../components/invitation/schedule_section.dart';
import '../components/invitation/seat_section.dart';
import '../components/invitation/story_section.dart';
import '../constants/theme.dart';
import '../constants/wedding_data.dart';

// -----------------------------------------------------------------------
// 🌹 Wedding Invitation Page
//
// Assembled from the sections in `lib/components/invitation/`:
//
//   CoverScreen → NavBar → HeroSection (countdown) → IntroSection →
//   StorySection → PrenupSection → GiftsSection → DetailsSection →
//   ScheduleSection → EntourageSection → AttireSection → FaqSection →
//   RemindersSection → RsvpSection → SeatSection → GallerySection →
//   FooterSection
//
// - Text, dates, names, images -> edit `lib/constants/wedding_data.dart`
// - Colors & fonts             -> edit `lib/constants/theme.dart`
// - Layout of a single section -> edit the matching component file
// -----------------------------------------------------------------------
@client
class Invitation extends StatelessComponent {
  const Invitation({super.key});

  /// Inline IntersectionObserver script that watches all [data-scroll]
  /// elements and adds `.in-view` when they enter the viewport.
  ///
  /// It re-runs on `load` and a couple of times shortly after, so elements
  /// are still observed if the client hydration pass swaps the DOM nodes.
  static const _scrollObserverJs = r'''
(function(){
  var io;
  function init(){
    if(!io){
      io=new IntersectionObserver(function(es){
        es.forEach(function(e){if(e.isIntersecting)e.target.classList.add('in-view');});
      },{threshold:0.1,rootMargin:'0px 0px -60px 0px'});
    }
    document.querySelectorAll('[data-scroll]:not(.in-view)').forEach(function(el){io.observe(el);});
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);
  else init();
  window.addEventListener('load',init);
  setTimeout(init,600);
  setTimeout(init,2000);
})();
''';

  /// All client-side behaviour for the invitation:
  ///
  /// 1. opens the cover screen (and locks scrolling until it is opened),
  /// 2. runs the live countdown on the hero,
  /// 3. keeps the RSVP completion counter in sync,
  /// 4. highlights the active nav link while scrolling,
  /// 5. handles copy-to-clipboard, gift tabs, FAQ accordions and RSVP choices,
  /// 6. confirms the RSVP submission.
  ///
  /// NOTE: the target date is injected from [weddingDateTimeIso]; the rest of
  /// the script intentionally avoids `$` so it can stay a simple string.
  static String get _interactionsJs => '''
(function(){
  var doc = document;
  var root = doc.documentElement;

  function openCover(){
    root.classList.add('cover-open');
    doc.body.classList.remove('no-scroll');
  }
  doc.body.classList.add('no-scroll');

  var target = new Date('$weddingDateTimeIso');
  function pad(n){ return n < 10 ? '0' + n : '' + n; }
  function setText(id, value){ var el = doc.getElementById(id); if (el) el.textContent = value; }
  function tick(){
    var diff = target.getTime() - new Date().getTime();
    if (isNaN(diff)) return;
    if (diff < 0) diff = 0;
    setText('cd-days', String(Math.floor(diff / 86400000)));
    setText('cd-hours', pad(Math.floor(diff % 86400000 / 3600000)));
    setText('cd-mins', pad(Math.floor(diff % 3600000 / 60000)));
    setText('cd-secs', pad(Math.floor(diff % 60000 / 1000)));
  }
  tick();
  setInterval(tick, 1000);

  function updateRsvp(){
    var groups = doc.querySelectorAll('[data-choice-group]');
    var done = 0;
    for (var i = 0; i < groups.length; i++){
      if (groups[i].querySelector('.selected')) done++;
    }
    var complete = groups.length > 0 && done === groups.length;
    var status = doc.querySelector('[data-rsvp-status]');
    var count = doc.querySelector('[data-rsvp-count]');
    var hint = doc.querySelector('[data-rsvp-hint]');
    if (count) count.textContent = done + ' of ' + groups.length + ' complete';
    if (status) status.classList.toggle('complete', complete);
    if (hint) hint.textContent = complete
      ? 'Response complete. Thank you!'
      : 'Choose an answer for each guest.';
  }

  var sections = doc.querySelectorAll('div[id], footer[id]');
  var navLinks = doc.querySelectorAll('.nav-links .nav-link');
  function spy(){
    var y = window.scrollY + 120;
    var current = '';
    for (var i = 0; i < sections.length; i++){
      if (sections[i].offsetTop <= y) current = sections[i].id;
    }
    for (var j = 0; j < navLinks.length; j++){
      var href = navLinks[j].getAttribute('href') || '';
      navLinks[j].classList.toggle('active', href === '#' + current);
    }
  }
  window.addEventListener('scroll', spy, {passive: true});
  spy();

  doc.addEventListener('click', function(e){
    var el = e.target;
    if (!el || !el.closest) return;

    var opener = el.closest('[data-open-cover]');
    if (opener){ e.preventDefault(); openCover(); return; }

    var copier = el.closest('[data-copy]');
    if (copier){
      e.preventDefault();
      var value = copier.getAttribute('data-copy') || '';
      var original = copier.getAttribute('data-label') || copier.textContent;
      copier.textContent = 'Copied';
      window.setTimeout(function(){ copier.textContent = original; }, 1600);
      if (navigator.clipboard && navigator.clipboard.writeText){
        navigator.clipboard.writeText(value).catch(function(){});
      }
      return;
    }

    var tab = el.closest('[data-gift-tab]');
    if (tab){
      var key = tab.getAttribute('data-gift-tab');
      var tabs = doc.querySelectorAll('[data-gift-tab]');
      for (var t = 0; t < tabs.length; t++) tabs[t].classList.toggle('active', tabs[t] === tab);
      var panels = doc.querySelectorAll('[data-gift-panel]');
      for (var p = 0; p < panels.length; p++){
        panels[p].classList.toggle('active', panels[p].getAttribute('data-gift-panel') === key);
      }
      return;
    }

    var accordion = el.closest('[data-accordion]');
    if (accordion){ accordion.classList.toggle('open'); return; }

    var choice = el.closest('[data-choice]');
    if (choice){
      var group = choice.closest('[data-choice-group]');
      if (group){
        var options = group.querySelectorAll('[data-choice]');
        for (var o = 0; o < options.length; o++){
          options[o].classList.toggle('selected', options[o] === choice);
        }
      }
      updateRsvp();
    }
  });

  var rsvpForm = doc.querySelector('.rsvp-card');
  if (rsvpForm){
    rsvpForm.addEventListener('submit', function(e){
      e.preventDefault();
      var count = doc.querySelector('[data-rsvp-count]');
      if (count) count.textContent = 'Thank you — your response has been recorded.';
      var hint = doc.querySelector('[data-rsvp-hint]');
      if (hint) hint.textContent = 'We cannot wait to celebrate with you.';
    });
  }

  // Re-apply state that a hydration pass may have replaced.
  window.addEventListener('load', function(){
    if (!root.classList.contains('cover-open')) doc.body.classList.add('no-scroll');
    spy();
    updateRsvp();
  });

  updateRsvp();
})();
''';

  @override
  Component build(BuildContext context) {
    return div(classes: 'invitation-page', [
      const CoverScreen(),
      const NavBar(),
      const HeroSection(),
      const IntroSection(),
      const StorySection(),
      const PrenupSection(),
      const GiftsSection(),
      const DetailsSection(),
      const ScheduleSection(),
      const EntourageSection(),
      const AttireSection(),
      const FaqSection(),
      const RemindersSection(),
      const RsvpSection(),
      const SeatSection(),
      const GallerySection(),
      const FooterSection(),
      // Client-side behaviour: scroll reveals, cover, countdown, RSVP, FAQ…
      script(id: 'scroll-observer', content: _scrollObserverJs),
      script(id: 'invite-interactions', content: _interactionsJs),
    ]);
  }

  // Shared styles for the section "kicker" and "title" labels used across
  // multiple invitation sections (Story, Gifts, Where, The Day, …).
  @css
  static List<StyleRule> get styles => [
    css('.invitation-page', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
        backgroundColor: surface,
      ),
      css('.section-head').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        textAlign: .center,
      ),
      css('.section-kicker', [
        css('&').styles(
          margin: .zero,
          fontFamily: bodyFont,
          fontSize: 0.7.rem,
          fontWeight: .w500,
          letterSpacing: 5.px,
          textTransform: .upperCase,
          color: primaryColor,
        ),
        css('&.light').styles(color: primaryFixedDim),
      ]),
      css('.section-title', [
        css('&').styles(
          margin: .only(top: 0.85.rem),
          maxWidth: 34.rem,
          fontFamily: headingFont,
          fontSize: 3.rem,
          fontWeight: .w400,
          lineHeight: 1.12.em,
          textAlign: .center,
          color: onSurface,
        ),
        css('&.light').styles(color: inverseOnSurface),
      ]),
    ]),

    // -----------------------------------------------------------------
    // 🎞️  Scroll-reveal animation system
    //
    // Elements carrying [data-scroll] are **visible by default** and simply
    // play a keyframe animation the first time the IntersectionObserver adds
    // `.in-view`. Keeping the hidden state out of CSS means content can never
    // get stuck invisible (no-JS visitors, or a hydration pass that drops the
    // class, still see the full invitation).
    //
    //   data-scroll                → fade-up (default)
    //   data-scroll="left"         → slide in from the left
    //   data-scroll="right"        → slide in from the right
    //   data-scroll="scale"        → scale up
    //   data-scroll-delay="1".."6" → 100 ms stagger steps
    // -----------------------------------------------------------------
    css('[data-scroll]').styles(opacity: 1),
    css('[data-scroll].in-view').styles(
      animation: const Animation(
        name: 'revealUp',
        duration: Duration(milliseconds: 800),
        curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        fillMode: AnimationFillMode.both,
      ),
    ),
    css.keyframes('revealUp', {
      'from': Styles(opacity: 0, transform: Transform.translate(y: 30.px)),
      'to': Styles(opacity: 1, transform: Transform.none),
    }),
    css('[data-scroll="left"].in-view').styles(
      animation: const Animation(
        name: 'revealLeft',
        duration: Duration(milliseconds: 800),
        curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        fillMode: AnimationFillMode.both,
      ),
    ),
    css.keyframes('revealLeft', {
      'from': Styles(opacity: 0, transform: Transform.translate(x: Unit.pixels(-48))),
      'to': Styles(opacity: 1, transform: Transform.none),
    }),
    css('[data-scroll="right"].in-view').styles(
      animation: const Animation(
        name: 'revealRight',
        duration: Duration(milliseconds: 800),
        curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        fillMode: AnimationFillMode.both,
      ),
    ),
    css.keyframes('revealRight', {
      'from': Styles(opacity: 0, transform: Transform.translate(x: 48.px)),
      'to': Styles(opacity: 1, transform: Transform.none),
    }),
    css('[data-scroll="scale"].in-view').styles(
      animation: const Animation(
        name: 'revealScale',
        duration: Duration(milliseconds: 800),
        curve: Curve.cubicBezier(0.22, 1, 0.36, 1),
        fillMode: AnimationFillMode.both,
      ),
    ),
    css.keyframes('revealScale', {
      'from': Styles(opacity: 0, transform: Transform.scale(0.92)),
      'to': Styles(opacity: 1, transform: Transform.none),
    }),

    // Stagger delays (100 ms steps). Emitted *after* the animation rules so
    // this equally-specific selector wins on `animation-delay` — raw CSS
    // because the delay can't be expressed per-selector in Jaspr's typed API.
    css('[data-scroll][data-scroll-delay="1"]').styles(raw: const {'animation-delay': '100ms'}),
    css('[data-scroll][data-scroll-delay="2"]').styles(raw: const {'animation-delay': '200ms'}),
    css('[data-scroll][data-scroll-delay="3"]').styles(raw: const {'animation-delay': '300ms'}),
    css('[data-scroll][data-scroll-delay="4"]').styles(raw: const {'animation-delay': '400ms'}),
    css('[data-scroll][data-scroll-delay="5"]').styles(raw: const {'animation-delay': '500ms'}),
    css('[data-scroll][data-scroll-delay="6"]').styles(raw: const {'animation-delay': '600ms'}),

    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.invitation-page .section-title').styles(fontSize: 2.3.rem),
      css('.invitation-page .section-kicker').styles(letterSpacing: 3.5.px),
    ]),
  ];
}
