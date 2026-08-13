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
      div(classes: 'story-grid', [
        div(classes: 'story-text', [
          div(classes: 'story-heading', [
            div(classes: 'story-line', []),
            h2([.text('Our Story')]),
          ]),
          for (final paragraph in storyParagraphs)
            p(classes: 'story-paragraph', [.text(paragraph)]),
        ]),
        div(classes: 'story-image-wrap', [
          div(classes: 'story-accent', []),
          img(classes: 'story-image', src: storyImageUrl, alt: 'Rose and Daryl — an intimate couple photograph'),
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
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: const Color('#ffffff'),
      ),
      css('.story-grid').styles(
        display: .flex,
        flexWrap: .wrap,
        alignItems: .center,
        justifyContent: .spaceBetween,
        gap: Gap.all(3.rem),
        maxWidth: 1120.px,
        width: 100.percent,
      ),
    ]),
    css('.story-text').styles(
      flex: Flex(grow: 1, shrink: 1, basis: 380.px),
    ),
    css('.story-heading', [
      css('&').styles(
        display: .flex,
        alignItems: .center,
        gap: Gap.column(1.rem),
        margin: .only(bottom: 1.75.rem),
      ),
      css('.story-line').styles(
        width: 3.rem,
        height: 1.px,
        backgroundColor: Color('rgba(77, 100, 78, 0.4)'),
      ),
      css('h2').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 2.5.rem,
        lineHeight: 1.2.em,
        color: onSurface,
      ),
    ]),
    css('.story-paragraph').styles(
      margin: .only(bottom: 1.25.rem),
      fontFamily: bodyFont,
      fontSize: 1.05.rem,
      lineHeight: 1.75.em,
      color: onSurfaceVariant,
    ),
    css('.story-image-wrap').styles(
      position: .relative(),
      flex: Flex(grow: 1, shrink: 1, basis: 360.px),
      maxWidth: 460.px,
    ),
    // Blush decorative box offset behind the photo (Design.md tonal layering).
    css('.story-accent').styles(
      position: Position.absolute(
        top: Unit.rem(-1),
        left: Unit.rem(-1),
        right: Unit.rem(-1),
        bottom: Unit.rem(-1),
      ),
      zIndex: const ZIndex(-1),
      radius: .all(.circular(8.px)),
      backgroundColor: Color('rgba(246, 217, 217, 0.3)'),
      transform: Transform.translate(x: Unit.rem(1), y: Unit.rem(1)),
    ),
    css('.story-image').styles(
      display: .block,
      width: 100.percent,
      aspectRatio: const AspectRatio(4, 5),
      radius: .all(.circular(4.px)),
      border: Border.all(color: Color('rgba(195, 200, 191, 0.25)'), width: 1.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 30.px, color: Color('rgba(0, 0, 0, 0.04)')),
      raw: const {'object-fit': 'cover'},
    ),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.story').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.story-grid').styles(flexDirection: .column, gap: Gap.all(2.5.rem)),
      css('.story-image-wrap').styles(order: -1, maxWidth: Unit.unset, width: 100.percent),
      css('.story-heading').styles(margin: .only(bottom: 1.5.rem)),
      css('.story-heading h2').styles(fontSize: 2.rem),
    ]),
  ];
}
