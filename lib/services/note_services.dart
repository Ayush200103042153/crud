import 'package:crud/models/note_for_listing.dart';

class NoteService {
  List<NoteForListing> getNoteList() {
    return [
      NoteForListing(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Ayush1",
      ),
      NoteForListing(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Ayush2",
      ),
      NoteForListing(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Ayush3",
      ),
    ];
  }
}
