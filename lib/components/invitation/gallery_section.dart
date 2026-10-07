import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// A simple photo grid gallery.
///
/// Replace the URLs in [galleryImages] (`lib/constants/wedding_data.dart`) with your own photos.
class GallerySection extends StatelessComponent {
  const GallerySection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'gallery', [
      p(classes: 'section-kicker', attributes: {'data-scroll': '', 'data-scroll-delay': '1'}, [.text('Moments')]),
      h2(classes: 'section-title', attributes: {'data-scroll': '', 'data-scroll-delay': '2'}, [.text('Our Gallery')]),
      div(classes: 'gallery-grid', [
        for (var i = 0; i < galleryImages.length; i++)
          div(
            classes: 'gallery-item',
            attributes: {'data-scroll': 'scale', 'data-scroll-delay': '${(i % 6) + 1}'},
            [img(src: galleryImages[i], alt: 'Gallery photo')],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.gallery', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: const Color('#ffffff'),
      ),
      css('.gallery-grid').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
        gap: Gap.all(1.25.rem),
        width: 100.percent,
        maxWidth: 1040.px,
        margin: .only(top: 3.5.rem),
      ),
    ]),
    css('.gallery-item', [
      css('&').styles(
        overflow: .clip,
        radius: .all(.circular(8.px)),
        aspectRatio: const AspectRatio(1),
        border: Border.all(color: outlineVariant, width: 1.px),
      ),
      css('img').styles(
        width: 100.percent,
        height: 100.percent,
        transition: Transition('transform', duration: const Duration(milliseconds: 400)),
        raw: const {'object-fit': 'cover'},
      ),
      css('&:hover img').styles(transform: Transform.scale(1.06)),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.gallery-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.gallery').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
