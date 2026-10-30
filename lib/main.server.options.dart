// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:wed_web/components/invitation/attire_section.dart'
    as _attire_section;
import 'package:wed_web/components/invitation/cover_screen.dart'
    as _cover_screen;
import 'package:wed_web/components/invitation/details_section.dart'
    as _details_section;
import 'package:wed_web/components/invitation/entourage_section.dart'
    as _entourage_section;
import 'package:wed_web/components/invitation/faq_section.dart' as _faq_section;
import 'package:wed_web/components/invitation/footer_section.dart'
    as _footer_section;
import 'package:wed_web/components/invitation/gallery_section.dart'
    as _gallery_section;
import 'package:wed_web/components/invitation/gifts_section.dart'
    as _gifts_section;
import 'package:wed_web/components/invitation/hero_section.dart'
    as _hero_section;
import 'package:wed_web/components/invitation/intro_section.dart'
    as _intro_section;
import 'package:wed_web/components/invitation/nav_bar.dart' as _nav_bar;
import 'package:wed_web/components/invitation/prenup_section.dart'
    as _prenup_section;
import 'package:wed_web/components/invitation/reminders_section.dart'
    as _reminders_section;
import 'package:wed_web/components/invitation/rsvp_section.dart'
    as _rsvp_section;
import 'package:wed_web/components/invitation/schedule_section.dart'
    as _schedule_section;
import 'package:wed_web/components/invitation/seat_section.dart'
    as _seat_section;
import 'package:wed_web/components/invitation/story_section.dart'
    as _story_section;
import 'package:wed_web/constants/theme.dart' as _theme;
import 'package:wed_web/pages/invitation.dart' as _invitation;
import 'package:wed_web/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _invitation.Invitation: ClientTarget<_invitation.Invitation>('invitation'),
  },
  styles: () => [
    ..._theme.styles,
    ..._app.App.styles,
    ..._attire_section.AttireSection.styles,
    ..._cover_screen.CoverScreen.styles,
    ..._details_section.DetailsSection.styles,
    ..._entourage_section.EntourageSection.styles,
    ..._faq_section.FaqSection.styles,
    ..._footer_section.FooterSection.styles,
    ..._gallery_section.GallerySection.styles,
    ..._gifts_section.GiftsSection.styles,
    ..._hero_section.HeroSection.styles,
    ..._intro_section.IntroSection.styles,
    ..._nav_bar.NavBar.styles,
    ..._prenup_section.PrenupSection.styles,
    ..._reminders_section.RemindersSection.styles,
    ..._rsvp_section.RsvpSection.styles,
    ..._schedule_section.ScheduleSection.styles,
    ..._seat_section.SeatSection.styles,
    ..._story_section.StorySection.styles,
    ..._invitation.Invitation.styles,
  ],
);
