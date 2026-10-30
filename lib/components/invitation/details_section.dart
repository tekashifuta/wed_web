import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Where" — the ceremony & reception cards, each with a Get Directions link.
class DetailsSection extends StatelessComponent {
  const DetailsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'details', classes: 'details', [
      const SectionHeading(kicker: detailsKicker, title: detailsTitle),
      div(classes: 'details-cards', [
        _card(
          icon: '💍',
          title: 'Ceremony',
          time: ceremonyTime,
          venue: ceremonyVenue,
          address: ceremonyAddress,
          mapUrl: ceremonyMapUrl,
          delay: '3',
        ),
        _card(
          icon: '🥂',
          title: 'Reception',
          time: receptionTime,
          venue: receptionVenue,
          address: receptionAddress,
          mapUrl: receptionMapUrl,
          delay: '4',
        ),
      ]),
    ]);
  }

  Component _card({
    required String icon,
    required String title,
    required String time,
    required String venue,
    required String address,
    required String mapUrl,
    required String delay,
  }) {
    return div(classes: 'details-card', attributes: {'data-scroll': '', 'data-scroll-delay': delay}, [
      div(classes: 'details-icon', [.text(icon)]),
      h3([.text(title)]),
      p(classes: 'details-time', [.text(time)]),
      p(classes: 'details-venue', [.text(venue)]),
      p(classes: 'details-address', [.text(address)]),
      a(href: mapUrl, target: Target.blank, classes: 'details-map', [
        .text('Get Directions'),
        span(classes: 'details-map-arrow', [.text('→')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.details', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainer,
      ),
      css('.details-cards').styles(
        display: .flex,
        justifyContent: .center,
        gap: Gap.all(1.75.rem),
        width: 100.percent,
        maxWidth: 56.rem,
        margin: .only(top: 3.5.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
    ]),
    css('.details-card', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 20.rem,
        padding: .symmetric(vertical: 2.75.rem, horizontal: 2.25.rem),
        radius: .all(.circular(3.px)),
        backgroundColor: const Color('#ffffff'),
        border: Border.all(color: outlineVariant, width: 1.px),
        shadow: ambientShadow,
        textAlign: .center,
      ),
      css('.details-icon').styles(margin: .only(bottom: 1.rem), fontSize: 1.5.rem, lineHeight: 1.em, opacity: 0.9),
      css('h3').styles(
        margin: .only(bottom: 1.25.rem),
        fontFamily: bodyFont,
        fontSize: 0.7.rem,
        fontWeight: .w500,
        letterSpacing: 4.px,
        textTransform: .upperCase,
        color: primaryColor,
      ),
      css('.details-time').styles(
        margin: .only(bottom: 0.75.rem),
        fontFamily: headingFont,
        fontSize: 1.9.rem,
        color: onSurface,
      ),
      css('.details-venue').styles(
        margin: .only(bottom: 0.35.rem),
        fontFamily: headingFont,
        fontSize: 1.3.rem,
        color: onSurface,
      ),
      css('.details-address').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.88.rem,
        lineHeight: 1.6.em,
        color: onSurfaceVariant,
      ),
      css('.details-map', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: Gap.column(0.5.rem),
          margin: .only(top: 1.75.rem),
          padding: .symmetric(vertical: 0.65.rem, horizontal: 1.5.rem),
          radius: .all(.circular(999.px)),
          border: Border.all(color: primaryColor, width: 1.px),
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          color: primaryColor,
          textDecoration: TextDecoration(line: .none),
          transition: const Transition('background-color, color', duration: Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(backgroundColor: primaryColor, color: onPrimary),
        css('.details-map-arrow').styles(fontSize: 0.9.rem, lineHeight: 1.em),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.details').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.details-card').styles(width: 100.percent, padding: .symmetric(vertical: 2.25.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
