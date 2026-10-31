import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Our prenup film" — a poster + play button that opens [prenupVideoUrl].
///
/// Leave `prenupVideoUrl` empty to keep the non-clickable placeholder.
class PrenupSection extends StatelessComponent {
  const PrenupSection({super.key});

  @override
  Component build(BuildContext context) {
    final hasVideo = prenupVideoUrl.isNotEmpty;

    return div(id: 'film', classes: 'prenup', [
      div(classes: 'prenup-inner', [
        const SectionHeading(kicker: prenupKicker, title: prenupTitle, light: true),
        div(classes: 'prenup-player', attributes: {'data-scroll': 'scale'}, [
          img(classes: 'prenup-poster', src: prenupPosterUrl, alt: 'A still from the prenup film'),
          div(classes: 'prenup-veil', []),
          if (hasVideo)
            a(
              href: prenupVideoUrl,
              target: Target.blank,
              classes: 'prenup-play',
              [
                span(classes: 'prenup-play-icon', [.text('▶')]),
                span(classes: 'prenup-play-label', [.text('Play film')]),
              ],
            )
          else
            div(classes: 'prenup-play', [
              span(classes: 'prenup-play-icon', [.text('▶')]),
              span(classes: 'prenup-play-label', [.text('Play film')]),
            ]),
        ]),
        p(classes: 'prenup-caption', attributes: {'data-scroll': ''}, [.text(prenupCaption)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.prenup', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: inverseSurface,
      ),
      css('.prenup-inner').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        maxWidth: 60.rem,
        textAlign: .center,
      ),
      css('.prenup-player').styles(
        position: .relative(),
        margin: .only(top: 3.rem),
        width: 100.percent,
        aspectRatio: const AspectRatio(16, 9),
        radius: .all(.circular(3.px)),
        overflow: .clip,
        border: Border.all(color: Color('rgba(201, 174, 126, 0.35)'), width: 1.px),
        cursor: .pointer,
      ),
      css('.prenup-poster').styles(
        display: .block,
        width: 100.percent,
        height: 100.percent,
        opacity: 0.88,
        raw: const {'object-fit': 'cover'},
      ),
      css('.prenup-veil').styles(
        position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
        raw: const {
          'background':
              'linear-gradient(to top, rgba(58, 52, 47, 0.65) 0%, rgba(58, 52, 47, 0.12) 60%)',
        },
      ),
      css('.prenup-play', [
        css('&').styles(
          position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
          display: .flex,
          flexDirection: .column,
          alignItems: .center,
          justifyContent: .center,
          gap: Gap.column(0.9.rem),
          textDecoration: TextDecoration(line: .none),
          color: inverseOnSurface,
        ),
        css('.prenup-play-icon').styles(
          display: .flex,
          alignItems: .center,
          justifyContent: .center,
          width: 4.5.rem,
          height: 4.5.rem,
          radius: .all(.circular(999.px)),
          border: Border.all(color: Color('rgba(252, 250, 248, 0.7)'), width: 1.px),
          backgroundColor: Color('rgba(58, 52, 47, 0.35)'),
          backdropFilter: Filter.blur(4.px),
          fontSize: 1.05.rem,
          color: inverseOnSurface,
          transition: const Transition('transform, background-color, border-color', duration: Duration(milliseconds: 250)),
        ),
        css('.prenup-play-label').styles(
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: const Color('rgba(252, 250, 248, 0.85)'),
        ),
        css('&:hover .prenup-play-icon').styles(
          transform: Transform.scale(1.08),
          backgroundColor: primaryColor,
          border: Border.all(color: primaryColor, width: 1.px),
        ),
      ]),
      css('.prenup-caption').styles(
        margin: .only(top: 2.rem),
        maxWidth: 34.rem,
        fontFamily: bodyFont,
        fontSize: 0.95.rem,
        fontWeight: .w400,
        lineHeight: 1.7.em,
        color: const Color('rgba(252, 250, 248, 0.72)'),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.prenup').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.prenup-player').styles(aspectRatio: const AspectRatio(4, 3)),
    ]),
  ];
}
