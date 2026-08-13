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
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
      ),
      css('.schedule-list').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
        maxWidth: 680.px,
        margin: .only(top: 3.5.rem),
      ),
    ]),
    css('.schedule-row', [
      css('&').styles(
        display: .flex,
        alignItems: .start,
        gap: Gap.column(1.5.rem),
        padding: .symmetric(vertical: 1.4.rem),
        border: .only(bottom: BorderSide.solid(color: outlineVariant, width: 1.px)),
      ),
      css('&:last-child').styles(border: Border.only(bottom: BorderSide.none())),
    ]),
    css('.schedule-time').styles(
      width: 90.px,
      flex: Flex(shrink: 0),
      fontFamily: headingFont,
      fontWeight: .w700,
      fontSize: 1.05.rem,
      color: primaryColor,
    ),
    css('.schedule-body', [
      css('h4').styles(
        margin: .only(bottom: 0.3.rem),
        fontFamily: bodyFont,
        fontWeight: .w700,
        fontSize: 1.1.rem,
        color: onSurface,
      ),
      css('p').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.95.rem,
        lineHeight: 1.55.em,
        color: onSurfaceVariant,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.schedule').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
