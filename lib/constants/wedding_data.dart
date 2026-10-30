// -----------------------------------------------------------------------
// 🌹 Wedding Invitation Content
//
// This file holds ALL the editable text/content for the invitation page.
// Change the values below — you don't need to touch any other file to
// update the couple's names, date, venues, story, entourage, gifts,
// dress code, FAQ, RSVP guests, gallery or footer.
// -----------------------------------------------------------------------

// -- The couple ---------------------------------------------------------

/// The bride & groom's first names, shown big in the hero section.
const brideName = 'Rose';
const groomName = 'Daryl';

/// Shown as "Rose & Daryl".
String get coupleNames => '$brideName & $groomName';

/// Monogram used on the cover screen and in the navigation bar.
const monogram = 'R & D';

/// Compact monogram (used in the round cover seal).
const monogramShort = 'RD';

// -- Dates --------------------------------------------------------------

const weddingWeekday = 'Saturday';
const weddingDateFull = 'September 12, 2026';

/// Dotted short date shown under the names on the cover.
const weddingDateShort = '12 · 09 · 2026';

/// Local date-time used by the live countdown on the hero.
/// Format: `YYYY-MM-DDTHH:MM:SS` (interpreted in the visitor's timezone).
const weddingDateTimeIso = '2026-09-12T16:00:00';

/// The date guests must reply by.
const rsvpDeadline = 'November 1st, 2026';

// -- Cover screen -------------------------------------------------------

const coverKicker = 'You are cordially invited to the wedding of';
const coverCta = 'Tap to open';
const coverSkipLabel = 'Skip';

// -- Hero ---------------------------------------------------------------

const heroInvitationLabel = 'Wedding Invitation';
const heroChurchName = 'The Garden Chapel';
const heroVenueName = 'The Botanical Gardens';
const heroImageUrl = 'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=1920&q=80';

/// Labels for the live countdown on the hero.
const countdownLabels = ['Days', 'Hours', 'Mins', 'Secs'];

// -- Intro --------------------------------------------------------------

const introParagraph =
    'We are celebrating our wedding with our favorite people. Join us for '
    'heartfelt vows, garden dinner, and a night of stories.';

// -- Our Story ----------------------------------------------------------

const storyKicker = 'Our Story';
const storyTitle = 'Our Story';

/// The three milestones shown as cards. Add or remove entries freely.
const storyMoments = <({String title, String body})>[
  (
    title: 'How we met',
    body: 'A rainy afternoon in the city, one shared umbrella, and a very long walk.',
  ),
  (
    title: 'The years between',
    body: 'Two cities, countless train rides, and every milestone in between.',
  ),
  (
    title: 'The proposal',
    body: 'On the ridge at sunrise, with the lake below and no speech prepared.',
  ),
];

const storyImageUrl = 'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?auto=format&fit=crop&w=1000&q=80';

// -- Prenup film --------------------------------------------------------

const prenupKicker = 'Our prenup film';
const prenupTitle = 'Before the vows';
const prenupCaption = 'Three minutes of the two of us, filmed on a quiet morning in the hills.';
const prenupPosterUrl = 'https://images.unsplash.com/photo-1520854221256-17451cc331bf?auto=format&fit=crop&w=1600&q=80';

/// Paste a YouTube / Vimeo embed URL here to swap the placeholder for a real
/// film. Leave empty to keep the poster + play button placeholder.
const prenupVideoUrl = '';

// -- A note on gifts ----------------------------------------------------

const giftsKicker = 'A note on gifts';
const giftsTitle = 'With gratitude';
const giftsNote = 'Your presence is the gift. If you would like to give more, this is where it would go.';

/// Gift channels shown as tabs. The `number` value is what gets copied.
const giftAccounts = <({String label, String holder, String number})>[
  (label: 'GoTyme', holder: 'Rose Mae Verson', number: '0917 000 0000'),
  (label: 'Bank transfer', holder: 'Daryl Zea', number: '1234 5678 9012'),
];

// -- Event details ------------------------------------------------------

const detailsKicker = 'Event Details';
const detailsTitle = 'Where';

const ceremonyTime = '4:00 PM';
const ceremonyVenue = 'The Garden Chapel';
const ceremonyAddress = 'Forbes Park, Makati City';
const ceremonyMapUrl = 'https://maps.google.com/?q=Forbes+Park+Makati+City';

const receptionTime = '6:30 PM';
const receptionVenue = 'The Botanical Gardens';
const receptionAddress = '1 Conservatory Drive, Floral City';
const receptionMapUrl = 'https://maps.google.com/?q=The+Botanical+Gardens';

// -- Order of events ----------------------------------------------------

const scheduleKicker = 'Order of Events';
const scheduleTitle = 'The Day';

/// `(time, title, place, description)` entries for the day-of timeline.
const scheduleItems = <({String time, String title, String place, String description})>[
  (
    time: '3:30 PM',
    title: 'Guest Arrival',
    place: 'Garden Lawn',
    description: 'Welcome drinks and a live acoustic set at the garden lawn.',
  ),
  (
    time: '4:00 PM',
    title: 'Ceremony',
    place: 'Glass Chapel',
    description: 'Vows and ring exchange in the glass chapel.',
  ),
  (
    time: '5:00 PM',
    title: 'Cocktail Hour',
    place: 'Veranda Deck',
    description: 'Canapés, cocktails, and portrait sessions.',
  ),
  (
    time: '6:30 PM',
    title: 'Reception Program',
    place: 'Orchid Hall',
    description: 'Dinner reception, toasts, and surprise performances.',
  ),
  (
    time: '9:00 PM',
    title: 'First Dance',
    place: 'Orchid Hall',
    description: 'Couple dance followed by an open dance floor.',
  ),
];

