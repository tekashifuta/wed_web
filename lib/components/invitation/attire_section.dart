import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "The Printed Invitation" — dress code, colour palette and attire guide.
class AttireSection extends StatelessComponent {
  const AttireSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'attire', classes: 'attire', [
      const SectionHeading(kicker: attireKicker, title: attireTitle),
      div(classes: 'attire-code', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '3'}, [
        span(classes: 'attire-code-value', [.text(dressCode)]),
        p(classes: 'attire-code-note', [.text(dressCodeNote)]),
      ]),
      div(classes: 'attire-palette', [
        for (var i = 0; i < attirePalette.length; i++)
          div(
            classes: 'attire-swatch',
            attributes: {'data-scroll': 'scale', 'data-scroll-delay': '${(i % 6) + 1}'},
            [
              span(
                classes: 'attire-swatch-dot',
                styles: Styles(backgroundColor: Color(attirePalette[i].hex)),
                [],
              ),
              span(classes: 'attire-swatch-name', [.text(attirePalette[i].name)]),
            ],
          ),
      ]),
      p(classes: 'attire-palette-note', attributes: {'data-scroll': ''}, [.text(attirePaletteNote)]),
      div(classes: 'attire-guide', [
        div(classes: 'attire-guide-card', attributes: {'data-scroll': 'left'}, [
          h3([.text('Ladies')]),
          p([.text(attireLadies)]),
        ]),
        div(classes: 'attire-guide-card', attributes: {'data-scroll': 'right'}, [
          h3([.text('Gentlemen')]),
          p([.text(attireGentlemen)]),
        ]),
      ]),
      p(classes: 'attire-note', attributes: {'data-scroll': ''}, [.text(attireNote)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.attire', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: accentContainer,
      ),
      css('.attire-code').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        margin: .only(top: 3.rem),
      ),
      css('.attire-code-value').styles(
        fontFamily: headingFont,
        fontSize: 3.1.rem,
        fontWeight: .w500,
        lineHeight: 1.1.em,
        color: onSurface,
      ),
      css('.attire-code-note').styles(
        margin: .only(top: 0.75.rem),
        maxWidth: 30.rem,
        fontFamily: bodyFont,
        fontSize: 0.94.rem,
        lineHeight: 1.7.em,
        textAlign: .center,
        color: onAccentContainer,
      ),
      css('.attire-palette').styles(
        display: .flex,
        alignItems: .start,
        justifyContent: .center,
        gap: Gap.all(2.rem),
        margin: .only(top: 3.5.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.attire-swatch').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        gap: Gap.column(0.75.rem),
      ),
      css('.attire-swatch-dot').styles(
        display: .block,
        width: 3.25.rem,
        height: 3.25.rem,
        radius: .all(.circular(999.px)),
        border: Border.all(color: Color('rgba(51, 46, 42, 0.12)'), width: 1.px),
        shadow: softShadow,
      ),
      css('.attire-swatch-name').styles(
        fontFamily: bodyFont,
        fontSize: 0.62.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        textTransform: .upperCase,
        color: onSurfaceVariant,
      ),
      css('.attire-palette-note').styles(
        margin: .only(top: 2.25.rem),
        fontFamily: headingFont,
        fontSize: 1.25.rem,
        fontStyle: .italic,
        color: onSurface,
      ),
      css('.attire-guide').styles(
        display: .flex,
        justifyContent: .center,
        gap: Gap.all(1.5.rem),
        width: 100.percent,
        maxWidth: 52.rem,
        margin: .only(top: 3.5.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.attire-guide-card', [
        css('&').styles(
          flex: Flex(grow: 1, shrink: 1, basis: 18.rem),
          padding: .symmetric(vertical: 2.25.rem, horizontal: 2.rem),
          radius: .all(.circular(3.px)),
          backgroundColor: const Color('rgba(255, 255, 255, 0.72)'),
          border: Border.all(color: Color('rgba(51, 46, 42, 0.08)'), width: 1.px),
          textAlign: .center,
        ),
        css('h3').styles(
          margin: .only(bottom: 1.rem),
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: primaryColor,
        ),
        css('p').styles(
          margin: .zero,
          fontFamily: headingFont,
          fontSize: 1.28.rem,
          lineHeight: 1.5.em,
          color: onSurface,
        ),
      ]),
      css('.attire-note').styles(
        margin: .only(top: 3.rem),
        maxWidth: 30.rem,
        fontFamily: bodyFont,
        fontSize: 0.82.rem,
        fontWeight: .w400,
        letterSpacing: 0.5.px,
        textAlign: .center,
        color: onAccentContainer,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.attire').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.attire-code-value').styles(fontSize: 2.4.rem),
      css('.attire-palette').styles(gap: Gap.all(1.35.rem)),
      css('.attire-swatch-dot').styles(width: 2.75.rem, height: 2.75.rem),
    ]),
  ];
}
