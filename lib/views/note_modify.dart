import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String? noteId;
  bool get isEditing => noteId != null;

  const NoteModify({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    debugPrint(noteId);
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            Container(height: 8),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