// -- The entourage ------------------------------------------------------

const entourageKicker = 'Entourage';
const entourageTitle = 'The Entourage';

/// `(title, members)` groups. Members are shown one per line.
const entourageGroups = <({String title, List<String> members})>[
  (title: 'Maid of Honor', members: ['RodMae Verson']),
  (title: 'Best Man', members: ['Igel Zea']),
  (title: 'Bridesmaids', members: ['Juana Dela Cruz', 'Juana Dela Cruz', 'Juana Dela Cruz']),
  (title: 'Groomsmen', members: ['Juan Cruz', 'Belly S', 'Irvin G']),
  (
    title: 'Principal Sponsors',
    members: [
      'Ana Maria Delgado & Ramon Delgado',
      'Corazon Alvarez & Federico Alvarez',
      'Lourdes Ramos & Benigno Ramos',
    ],
  ),
  (title: 'The Little Ones', members: ['Flower Girl — Sofia Reyes', 'Ring Bearer — Lucas Bautista']),
];

// -- The printed invitation (dress code) --------------------------------

const attireKicker = 'The Printed Invitation';
const attireTitle = 'Dress Code';
const dressCode = 'Formal';
const dressCodeNote = 'The lawn is soft underfoot, so block heels beat stilettos.';

/// Palette swatches: `(name, hex)`.
const attirePalette = <({String name, String hex})>[
  (name: 'Paper', hex: '#fbf8f3'),
  (name: 'Champagne', hex: '#e8d9be'),
  (name: 'Antique gold', hex: '#c9ae7e'),
  (name: 'Sage', hex: '#7c8a72'),
  (name: 'Charcoal', hex: '#332e2a'),
];
const attirePaletteNote = 'Anywhere in this range is perfect.';

const attireLadies = 'Long dress or Filipiniana in any palette shade.';
const attireGentlemen = 'Barong Tagalog with dark trousers, or a light suit.';
const attireNote = 'A guide, not a rule — come as you are comfortable.';

// -- Good to know (FAQ) -------------------------------------------------

const faqKicker = 'Good to know';
const faqTitle = 'Questions';

const faqItems = <({String question, String answer})>[
  (
    question: 'Is there parking?',
    answer: 'Yes — the garden has covered parking, and overflow is a short walk down the drive.',
  ),
  (
    question: 'Are children welcome?',
    answer: 'Little ones are very welcome. Tell us their ages on your reply so we can seat them together.',
  ),
  (
    question: 'Can I bring a plus one?',
    answer: 'Your invitation shows how many seats we have saved for you.',
  ),
  (
    question: 'Can I change my reply?',
    answer: 'Any time before September 1 — open the same link and answer again.',
  ),
];

// -- A few reminders ----------------------------------------------------

const remindersKicker = 'A few reminders';
const remindersTitle = 'Before you come';

const reminderItems = <({String title, String body})>[
  (
    title: 'Arrive by 3.30',
    body: 'The doors close for the processional and we would hate you to miss it.',
  ),
  (
    title: 'An unplugged ceremony',
    body: 'Please keep phones away until after the vows — our photographer has it covered.',
  ),
  (
    title: 'Share your photos',
    body: 'Scan the QR at your table and everything you take reaches us.',
  ),
];

// -- RSVP ---------------------------------------------------------------

const rsvpKicker = 'Will you join us?';
const rsvpTitle = 'RSVP';
const rsvpQuestion = 'Will Rose and Daryl be joining us?';

/// Guests shown on the response form. `allowance` is an optional note under
/// the guest's name (e.g. the number of seats saved for them).
const rsvpGuests = <({String name, String? allowance})>[
  (name: 'Juan Dela Cruz', allowance: 'You are welcome to bring 1 guest'),
  (name: 'Maria Dela Cruz', allowance: null),
];

const rsvpMessageLabel = 'Include a message?';
const rsvpAcceptsLabel = 'Joyfully accepts';
const rsvpDeclinesLabel = 'Regretfully declines';
const rsvpSubmitLabel = 'Send my response';

// -- On the day ---------------------------------------------------------

const seatKicker = 'On the day';
const seatTitle = 'Find your seat';
const seatNote = 'Find your seat, and send us what you see.';
const seatButtonLabel = 'Find my seat';
const photosButtonLabel = 'Share photos';

// -- Photos wall --------------------------------------------------------

const photosKicker = 'Your Seat';
const photosTitle = 'Photos';

/// Gallery images — replace these URLs with your own engagement photos.
const galleryImages = [
  'https://images.unsplash.com/photo-1520854221256-17451cc331bf?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1533622597524-a1215e26c0e5?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1509927083803-4bd519298ac4?auto=format&fit=crop&w=800&q=80',
];

// -- Footer -------------------------------------------------------------

const footerSignOff = 'With love,';
const contactEmail = 'hello@rosedaryl-wedding.com';
const weddingHashtag = '#RoseAndDaryl2026';
