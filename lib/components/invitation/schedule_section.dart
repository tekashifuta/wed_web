import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// The day-of "Schedule" / order of events section.
///
/// Edit the [scheduleItems] list in `lib/constants/wedding_data.dart` to change entries.
class ScheduleSection extends StatelessComponent {
  const ScheduleSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'schedule', [
      p(classes: 'section-kicker', [.text('Order of the Day')]),
      h2(classes: 'section-title', [.text('Schedule')]),
      div(classes: 'schedule-list', [
        for (final item in scheduleItems)
          div(classes: 'schedule-row', [
            div(classes: 'schedule-time', [.text(item.time)]),
            div(classes: 'schedule-line', []),
            div(classes: 'schedule-body', [
              h4([.text(item.title)]),
              p([.text(item.description)]),
            ]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.schedule', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: gardenCream,
      ),
      css('.schedule-list').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
        maxWidth: 640.px,
        margin: .only(top: 3.rem),
      ),
    ]),
    css('.schedule-row', [
      css('&').styles(
        display: .flex,
        alignItems: .start,
        gap: Gap.column(1.5.rem),
        padding: .symmetric(vertical: 1.2.rem),
        border: .only(bottom: BorderSide.solid(color: const Color('#00000014'), width: 1.px)),
      ),
      css('&:last-child').styles(border: Border.only(bottom: BorderSide.none())),
    ]),
    css('.schedule-time').styles(
      width: 90.px,
      flex: Flex(shrink: 0),
      fontFamily: headingFont,
      fontWeight: .w700,
      fontSize: 1.rem,
      color: gardenGold,
    ),
    css('.schedule-body', [
      css('h4').styles(
        margin: .only(bottom: 0.3.rem),
        fontFamily: bodyFont,
        fontWeight: .w700,
        fontSize: 1.1.rem,
        color: gardenInk,
      ),
      css('p').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.95.rem,
        color: const Color('#6B6E62'),
      ),
    ]),
  ];
}
