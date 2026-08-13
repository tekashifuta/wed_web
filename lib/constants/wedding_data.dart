// -----------------------------------------------------------------------
// 🌸 Wedding Invitation Content
//
// This file holds ALL the editable text/content for the invitation page.
// Change the values below — you don't need to touch any other file to
// update the couple's names, date, venue, story, schedule, gallery or
// RSVP details.
// -----------------------------------------------------------------------

/// The bride & groom's first names, shown big in the hero section.
const brideName = 'Rose';
const groomName = 'Daryl';

/// Shown as "Rose & Daryl" or reversed depending on your preference.
String get coupleNames => '$brideName & $groomName';

/// Short monogram used in the navigation bar and footer.
const monogram = 'R & D';

/// Wedding date info.
const weddingWeekday = 'Saturday';
const weddingDateFull = 'September 12, 2026';

/// The small uppercase kicker shown above the couple's names (matches the
/// Stitch mobile "Wedding Home" hero).
const heroKicker = 'Save the Date';

/// Hero background image — the botanical garden (from the Stitch mobile design).
const heroImageUrl =
    'https://lh3.googleusercontent.com/aida/AP1WRLsP1MGh_fv8khpKAJEL83UH2uf9ufpoTLLyrNvbUuusTN87ak0awBIRsX6t8FIHUeJOmGWPlzageMuD6OAu_LSR7vUjGOyFzZIixT5vDrbt-UzJ7-LU7zuoZLRzoDo5b-UvaWpIRZWujT8u-BTfIrUcZwScP6quuzvm59ZqrLHJXe71BNQiHAnyL60PjuRuaQ_OVjAJH6w6974E7S0wdc3jgsFsrDp8l2fztoTfmUggqNCcLKk_F1T_Tw6T';

/// Venue details shown in the hero.
const venueName = 'The Botanical Gardens';

/// "Our Story" paragraph (from the Stitch mobile design).
const storyParagraphs = [
  'From a chance meeting in a sunlit garden to a lifetime of adventures together. We are overjoyed to invite you to celebrate our love story surrounded by the beauty of nature.',
];

/// "Our Story" photograph — the couple inside the arch frame (Stitch mobile).
const storyImageUrl =
    'https://lh3.googleusercontent.com/aida/AP1WRLvYyGpkO3eIEGUyt0U-30v7atp_MTr6J070p2AbqZ8xPKP_p6ISclCuJJfZRyJjdpQ3NCXdUk2uVhZG2V0KuDcV7BTXuQJxaT0BhxfyGcw10fThd5gaV8WPby7Dk6KFkwyoV-mWAmlIYNMf-iC6S1Pto_ks6GfA3KAANFE5BNA2LUHP2edZWHL-XzS6NpDXE9NndlghMUqtXdTo5fgyQ7Q-E7tlKCBK19AALfSlh3W-MIKSArAYSANFYqQ-';

/// Ceremony details.
const ceremonyTime = '4:00 PM';
const ceremonyVenue = 'The Heritage Gazebo';
const ceremonyAddress = '123 Botanical Way, Floral City';

/// Reception details.
const receptionTime = '6:30 PM';
const receptionVenue = 'The Botanical Gardens';
const receptionAddress = '1 Conservatory Drive, Floral City';

/// Day-of schedule entries: (time, title, description).
const scheduleItems = [
  (time: '3:30 PM', title: 'Guest Arrival', description: 'Please arrive a little early to find your seat.'),
  (time: '4:00 PM', title: 'Ceremony', description: 'Exchanging of vows in the garden pavilion.'),
  (time: '5:00 PM', title: 'Cocktail Hour', description: 'Drinks & canapés on the lawn.'),
  (time: '6:30 PM', title: 'Reception & Dinner', description: 'Dinner, speeches, and celebration begins.'),
  (time: '9:00 PM', title: 'Dancing', description: 'Let\'s dance the night away!'),
];

/// Gallery images — replace these URLs with your own engagement photos.
const galleryImages = [
  'https://images.unsplash.com/photo-1520854221256-17451cc331bf?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1533622597524-a1215e26c0e5?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1509927083803-4bd519298ac4?auto=format&fit=crop&w=800&q=80',
];

/// RSVP deadline shown to guests.
const rsvpDeadline = 'November 1st, 2026';

/// Contact info shown in the footer.
const contactEmail = 'hello@rosedaryl-wedding.com';
const weddingHashtag = '#RoseAndDaryl2026';
