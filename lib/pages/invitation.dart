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
  ];
}
