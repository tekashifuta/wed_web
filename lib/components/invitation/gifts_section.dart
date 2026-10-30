import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "A note on gifts" — tabbed account details with copy-to-clipboard buttons.
///
/// Tab/panel switching and copying are handled by the inline script in
/// `pages/invitation.dart` via the `data-gift-tab`, `data-gift-panel` and
/// `data-copy` attributes.
class GiftsSection extends StatelessComponent {
  const GiftsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'gifts', classes: 'gifts', [
      const SectionHeading(kicker: giftsKicker, title: giftsTitle),
      p(classes: 'gifts-note', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, [
        .text(giftsNote),
      ]),
      div(classes: 'gifts-card', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '4'}, [
        div(classes: 'gifts-tabs', [
          for (var i = 0; i < giftAccounts.length; i++)
            button(
              classes: i == 0 ? 'gifts-tab active' : 'gifts-tab',
              attributes: {'data-gift-tab': '$i', 'type': 'button'},
              [.text(giftAccounts[i].label)],
            ),
        ]),
        for (var i = 0; i < giftAccounts.length; i++)
          div(
            classes: i == 0 ? 'gifts-panel active' : 'gifts-panel',
            attributes: {'data-gift-panel': '$i'},
            [
              p(classes: 'gifts-holder', [.text(giftAccounts[i].holder)]),
              div(classes: 'gifts-row', [
                span(classes: 'gifts-number', [.text(giftAccounts[i].number)]),
                button(
                  classes: 'gifts-copy',
                  attributes: {
                    'data-copy': giftAccounts[i].number,
                    'data-label': 'Copy',
                    'type': 'button',
                  },
                  [.text('Copy')],
                ),
              ]),
            ],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.gifts', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
      ),
      css('.gifts-note').styles(
        margin: .only(top: 1.25.rem),
        maxWidth: 34.rem,
        fontFamily: bodyFont,
        fontSize: 0.98.rem,
        fontWeight: .w400,
        lineHeight: 1.75.em,
        textAlign: .center,
        color: onSurfaceVariant,
      ),
      css('.gifts-card').styles(
        margin: .only(top: 2.75.rem),
        width: 100.percent,
        maxWidth: 30.rem,
        padding: .all(2.25.rem),
        radius: .all(.circular(3.px)),
        backgroundColor: const Color('#ffffff'),
        border: Border.all(color: outlineVariant, width: 1.px),
        shadow: ambientShadow,
      ),
      css('.gifts-tabs').styles(
        display: .flex,
        gap: Gap.column(0.35.rem),
        padding: .all(0.3.rem),
        margin: .only(bottom: 2.rem),
        radius: .all(.circular(999.px)),
        backgroundColor: surfaceContainer,
      ),
      css('.gifts-tab', [
        css('&').styles(
          flex: Flex(grow: 1),
          padding: .symmetric(vertical: 0.7.rem, horizontal: 1.rem),
          radius: .all(.circular(999.px)),
          backgroundColor: const Color('rgba(255, 255, 255, 0)'),
          fontFamily: bodyFont,
          fontSize: 0.7.rem,
          fontWeight: .w500,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          color: onSurfaceVariant,
          cursor: .pointer,
          transition: const Transition('background-color, color', duration: Duration(milliseconds: 200)),
          raw: const {'border': 'none'},
        ),
        css('&.active').styles(backgroundColor: const Color('#ffffff'), color: primaryColor, shadow: softShadow),
      ]),
      css('.gifts-panel', [
        css('&').styles(
          display: .none,
          flexDirection: .column,
          alignItems: .center,
          gap: Gap.column(1.1.rem),
        ),
        css('&.active').styles(display: .flex),
      ]),
      css('.gifts-holder').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 1.4.rem,
        color: onSurface,
      ),
      css('.gifts-row').styles(
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        gap: Gap.column(1.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.gifts-number').styles(
        fontFamily: bodyFont,
        fontSize: 1.rem,
        letterSpacing: 1.px,
        color: onSurfaceVariant,
      ),
      css('.gifts-copy', [
        css('&').styles(
          padding: .symmetric(vertical: 0.6.rem, horizontal: 1.4.rem),
          radius: .all(.circular(999.px)),
          border: Border.all(color: primaryColor, width: 1.px),
          backgroundColor: const Color('rgba(138, 107, 64, 0)'),
          fontFamily: bodyFont,
          fontSize: 0.66.rem,
          fontWeight: .w500,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          color: primaryColor,
          cursor: .pointer,
          transition: const Transition('background-color, color', duration: Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(backgroundColor: primaryColor, color: onPrimary),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.gifts').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.gifts-card').styles(padding: .all(1.5.rem)),
    ]),
  ];
}
