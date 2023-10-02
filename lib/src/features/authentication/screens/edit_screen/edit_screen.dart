import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notexpert/src/constants/colors.dart';
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

  File? _selectedImage;

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
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 50, 16, 0),
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
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
                children: [
                  TextField(
                    controller: _titleController,
                    style: TextStyle(
                      fontSize: 30,
                      color: isDark ? Colors.white : Colors.black,
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
                      color: isDark
                          ? Color.fromARGB(178, 255, 255, 255)
                          : const Color.fromARGB(178, 0, 0, 0),
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
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark
                                    ? Color.fromARGB(40, 255, 255, 255)
                                    : Color.fromARGB(40, 0, 0, 0),
                              ),
                              child: Icon(
                                Icons.add,
                                color: isDark
                                    ? Color.fromARGB(190, 255, 255, 255)
                                    : Color.fromARGB(190, 0, 0, 0),
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Add a image',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? const Color.fromARGB(209, 255, 255, 255)
                                    : Color.fromARGB(190, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        _pickImageFromCamera();
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark
                                    ? Color.fromARGB(40, 255, 255, 255)
                                    : Color.fromARGB(40, 0, 0, 0),
                              ),
                              child: Icon(
                                Icons.add,
                                color: isDark
                                    ? Color.fromARGB(190, 255, 255, 255)
                                    : Color.fromARGB(190, 0, 0, 0),
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Scan a document',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? const Color.fromARGB(209, 255, 255, 255)
                                    : Color.fromARGB(190, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
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
          backgroundColor: isDark
              ? const Color.fromARGB(78, 255, 255, 255)
              : Color.fromARGB(96, 2, 70, 97),
          child: Icon(Icons.save,
              size: 30, color: Color.fromARGB(255, 255, 255, 255)),
        ));
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
