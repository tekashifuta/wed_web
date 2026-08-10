// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:wed_web/components/invitation/details_section.dart'
    as _details_section;
import 'package:wed_web/components/invitation/footer_section.dart'
    as _footer_section;
import 'package:wed_web/components/invitation/gallery_section.dart'
    as _gallery_section;
import 'package:wed_web/components/invitation/hero_section.dart'
    as _hero_section;
import 'package:wed_web/components/invitation/intro_section.dart'
    as _intro_section;
import 'package:wed_web/components/invitation/rsvp_section.dart'
    as _rsvp_section;
import 'package:wed_web/components/invitation/schedule_section.dart'
    as _schedule_section;
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
    ..._details_section.DetailsSection.styles,
    ..._footer_section.FooterSection.styles,
    ..._gallery_section.GallerySection.styles,
    ..._hero_section.HeroSection.styles,
    ..._intro_section.IntroSection.styles,
    ..._rsvp_section.RsvpSection.styles,
    ..._schedule_section.ScheduleSection.styles,
    ..._story_section.StorySection.styles,
    ..._invitation.Invitation.styles,
  ],
);
