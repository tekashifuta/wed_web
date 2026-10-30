import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Small reusable "kicker + title" block used at the top of most sections.
///
/// The `.section-kicker` / `.section-title` classes are defined once in
/// `pages/invitation.dart`, so every section shares the same typography.
class SectionHeading extends StatelessComponent {
  const SectionHeading({
    required this.kicker,
    required this.title,
    this.light = false,
    this.delay = 1,
    super.key,
  });

  final String kicker;
  final String title;

  /// Light variant for dark bands (footer, reminders...).
  final bool light;

  /// Stagger index (1-based) used by the scroll-reveal system.
  final int delay;

  @override
  Component build(BuildContext context) {
    final second = delay >= 6 ? 6 : delay + 1;
    return div(classes: 'section-head', [
      p(
        classes: light ? 'section-kicker light' : 'section-kicker',
        attributes: {'data-scroll': '', 'data-scroll-delay': '$delay'},
        [.text(kicker)],
      ),
      h2(
        classes: light ? 'section-title light' : 'section-title',
        attributes: {'data-scroll': '', 'data-scroll-delay': '$second'},
        [.text(title)],
      ),
    ]);
  }
}
