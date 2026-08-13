import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// The "Ceremony & Reception" details section, shown as two cards.
class DetailsSection extends StatelessComponent {
  const DetailsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'details', [
      p(classes: 'section-kicker', [.text('Event Details')]),
      h2(classes: 'section-title', [.text('When & Where')]),
      div(classes: 'details-cards', [
        _detailsCard(icon: '💐', title: 'Ceremony', time: ceremonyTime, venue: ceremonyVenue, address: ceremonyAddress),
        _detailsCard(icon: '🥂', title: 'Reception', time: receptionTime, venue: receptionVenue, address: receptionAddress),
      ]),
    ]);
  }

  Component _detailsCard({
    required String icon,
    required String title,
    required String time,
    required String venue,
    required String address,
  }) {
    return div(classes: 'details-card', [
      div(classes: 'details-icon', [.text(icon)]),
      h3([.text(title)]),
      p(classes: 'details-time', [.text(time)]),
      p(classes: 'details-venue', [.text(venue)]),
      p(classes: 'details-address', [.text(address)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.details', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: secondaryContainer,
      ),
      css('.details-cards').styles(
        display: .flex,
        flexWrap: .wrap,
        justifyContent: .center,
        gap: Gap.all(1.5.rem),
        margin: .only(top: 3.5.rem),
        maxWidth: 900.px,
      ),
    ]),
    css('.details-card', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 320.px,
        padding: .all(2.5.rem),
        radius: .all(.circular(8.px)),
        backgroundColor: const Color('#fffdfb'),
        border: Border.all(color: primaryContainer, width: 1.px),
        shadow: ambientShadow,
        textAlign: .center,
      ),
      css('.details-icon').styles(margin: .only(bottom: 0.9.rem), fontSize: 2.2.rem, opacity: 0.8),
      css('h3').styles(margin: .only(bottom: 0.75.rem), fontFamily: headingFont, fontSize: 1.6.rem, color: onSurface),
      css('.details-time').styles(
        margin: .only(bottom: 0.75.rem),
        fontFamily: headingFont,
        fontSize: 1.4.rem,
        color: secondaryColor,
      ),
      css('.details-venue').styles(margin: .only(bottom: 0.25.rem), fontFamily: bodyFont, fontWeight: .w700, fontSize: 1.rem, color: onSurface),
      css('.details-address').styles(margin: .zero, fontFamily: bodyFont, fontSize: 0.9.rem, color: onSurfaceVariant),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.details').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
