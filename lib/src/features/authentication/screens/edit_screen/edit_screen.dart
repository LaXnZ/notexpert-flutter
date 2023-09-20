import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notexpert/src/features/authentication/screens/homepage_screen/home_screen.dart';

import '../../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _noteController.text = widget.note!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Container(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: ListView(
                children: [
                  TextField(
                    controller: _titleController,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter title of note..',
                      hintStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _noteController,
                    style: TextStyle(
                      color: const Color.fromARGB(226, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your note here..',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(179, 158, 158, 158),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(
                context, [_titleController.text, _noteController.text]);
          },
          elevation: 1,
          backgroundColor: Color.fromARGB(96, 2, 70, 97),
          child: Icon(Icons.save,
              size: 30, color: Color.fromARGB(255, 255, 255, 255)),
        ));
  }
}
