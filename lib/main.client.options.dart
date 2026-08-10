// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:wed_web/pages/about.dart' deferred as _about;
import 'package:wed_web/pages/home.dart' deferred as _home;
import 'package:wed_web/pages/invitation.dart' deferred as _invitation;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
    'invitation': ClientLoader(
      (p) => _invitation.Invitation(),
      loader: _invitation.loadLibrary,
    ),
  },
);
