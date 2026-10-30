import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "A few reminders" — three note cards on a dark band.
class RemindersSection extends StatelessComponent {
  const RemindersSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'reminders', classes: 'reminders', [
      const SectionHeading(kicker: remindersKicker, title: remindersTitle, light: true),
      div(classes: 'reminders-grid', [
        for (var i = 0; i < reminderItems.length; i++)
          div(
            classes: 'reminder-card',
            attributes: {'data-scroll': '', 'data-scroll-delay': '${i + 1}'},
            [
              span(classes: 'reminder-index', [.text('0${i + 1}')]),
              h3([.text(reminderItems[i].title)]),
              p([.text(reminderItems[i].body)]),
            ],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.reminders', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: inverseSurface,
      ),
      css('.reminders-grid').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(1.75.rem),
        width: 100.percent,
        maxWidth: 60.rem,
        margin: .only(top: 3.5.rem),
      ),
      css('.reminder-card').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: Gap.column(0.75.rem),
        padding: .symmetric(vertical: 2.25.rem, horizontal: 2.rem),
        radius: .all(.circular(3.px)),
        border: Border.all(color: Color('rgba(201, 174, 126, 0.25)'), width: 1.px),
        backgroundColor: Color('rgba(246, 239, 230, 0.04)'),
      ),
      css('.reminder-index').styles(
        fontFamily: bodyFont,
        fontSize: 0.66.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        color: primaryFixedDim,
      ),
      css('.reminder-card h3').styles(
        fontFamily: headingFont,
        fontSize: 1.5.rem,
        fontWeight: .w500,
        lineHeight: 1.25.em,
        color: inverseOnSurface,
      ),
      css('.reminder-card p').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 0.9.rem,
        fontWeight: .w400,
        lineHeight: 1.7.em,
        color: const Color('rgba(246, 239, 230, 0.7)'),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 860.px), [
      css('.reminders-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.reminders').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.reminders-grid').styles(
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
  ];
}
