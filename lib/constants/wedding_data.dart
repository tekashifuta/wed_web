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

/// Wedding date info.
const weddingWeekday = 'Saturday';
const weddingDateLabel = 'the 12th of September, 2026 - TBA';
const weddingShortDate = '09 · 12 · 2026';

/// Hero subtitle / tagline.
const heroTagline = 'Together with our families, we joyfully invite you to celebrate our garden wedding';

/// Hero background image — replace with your own photo.
const heroImageUrl = 'https://images.unsplash.com/photo-1465495976277-4387d4b0b4c6?auto=format&fit=crop&w=1600&q=80';

/// A short love-story blurb shown under the hero.
const introQuote =
    '“In a garden full of flowers, we found each other — and decided to grow a life together, side by side, forever.”';

/// Our Story timeline entries: (year, title, description).
const storyMoments = [
  (
    year: '2019',
    title: 'How We Met',
    description: 'A chance meeting at a mutual friend\'s garden party turned into hours of conversation under string lights.',
  ),
  (
    year: '2021',
    title: 'The First Trip',
    description: 'Our first trip together to the countryside confirmed what we already knew — this was something special.',
  ),
  (
    year: '2024',
    title: 'The Proposal',
    description: 'On a quiet evening among the roses, Daryl got down on one knee and Rose said yes without hesitation.',
  ),
  (
    year: '2026',
    title: 'Happily Ever After',
    description: 'Now we can\'t wait to celebrate the next chapter of our story, surrounded by the people we love most.',
  ),
];

/// Ceremony details.
const ceremonyTime = '4:00 PM';
const ceremonyVenue = 'The Rose Garden Pavilion';
const ceremonyAddress = '123 Blossom Lane, Green Valley';

/// Reception details.
const receptionTime = '6:30 PM';
const receptionVenue = 'The Orchard Hall';
const receptionAddress = '123 Blossom Lane, Green Valley';

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
const rsvpDeadline = 'August 15th, 2026';

/// Contact info shown in the footer.
const contactEmail = 'hello@rosedaryl-wedding.com';
const weddingHashtag = '#RoseAndDaryl2026';
