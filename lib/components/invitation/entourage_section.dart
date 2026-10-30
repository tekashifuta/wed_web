import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "The Entourage" — the wedding party grouped by role.
///
/// Edit the [entourageGroups] list in `lib/constants/wedding_data.dart`.
class EntourageSection extends StatelessComponent {
  const EntourageSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'entourage', classes: 'entourage', [
      const SectionHeading(kicker: entourageKicker, title: entourageTitle),
      div(classes: 'entourage-grid', [
        for (var i = 0; i < entourageGroups.length; i++)
          div(
            classes: 'entourage-group',
            attributes: {'data-scroll': '', 'data-scroll-delay': '${(i % 6) + 1}'},
            [
              h3([.text(entourageGroups[i].title)]),
              div(classes: 'entourage-members', [
                for (final member in entourageGroups[i].members) p([.text(member)]),
              ]),
            ],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.entourage', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainer,
      ),
      css('.entourage-grid').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(2.75.rem),
        width: 100.percent,
        maxWidth: 62.rem,
        margin: .only(top: 3.5.rem),
      ),
      css('.entourage-group', [
        css('&').styles(
          display: .flex,
          flexDirection: .column,
          alignItems: .center,
          textAlign: .center,
        ),
        css('h3').styles(
          margin: .only(bottom: 1.15.rem),
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: primaryColor,
        ),
        css('.entourage-members').styles(
          display: .flex,
          flexDirection: .column,
          gap: Gap.column(0.45.rem),
        ),
        css('.entourage-members p').styles(
          margin: .zero,
          fontFamily: headingFont,
          fontSize: 1.25.rem,
          fontWeight: .w400,
          lineHeight: 1.4.em,
          color: onSurface,
        ),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 760.px), [
      css('.entourage').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.entourage-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
        gap: Gap.all(2.25.rem),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.entourage-grid').styles(
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
  ];
}
