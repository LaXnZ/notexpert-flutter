import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:notexpert/src/features/authentication/models/note.dart';

import '../../../../common_widgets/navbar.dart';
import '../../../../constants/sizes.dart';
import '../homepage_screen/home_screen.dart';
import '../profile/profile_screen.dart';

class SearchNotes extends StatefulWidget {
  const SearchNotes({super.key});

  @override
  State<SearchNotes> createState() => _SearchNotesState();
}

class _SearchNotesState extends State<SearchNotes> {
  List<Note> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => b.modifiedTime.compareTo(a.modifiedTime));
    }

    sorted = !sorted;

    return notes;
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const SearchNotes(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => _screens[index],
        transitionsBuilder: (context, animation1, animation2, child) {
          return FadeTransition(
            opacity: animation1,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pop()},
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Expanded(
                child: Text('Search Notes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kTitleFontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? Color(kPrimaryWhiteColor)
                          : Color(kPrimaryBlackColor),
                    )),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0, top: 5),
            decoration: BoxDecoration(
              color:
                  isDark ? Color.fromRGBO(71, 71, 71, 0.965) : Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  filteredNotes = sortNotesByModifiedTime(filteredNotes);
                });
              },
              icon: Icon(
                Icons.sort,
                color: Color(kPrimaryBlackColor),
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            TextField(
                onChanged: onSearchTextChanged,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(isDark
                      ? kPrimaryWhiteColor
                      : kPrimaryBlackColor), // Set the text color based on the theme
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 20.0),
                  hintText: 'Search notes...',
                  prefixIcon: Icon(Icons.search),
                  fillColor: isDark
                      ? Color.fromRGBO(71, 71, 71, 0.965)
                      : Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                )),
            const SizedBox(height: 20.0),
            Expanded(
                child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    margin: EdgeInsets.only(bottom: 17.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: isDark
                        ? Color.fromARGB(255, 34, 34, 34)
                        : Color.fromARGB(87, 112, 184, 202),
                    child: ListTile(
                      title: RichText(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '${filteredNotes[index].title} \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: isDark
                                ? const Color.fromARGB(255, 218, 216, 216)
                                : Color.fromARGB(226, 0, 0, 0),
                          ),
                          children: [
                            TextSpan(
                              text: '${filteredNotes[index].content} \n',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.normal,
                                color: isDark
                                    ? const Color.fromARGB(255, 218, 216, 216)
                                    : Color.fromARGB(226, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      subtitle: Text(
                        '\nLast edited on ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredNotes[index].modifiedTime)}',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          color: isDark
                              ? Colors.grey.shade300
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
