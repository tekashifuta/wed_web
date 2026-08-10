import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/wedding_data.dart';

/// A simple photo grid gallery.
///
/// Replace the URLs in [galleryImages] (`lib/constants/wedding_data.dart`) with your own photos.
class GallerySection extends StatelessComponent {
  const GallerySection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'gallery', [
      p(classes: 'section-kicker', [.text('Moments')]),
      h2(classes: 'section-title', [.text('Our Gallery')]),
      div(classes: 'gallery-grid', [
        for (final url in galleryImages) div(classes: 'gallery-item', [img(src: url, alt: 'Gallery photo')]),
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
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: Colors.white,
      ),
      css('.gallery-grid').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
        gap: Gap.all(1.rem),
        width: 100.percent,
        maxWidth: 960.px,
        margin: .only(top: 3.rem),
      ),
    ]),
    css('.gallery-item', [
      css('&').styles(
        overflow: .clip,
        radius: .all(.circular(12.px)),
        aspectRatio: const AspectRatio(1),
      ),
      css('img').styles(
        width: 100.percent,
        height: 100.percent,
        transition: Transition('transform', duration: const Duration(milliseconds: 400)),
        raw: const {'object-fit': 'cover'},
      ),
      css('&:hover img').styles(transform: Transform.scale(1.08)),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.gallery-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
  ];
}
