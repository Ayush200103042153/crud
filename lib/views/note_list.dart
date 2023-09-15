import 'package:crud/models/note_for_listing.dart';
import 'package:crud/views/note_delete.dart';
import 'package:crud/views/note_modify.dart';
import 'package:flutter/material.dart';

class Notelist extends StatelessWidget {
  Notelist({super.key});

  final notes = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const NoteModify(noteId: "")),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());

              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: const TextStyle(color: Colors.blueAccent),
              ),
              subtitle:
                  Text('Last updated on ${notes[index].latestEditDateTime}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => NoteModify(
                            noteId: notes[index].noteID,
                          )),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.black,
        ),
        itemCount: notes.length,
      ),
    );
  }
}
