import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// The "Photos" wall — a responsive grid of guest & couple photographs.
///
/// Replace the URLs in [galleryImages] (`lib/constants/wedding_data.dart`).
class GallerySection extends StatelessComponent {
  const GallerySection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'photos', classes: 'photos', [
      const SectionHeading(kicker: photosKicker, title: photosTitle),
      div(classes: 'photos-grid', [
        for (var i = 0; i < galleryImages.length; i++)
          div(
            classes: 'photos-item',
            attributes: {'data-scroll': 'scale', 'data-scroll-delay': '${(i % 6) + 1}'},
            [img(src: galleryImages[i], alt: 'A photograph from the wedding')],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.photos', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
      ),
      css('.photos-grid').styles(
        display: .grid,
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(1.25.rem),
        width: 100.percent,
        maxWidth: 62.rem,
        margin: .only(top: 3.5.rem),
      ),
      css('.photos-item', [
        css('&').styles(
          overflow: .clip,
          radius: .all(.circular(3.px)),
          aspectRatio: const AspectRatio(1),
          border: Border.all(color: outlineVariant, width: 1.px),
        ),
        css('img').styles(
          display: .block,
          width: 100.percent,
          height: 100.percent,
          transition: Transition('transform', duration: const Duration(milliseconds: 500)),
          raw: const {'object-fit': 'cover'},
        ),
        css('&:hover img').styles(transform: Transform.scale(1.06)),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.photos-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.photos').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
