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
        padding: .symmetric(vertical: 6.rem, horizontal: 1.5.rem),
        backgroundColor: gardenGreenDark,
        textAlign: .center,
      ),
      css('.rsvp-note').styles(
        margin: .only(top: 1.rem, bottom: 2.5.rem),
        maxWidth: 500.px,
        fontFamily: bodyFont,
        fontSize: 1.rem,
        lineHeight: 1.6.em,
        color: const Color('#E7EEDF'),
      ),
    ]),
    css('.rsvp-form', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.all(1.rem),
        width: 100.percent,
        maxWidth: 480.px,
      ),
      css('.rsvp-row').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: Gap.all(1.rem),
      ),
      css('input, select, textarea', [
        css('&').styles(
          flex: Flex(grow: 1, basis: 160.px),
          padding: .symmetric(vertical: 0.8.rem, horizontal: 1.rem),
          radius: .all(.circular(8.px)),
          border: .unset,
          fontFamily: bodyFont,
          fontSize: 0.95.rem,
          backgroundColor: Colors.white,
          color: gardenInk,
        ),
      ]),
      css('textarea').styles(raw: const {'resize': 'vertical'}),
      css('.rsvp-submit', [
        css('&').styles(
          margin: .only(top: 0.5.rem),
          padding: .symmetric(vertical: 1.rem),
          radius: .all(.circular(30.px)),
          border: .unset,
          backgroundColor: gardenGold,
          color: gardenInk,
          fontFamily: bodyFont,
          fontWeight: .w700,
          letterSpacing: 1.px,
          textTransform: .upperCase,
          cursor: .pointer,
          transition: Transition('opacity', duration: const Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(opacity: 0.85),
      ]),
    ]),
  ];
}
