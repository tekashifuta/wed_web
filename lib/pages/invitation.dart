import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/invitation/details_section.dart';
import '../components/invitation/footer_section.dart';
import '../components/invitation/gallery_section.dart';
import '../components/invitation/hero_section.dart';
import '../components/invitation/intro_section.dart';
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

  @override
  Component build(BuildContext context) {
    return div(classes: 'invitation-page', [
      const HeroSection(),
      const IntroSection(),
      const StorySection(),
      const DetailsSection(),
      const ScheduleSection(),
      const GallerySection(),
      const RsvpSection(),
      const FooterSection(),
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
          letterSpacing: 3.px,
          textTransform: .upperCase,
          fontFamily: FontFamily('Lato'),
          fontSize: 0.85.rem,
          fontWeight: .w700,
          color: const Color('#C9A24B'),
        ),
        css('&.light').styles(color: const Color('#D8CB8F')),
      ]),
      css('.section-title', [
        css('&').styles(
          margin: .only(top: 0.5.rem),
          fontFamily: FontFamily('Playfair Display'),
          fontSize: 2.4.rem,
          textAlign: .center,
          color: const Color('#33362F'),
        ),
        css('&.light').styles(color: Colors.white),
      ]),
    ]),
  ];
}
