import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Good to know" — an accordion of frequently asked questions.
///
/// The `data-accordion` attribute is wired up by the inline script in
/// `pages/invitation.dart`, which toggles the `.open` class.
class FaqSection extends StatelessComponent {
  const FaqSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'faq', classes: 'faq', [
      const SectionHeading(kicker: faqKicker, title: faqTitle),
      div(classes: 'faq-list', [
        for (var i = 0; i < faqItems.length; i++)
          div(
            classes: 'faq-item',
            attributes: {
              'data-accordion': '',
              'data-scroll': '',
              'data-scroll-delay': '${(i % 6) + 1}',
            },
            [
              button(classes: 'faq-question', attributes: {'type': 'button'}, [
                span([.text(faqItems[i].question)]),
                span(classes: 'faq-chevron', [.text('+')]),
              ]),
              div(classes: 'faq-answer', [p([.text(faqItems[i].answer)])]),
            ],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.faq', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surface,
      ),
      css('.faq-list').styles(
        display: .flex,
        flexDirection: .column,
        width: 100.percent,
        maxWidth: 44.rem,
        margin: .only(top: 3.5.rem),
      ),
      css('.faq-item', [
        css('&').styles(
          border: .only(bottom: BorderSide.solid(color: outlineVariant, width: 1.px)),
        ),
        css('.faq-question').styles(
          display: .flex,
          alignItems: .center,
          justifyContent: .spaceBetween,
          gap: Gap.column(1.5.rem),
          width: 100.percent,
          padding: .symmetric(vertical: 1.5.rem),
          backgroundColor: const Color('rgba(0, 0, 0, 0)'),
          fontFamily: headingFont,
          fontSize: 1.4.rem,
          fontWeight: .w500,
          lineHeight: 1.3.em,
          textAlign: .left,
          color: onSurface,
          cursor: .pointer,
          raw: const {'border': 'none'},
        ),
        css('.faq-chevron').styles(
          flex: Flex(shrink: 0),
          fontFamily: bodyFont,
          fontSize: 1.15.rem,
          lineHeight: 1.em,
          color: primaryColor,
          transition: const Transition('transform', duration: Duration(milliseconds: 250)),
        ),
        css('.faq-answer').styles(
          maxHeight: 0.px,
          opacity: 0,
          overflow: .hidden,
          transition: const Transition(
            'max-height, opacity',
            duration: Duration(milliseconds: 350),
            curve: Curve.easeInOut,
          ),
        ),
        css('.faq-answer p').styles(
          margin: .only(bottom: 1.5.rem),
          padding: .only(right: 2.rem),
          fontFamily: bodyFont,
          fontSize: 0.94.rem,
          fontWeight: .w400,
          lineHeight: 1.7.em,
          color: onSurfaceVariant,
        ),
        // Open state — toggled by the accordion script.
        css('&.open .faq-answer').styles(maxHeight: 30.rem, opacity: 1),
        css('&.open .faq-chevron').styles(raw: const {'transform': 'rotate(45deg)'}),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.faq').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.faq-item .faq-question').styles(fontSize: 1.2.rem),
    ]),
  ];
}
