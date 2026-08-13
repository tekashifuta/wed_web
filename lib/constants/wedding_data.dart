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
const weddingDateFull = 'December 20, 2026';

/// The small uppercase kicker shown above the couple's names (matches the
/// Stitch "Wedding Home" hero).
const heroKicker = 'The Wedding Of';

/// Hero background image — the wedding gazebo (from the Stitch design).
const heroImageUrl =
    'https://lh3.googleusercontent.com/aida/AP1WRLvfF4f7QxvNb5R7stIgIYBM-B2KsWXmPU08nc-cRy6lEFz9kzuYPLeBRmRk_cNJoQrGy0imQit7O9JmGJBKo1hbg5puw3Ubsu3Y0b52JV1Bb7jZwigjW_LZfhoOl8ZA_gHP5ctSEKBJ7j_YDTdsPX7DdFw1CDbpvwMvCmM5JUxneKEohsXEiia0x8Fh2dnsu2InCcbip2in8DCP-FBZLfYuxtn30q2kXRkyb9y11Um99QZkak3tyS41u3Ah';

/// Venue details shown in the hero and reused by the ceremony/reception cards.
const venueName = 'Velvet & Stone Hotel';
const venueAddress1 = '45 Park Lane, Historic District';
const venueAddress2 = 'Savannah, GA';

/// "Our Story" paragraphs (from the Stitch design).
const storyParagraphs = [
  'It began with a chance meeting in a small coffee shop in the historic district. What started as a shared table quickly blossomed into shared dreams, long walks under the Spanish moss, and a quiet understanding that we had found something rare.',
  'Over the years, our love has grown through countless adventures, quiet Sunday mornings, and the unwavering support we find in each other. We are so excited to gather our closest family and friends to celebrate the beginning of our next chapter.',
];

/// "Our Story" photograph — the couple (from the Stitch design).
const storyImageUrl =
    'https://lh3.googleusercontent.com/aida/AP1WRLvBnzYDMj0-Dxzdv5r6HAYG7Q6yOmOWgIgyx2hXjf44aDe2Qeeaxo3DFNh23YY_ZqbLmBxcR7Z1eCf2-uzXACF_BlX3Wkl7NK8f01JiEHBQQbx2TH7B4vAwNB4JKILRLCzUKhvGkllsv9Z9ZA869_Zg1RCVOXGGlrSgpmDCHUbz0M453YW-dM6-p47LlrGbsVrwo6DaKcdh8WfHzDdDwcZ6vZ2Sd786SiQnTQ4HlkLWW4-_fdPtcIbK3jZq';

/// Ceremony details (same venue as the hero).
const ceremonyTime = '4:00 PM';
const ceremonyVenue = venueName;
const ceremonyAddress = '$venueAddress1, $venueAddress2';

/// Reception details (same venue as the hero).
const receptionTime = '6:30 PM';
const receptionVenue = venueName;
const receptionAddress = '$venueAddress1, $venueAddress2';

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
