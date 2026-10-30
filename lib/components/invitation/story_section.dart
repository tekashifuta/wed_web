import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Our Story" — a portrait next to three numbered milestones.
///
/// Edit the [storyMoments] list in `lib/constants/wedding_data.dart`.
class StorySection extends StatelessComponent {
  const StorySection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'story', classes: 'story', [
      const SectionHeading(kicker: storyKicker, title: storyTitle),
      div(classes: 'story-grid', [
        div(classes: 'story-media', attributes: {'data-scroll': 'left'}, [
          div(classes: 'story-frame', []),
          img(
            classes: 'story-image',
            src: storyImageUrl,
            alt: 'An intimate portrait of the couple',
          ),
        ]),
        div(classes: 'story-moments', [
          for (var i = 0; i < storyMoments.length; i++)
            div(
              classes: 'story-moment',
              attributes: {'data-scroll': 'right', 'data-scroll-delay': '${i + 1}'},
              [
                span(classes: 'story-index', [.text('0${i + 1}')]),
                div(classes: 'story-moment-body', [
                  h3([.text(storyMoments[i].title)]),
                  p([.text(storyMoments[i].body)]),
                ]),
              ],
            ),
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
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainer,
      ),
      css('.story-grid').styles(
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        gap: Gap.all(4.rem),
        width: 100.percent,
        maxWidth: 1060.px,
        margin: .only(top: 3.5.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.story-media').styles(
        position: .relative(),
        flex: Flex(grow: 1, shrink: 1, basis: 360.px),
        maxWidth: 440.px,
      ),
      // Offset hairline frame behind the portrait.
      css('.story-frame').styles(
        position: Position.absolute(
          top: Unit.rem(-1),
          left: Unit.rem(-1),
          right: Unit.rem(-1),
          bottom: Unit.rem(-1),
        ),
        zIndex: const ZIndex(-1),
        radius: .all(.circular(3.px)),
        border: Border.all(color: primaryFixedDim, width: 1.px),
        transform: Transform.translate(x: Unit.rem(1), y: Unit.rem(1)),
      ),
      css('.story-image').styles(
        display: .block,
        width: 100.percent,
        aspectRatio: const AspectRatio(4, 5),
        radius: .all(.circular(3.px)),
        shadow: ambientShadow,
        raw: const {'object-fit': 'cover'},
      ),
      css('.story-moments').styles(
        flex: Flex(grow: 1, shrink: 1, basis: 420.px),
        display: .flex,
        flexDirection: .column,
        maxWidth: 520.px,
      ),
      css('.story-moment', [
        css('&').styles(
          display: .flex,
          alignItems: .start,
          gap: Gap.column(1.25.rem),
          padding: .symmetric(vertical: 1.6.rem),
          border: .only(bottom: BorderSide.solid(color: outlineVariant, width: 1.px)),
        ),
        css('&:last-child').styles(border: Border.only(bottom: BorderSide.none())),
      ]),
      css('.story-index').styles(
        width: 1.8.rem,
        flex: Flex(shrink: 0),
        padding: .only(top: 0.55.rem),
        fontFamily: bodyFont,
        fontSize: 0.68.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        color: primaryColor,
      ),
      css('.story-moment-body', [
        css('h3').styles(
          margin: .only(bottom: 0.45.rem),
          fontFamily: headingFont,
          fontSize: 1.75.rem,
          fontWeight: .w500,
          lineHeight: 1.2.em,
          color: onSurface,
        ),
        css('p').styles(
          margin: .zero,
          fontFamily: bodyFont,
          fontSize: 0.96.rem,
          fontWeight: .w400,
          lineHeight: 1.7.em,
          color: onSurfaceVariant,
        ),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 760.px), [
      css('.story').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.story-grid').styles(flexDirection: .column, gap: Gap.all(2.75.rem)),
      css('.story-media').styles(width: 100.percent, maxWidth: 22.rem),
      css('.story-moments').styles(width: 100.percent),
    ]),
  ];
}
