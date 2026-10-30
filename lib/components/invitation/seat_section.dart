import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "On the day" — quick actions for guests (find your seat / share photos).
class SeatSection extends StatelessComponent {
  const SeatSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'seat', classes: 'seat', [
      const SectionHeading(kicker: seatKicker, title: seatTitle),
      p(classes: 'seat-note', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, [
        .text(seatNote),
      ]),
      div(classes: 'seat-actions', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '4'}, [
        a(href: '#photos', classes: 'seat-btn seat-btn-primary', [.text(seatButtonLabel)]),
        a(href: '#photos', classes: 'seat-btn', [.text(photosButtonLabel)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.seat', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainerHigh,
      ),
      css('.seat-note').styles(
        margin: .only(top: 1.25.rem),
        maxWidth: 32.rem,
        fontFamily: bodyFont,
        fontSize: 0.98.rem,
        fontWeight: .w400,
        lineHeight: 1.75.em,
        textAlign: .center,
        color: onSurfaceVariant,
      ),
      css('.seat-actions').styles(
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        gap: Gap.all(1.rem),
        margin: .only(top: 2.75.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.seat-btn', [
        css('&').styles(
          padding: .symmetric(vertical: 0.95.rem, horizontal: 2.rem),
          radius: .all(.circular(999.px)),
          border: Border.all(color: primaryColor, width: 1.px),
          backgroundColor: const Color('rgba(138, 107, 64, 0)'),
          fontFamily: bodyFont,
          fontSize: 0.7.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: primaryColor,
          textDecoration: TextDecoration(line: .none),
          transition: const Transition('background-color, color', duration: Duration(milliseconds: 220)),
        ),
        css('&:hover').styles(backgroundColor: primaryColor, color: onPrimary),
        css('&.seat-btn-primary').styles(backgroundColor: primaryColor, color: onPrimary),
        css('&.seat-btn-primary:hover').styles(opacity: 0.88),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.seat').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
