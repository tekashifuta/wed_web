import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';
import 'section_heading.dart';

/// "Will you join us?" — the per-guest response form.
///
/// Choice buttons (`data-choice`) and the completion counter are wired up by
/// the inline script in `pages/invitation.dart`.
class RsvpSection extends StatelessComponent {
  const RsvpSection({super.key});

  @override
  Component build(BuildContext context) {
    final total = rsvpGuests.length;

    return div(id: 'rsvp', classes: 'rsvp', [
      const SectionHeading(kicker: rsvpKicker, title: rsvpTitle),
      p(classes: 'rsvp-note', attributes: {'data-scroll': '', 'data-scroll-delay': '3'}, [
        .text('Kindly respond by $rsvpDeadline'),
      ]),
      form(classes: 'rsvp-card', attributes: {'data-scroll': 'scale', 'data-scroll-delay': '4'}, [
        h3(classes: 'rsvp-question', [.text(rsvpQuestion)]),
        for (var i = 0; i < rsvpGuests.length; i++)
          div(classes: 'rsvp-guest', [
            div(classes: 'rsvp-guest-head', [
              span(classes: 'rsvp-guest-name', [.text(rsvpGuests[i].name)]),
              if (rsvpGuests[i].allowance case final allowance?)
                span(classes: 'rsvp-guest-note', [.text(allowance)]),
            ]),
            div(classes: 'rsvp-choices', attributes: {'data-choice-group': ''}, [
              button(
                classes: 'rsvp-choice',
                attributes: {'data-choice': 'yes', 'type': 'button'},
                [.text(rsvpAcceptsLabel)],
              ),
              button(
                classes: 'rsvp-choice',
                attributes: {'data-choice': 'no', 'type': 'button'},
                [.text(rsvpDeclinesLabel)],
              ),
            ]),
          ]),
        label(classes: 'rsvp-message-label', [.text(rsvpMessageLabel)]),
        textarea(
          name: 'message',
          rows: 3,
          placeholder: 'A note for the couple',
          attributes: {'data-rsvp-message': ''},
          [],
        ),
        div(classes: 'rsvp-status', attributes: {'data-rsvp-status': ''}, [
          span(classes: 'rsvp-status-count', attributes: {'data-rsvp-count': ''}, [
            .text('0 of $total complete'),
          ]),
          span(classes: 'rsvp-status-hint', attributes: {'data-rsvp-hint': ''}, [
            .text('Choose an answer for each guest.'),
          ]),
        ]),
        button(classes: 'rsvp-submit', attributes: {'type': 'submit'}, [.text(rsvpSubmitLabel)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.rsvp', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        width: 100.percent,
        padding: .symmetric(vertical: 7.rem, horizontal: 1.5.rem),
        backgroundColor: surfaceContainer,
      ),
      css('.rsvp-note').styles(
        margin: .only(top: 1.25.rem),
        fontFamily: headingFont,
        fontSize: 1.25.rem,
        fontStyle: .italic,
        textAlign: .center,
        color: onSurfaceVariant,
      ),
      css('.rsvp-card').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.column(1.6.rem),
        width: 100.percent,
        maxWidth: 34.rem,
        margin: .only(top: 2.75.rem),
        padding: .all(2.5.rem),
        radius: .all(.circular(3.px)),
        backgroundColor: const Color('#ffffff'),
        border: Border.all(color: outlineVariant, width: 1.px),
        shadow: ambientShadow,
      ),
      css('.rsvp-question').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 1.6.rem,
        fontWeight: .w500,
        lineHeight: 1.3.em,
        textAlign: .center,
        color: onSurface,
      ),
      css('.rsvp-guest', [
        css('&').styles(
          display: .flex,
          flexDirection: .column,
          gap: Gap.column(0.9.rem),
          padding: .only(top: 1.5.rem),
          border: .only(top: BorderSide.solid(color: outlineVariant, width: 1.px)),
        ),
        css('&:first-of-type').styles(padding: .zero, border: Border.only(top: BorderSide.none())),
      ]),
      css('.rsvp-guest-head').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.column(0.25.rem),
      ),
      css('.rsvp-guest-name').styles(
        fontFamily: headingFont,
        fontSize: 1.3.rem,
        color: onSurface,
      ),
      css('.rsvp-guest-note').styles(
        fontFamily: bodyFont,
        fontSize: 0.78.rem,
        fontWeight: .w400,
        color: onSurfaceVariant,
      ),
      css('.rsvp-choices').styles(
        display: .flex,
        gap: Gap.all(0.75.rem),
        raw: const {'flex-wrap': 'wrap'},
      ),
      css('.rsvp-choice', [
        css('&').styles(
          flex: Flex(grow: 1, basis: 9.rem),
          padding: .symmetric(vertical: 0.85.rem, horizontal: 1.rem),
          radius: .all(.circular(999.px)),
          border: Border.all(color: outlineVariant, width: 1.px),
          backgroundColor: const Color('rgba(0, 0, 0, 0)'),
          fontFamily: bodyFont,
          fontSize: 0.68.rem,
          fontWeight: .w500,
          letterSpacing: 1.5.px,
          textTransform: .upperCase,
          color: onSurfaceVariant,
          cursor: .pointer,
          transition: const Transition(
            'background-color, color, border-color',
            duration: Duration(milliseconds: 200),
          ),
        ),
        css('&.selected').styles(
          border: Border.all(color: primaryColor, width: 1.px),
          backgroundColor: accentContainer,
          color: primaryColor,
        ),
        css('&[data-choice="no"].selected').styles(
          border: Border.all(color: errorColor, width: 1.px),
          backgroundColor: Color('rgba(169, 59, 59, 0.07)'),
          color: errorColor,
        ),
      ]),
      css('.rsvp-message-label').styles(
        fontFamily: bodyFont,
        fontSize: 0.7.rem,
        fontWeight: .w500,
        letterSpacing: 2.px,
        textTransform: .upperCase,
        color: onSurfaceVariant,
      ),
      css('.rsvp-card textarea', [
        css('&').styles(
          width: 100.percent,
          padding: .symmetric(vertical: 0.9.rem, horizontal: 1.1.rem),
          radius: .all(.circular(3.px)),
          border: Border.all(color: outlineVariant, width: 1.px),
          backgroundColor: surface,
          fontFamily: bodyFont,
          fontSize: 0.92.rem,
          fontWeight: .w400,
          lineHeight: 1.6.em,
          color: onSurface,
          raw: const {'resize': 'vertical'},
        ),
        css('&:focus').styles(
          border: Border.all(color: primaryColor, width: 1.px),
          outline: Outline(style: OutlineStyle.none),
        ),
      ]),
      css('.rsvp-status').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.column(0.25.rem),
        padding: .symmetric(vertical: 0.9.rem, horizontal: 1.1.rem),
        radius: .all(.circular(3.px)),
        backgroundColor: surfaceContainer,
        border: Border.all(color: outlineVariant, width: 1.px),
        transition: const Transition(
          'background-color, border-color',
          duration: Duration(milliseconds: 250),
        ),
      ),
      css('.rsvp-status .rsvp-status-count').styles(
        fontFamily: bodyFont,
        fontSize: 0.78.rem,
        fontWeight: .w500,
        letterSpacing: 1.px,
        color: onSurface,
      ),
      css('.rsvp-status .rsvp-status-hint').styles(
        fontFamily: bodyFont,
        fontSize: 0.76.rem,
        fontWeight: .w400,
        lineHeight: 1.55.em,
        color: onSurfaceVariant,
      ),
      // Completed state — added by the RSVP script.
      css('.rsvp-status.complete').styles(
        backgroundColor: secondaryContainer,
        border: Border.all(color: secondaryColor, width: 1.px),
      ),
      css('.rsvp-status.complete .rsvp-status-count').styles(color: onSecondaryContainer),
      css('.rsvp-submit', [
        css('&').styles(
          padding: .symmetric(vertical: 1.05.rem, horizontal: 1.5.rem),
          radius: .all(.circular(999.px)),
          backgroundColor: primaryColor,
          fontFamily: bodyFont,
          fontSize: 0.72.rem,
          fontWeight: .w500,
          letterSpacing: 3.px,
          textTransform: .upperCase,
          color: onPrimary,
          cursor: .pointer,
          transition: const Transition('opacity', duration: Duration(milliseconds: 200)),
          raw: const {'border': 'none'},
        ),
        css('&:hover').styles(opacity: 0.88),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.rsvp').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.rsvp-card').styles(padding: .symmetric(vertical: 1.75.rem, horizontal: 1.5.rem)),
    ]),
  ];
}
