import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Order of Events" — a vertical timeline of the wedding day.
///
/// Edit the [scheduleItems] list in `lib/constants/wedding_data.dart`.
class ScheduleSection extends StatelessComponent {
  const ScheduleSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'day', classes: 'schedule', [
      const SectionHeading(kicker: scheduleKicker, title: scheduleTitle),
      div(classes: 'schedule-list', [
        for (var i = 0; i < scheduleItems.length; i++)
          div(
            classes: 'schedule-row',
            attributes: {'data-scroll': '', 'data-scroll-delay': '${(i % 6) + 1}'},
            [
              div(classes: 'schedule-time', [.text(scheduleItems[i].time)]),
              div(classes: 'schedule-rail', [div(classes: 'schedule-dot', [])]),
              div(classes: 'schedule-body', [
                h4([.text(scheduleItems[i].title)]),
                span(classes: 'schedule-place', [.text(scheduleItems[i].place)]),
                p([.text(scheduleItems[i].description)]),
              ]),
            ],
          ),
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
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
      ),
      css('.schedule-list').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
        maxWidth: 46.rem,
        margin: .only(top: 3.5.rem),
      ),
      css('.schedule-row').styles(
        display: .flex,
        alignItems: .start,
        gap: Gap.column(1.5.rem),
        padding: .symmetric(vertical: 1.5.rem),
      ),
      css('.schedule-time').styles(
        width: 5.5.rem,
        flex: Flex(shrink: 0),
        padding: .only(top: 0.2.rem),
        fontFamily: bodyFont,
        fontSize: 0.76.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        textTransform: .upperCase,
        textAlign: .right,
        color: primaryColor,
      ),
      // Thin vertical rail with a ring marker per entry.
      css('.schedule-rail', [
        css('&').styles(
          position: .relative(),
          width: 1.px,
          flex: Flex(shrink: 0),
          alignSelf: .stretch,
          backgroundColor: outlineVariant,
        ),
        css('.schedule-dot').styles(
          position: .absolute(top: 0.5.rem),
          width: 0.62.rem,
          height: 0.62.rem,
          radius: .all(.circular(999.px)),
          backgroundColor: surface,
          border: Border.all(color: primaryColor, width: 1.px),
          raw: const {'left': '50%', 'transform': 'translateX(-50%)'},
        ),
      ]),
      css('.schedule-body', [
        css('&').styles(
          display: .flex,
          flexDirection: .column,
          alignItems: .start,
          gap: Gap.column(0.35.rem),
        ),
        css('h4').styles(
          fontFamily: headingFont,
          fontSize: 1.5.rem,
          fontWeight: .w500,
          lineHeight: 1.2.em,
          color: onSurface,
        ),
        css('.schedule-place').styles(
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: secondaryColor,
        ),
        css('p').styles(
          margin: .zero,
          fontFamily: bodyFont,
          fontSize: 0.94.rem,
          lineHeight: 1.65.em,
          color: onSurfaceVariant,
        ),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.schedule').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.schedule-row').styles(gap: Gap.column(1.rem)),
      css('.schedule-time').styles(width: 4.rem, fontSize: 0.68.rem, letterSpacing: 1.2.px),
    ]),
  ];
}
