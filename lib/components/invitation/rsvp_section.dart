import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// The RSVP call-to-action section.
///
/// This is a static placeholder form — wire the `onSubmit` handler up to your
/// own backend/email service when you're ready to collect real RSVPs.
class RsvpSection extends StatelessComponent {
  const RsvpSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'rsvp', [
      p(classes: 'section-kicker light', [.text('Join Us')]),
      h2(classes: 'section-title light', [.text('RSVP')]),
      p(classes: 'rsvp-note', [.text('Kindly respond by $rsvpDeadline so we can prepare a seat with your name on it.')]),
      form(classes: 'rsvp-form', [
        div(classes: 'rsvp-row', [
          input(type: InputType.text, name: 'name', attributes: {'placeholder': 'Full Name', 'required': ''}),
          input(type: InputType.email, name: 'email', attributes: {'placeholder': 'Email Address', 'required': ''}),
        ]),
        div(classes: 'rsvp-row', [
          select(name: 'attending', [
            option(value: 'yes', [.text('Joyfully Accepts')]),
            option(value: 'no', [.text('Regretfully Declines')]),
          ]),
          input(type: InputType.number, name: 'guests', attributes: {'placeholder': 'Number of Guests', 'min': '1'}),
        ]),
        textarea(name: 'message', placeholder: 'A message for the couple (optional)', rows: 3, []),
        button(type: ButtonType.submit, classes: 'rsvp-submit', [.text('Send RSVP')]),
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
        padding: .symmetric(vertical: 7.5.rem, horizontal: 1.5.rem),
        backgroundColor: primaryColor,
        textAlign: .center,
      ),
      css('.rsvp-note').styles(
        margin: .only(top: 1.rem, bottom: 2.5.rem),
        maxWidth: 520.px,
        fontFamily: bodyFont,
        fontSize: 1.02.rem,
        lineHeight: 1.7.em,
        color: inverseOnSurface,
        opacity: 0.92,
      ),
    ]),
    css('.rsvp-form', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.all(0.9.rem),
        width: 100.percent,
        maxWidth: 520.px,
        padding: .all(2.rem),
        backgroundColor: const Color('#ffffff'),
        radius: .all(.circular(8.px)),
        border: Border.all(color: onPrimaryContainer, width: 1.px),
        textAlign: .left,
      ),
      css('.rsvp-row').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: Gap.all(0.9.rem),
      ),
      // Flat inputs: 1px outline on the Neutral color, soft radius (Design.md).
      css('input, select, textarea', [
        css('&').styles(
          flex: Flex(grow: 1, basis: 170.px),
          padding: .symmetric(vertical: 0.85.rem, horizontal: 1.1.rem),
          radius: .all(.circular(4.px)),
          border: Border.all(color: Color('rgba(32, 26, 24, 0.2)'), width: 1.px),
          backgroundColor: const Color('#ffffff'),
          fontFamily: bodyFont,
          fontSize: 0.95.rem,
          color: onSurface,
        ),
        css('&:focus').styles(
          border: Border.all(color: primaryColor, width: 1.px),
          outline: Outline(style: OutlineStyle.none),
        ),
      ]),
      css('textarea').styles(raw: const {'resize': 'vertical'}),
      css('.rsvp-submit', [
        css('&').styles(
          margin: .only(top: 0.75.rem),
          padding: .symmetric(vertical: 1.05.rem),
          radius: .all(.circular(4.px)),
          border: Border.all(color: primaryColor, width: 1.px),
          backgroundColor: primaryColor,
          color: onPrimary,
          fontFamily: bodyFont,
          fontWeight: .w700,
          letterSpacing: 2.px,
          textTransform: .upperCase,
          cursor: .pointer,
          transition: Transition('opacity', duration: const Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(opacity: 0.85),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.rsvp').styles(padding: .symmetric(vertical: 4.5.rem, horizontal: 1.5.rem)),
      css('.rsvp-form').styles(padding: .all(1.5.rem)),
    ]),
  ];
}
