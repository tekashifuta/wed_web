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
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: const Color('#ffffff'),
      ),
      css('.story-timeline').styles(
        display: .flex,
        flexDirection: .column,
        maxWidth: 720.px,
        width: 100.percent,
        margin: .only(top: 3.5.rem),
      ),
    ]),
    css('.story-item', [
      css('&').styles(
        position: .relative(),
        display: .flex,
        gap: Gap.column(1.5.rem),
        padding: .only(bottom: 3.5.rem, left: 3.5.rem),
        border: .only(left: BorderSide.solid(color: outlineVariant, width: 1.px)),
      ),
      css('&:last-child').styles(padding: .only(left: 3.5.rem)),
    ]),
    // Sage diamond bullet (Design.md: custom list markers, never standard circles).
    css('.story-dot').styles(
      position: Position.absolute(left: Unit.pixels(-5), top: 0.45.rem),
      width: 11.px,
      height: 11.px,
      backgroundColor: primaryColor,
      transform: Transform.rotate(45.deg),
    ),
    css('.story-year').styles(
      position: Position.absolute(left: Unit.pixels(-84), top: Unit.rem(-0.3)),
      width: 62.px,
      fontFamily: headingFont,
      fontWeight: .w700,
      fontSize: 1.05.rem,
      color: primaryColor,
      textAlign: .right,
    ),
    css('.story-body', [
      css('h3').styles(
        margin: .only(bottom: 0.5.rem),
        fontFamily: headingFont,
        fontSize: 1.4.rem,
        color: onSurface,
      ),
      css('p').styles(
        margin: .zero,
        fontFamily: bodyFont,
        fontSize: 1.rem,
        lineHeight: 1.65.em,
        color: onSurfaceVariant,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.story-year').styles(display: .none),
      css('.story-item').styles(padding: .only(bottom: 2.5.rem, left: 2.2.rem)),
      css('.story').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
