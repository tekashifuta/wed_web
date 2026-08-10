import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// "Our Story" timeline section.
///
/// Edit the [storyMoments] list in `lib/constants/wedding_data.dart` to change entries.
class StorySection extends StatelessComponent {
  const StorySection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'story', [
      p(classes: 'section-kicker', [.text('Our Story')]),
      h2(classes: 'section-title', [.text('How It All Began')]),
      div(classes: 'story-timeline', [
        for (final moment in storyMoments)
          div(classes: 'story-item', [
            div(classes: 'story-year', [.text(moment.year)]),
            div(classes: 'story-dot', []),
            div(classes: 'story-body', [
              h3([.text(moment.title)]),
              p([.text(moment.description)]),
            ]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.story', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: Colors.white,
      ),
      css('.story-timeline').styles(
        display: .flex,
        flexDirection: .column,
        maxWidth: 700.px,
        width: 100.percent,
        margin: .only(top: 3.rem),
      ),
    ]),
    css('.story-item', [
      css('&').styles(
        position: .relative(),
        display: .flex,
        gap: Gap.column(1.5.rem),
        padding: .only(bottom: 3.rem, left: 3.rem),
        border: .only(left: BorderSide.solid(color: gardenGold, width: 2.px)),
      ),
      css('&:last-child').styles(padding: .only(left: 3.rem)),
    ]),
    css('.story-dot').styles(
      position: Position.absolute(left: Unit.pixels(-7), top: 0.2.rem),
      width: 12.px,
      height: 12.px,
      radius: .circular(6.px),
      backgroundColor: gardenGold,
    ),
    css('.story-year').styles(
      position: Position.absolute(left: Unit.pixels(-70), top: Unit.rem(-0.3)),
      width: 50.px,
      fontFamily: headingFont,
      fontWeight: .w700,
      fontSize: 1.1.rem,
      color: gardenGreenDark,
      textAlign: .right,
    ),
    css('.story-body', [
      css('h3').styles(
        margin: .only(bottom: 0.4.rem),
        fontFamily: headingFont,
        fontSize: 1.3.rem,
        color: gardenInk,
      ),
      css('p').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 1.rem,
        lineHeight: 1.6.em,
        color: const Color('#5A5D53'),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.story-year').styles(display: .none),
      css('.story-item').styles(padding: .only(bottom: 2.5.rem, left: 1.8.rem)),
    ]),
  ];
}
