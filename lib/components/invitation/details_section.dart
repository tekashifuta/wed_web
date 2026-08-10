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
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: gardenBlush,
      ),
      css('.details-cards').styles(
        display: .flex,
        flexWrap: .wrap,
        justifyContent: .center,
        gap: Gap.all(2.rem),
        margin: .only(top: 3.rem),
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
        radius: .all(.circular(16.px)),
        backgroundColor: Colors.white,
        shadow: BoxShadow(offsetX: 0.px, offsetY: 10.px, blur: 30.px, color: const Color('rgba(60,50,30,0.12)')),
        textAlign: .center,
      ),
      css('.details-icon').styles(margin: .only(bottom: 0.8.rem), fontSize: 2.2.rem),
      css('h3').styles(margin: .only(bottom: 0.6.rem), fontFamily: headingFont, fontSize: 1.5.rem, color: gardenGreenDark),
      css('.details-time').styles(
        margin: .only(bottom: 0.6.rem),
        fontFamily: scriptFont,
        fontSize: 1.5.rem,
        color: gardenGold,
      ),
      css('.details-venue').styles(margin: .only(bottom: 0.2.rem), fontFamily: bodyFont, fontWeight: .w700, fontSize: 1.rem),
      css('.details-address').styles(margin: .zero, fontFamily: bodyFont, fontSize: 0.9.rem, color: const Color('#6B6E62')),
    ]),
  ];
}
