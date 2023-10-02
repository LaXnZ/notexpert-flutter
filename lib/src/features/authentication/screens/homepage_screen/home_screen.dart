import 'package:flutter/material.dart';
import 'package:notexpert/src/common_widgets/navbar.dart';
import 'package:notexpert/src/features/authentication/models/note.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:intl/intl.dart';
import 'package:notexpert/src/features/authentication/screens/edit_screen/edit_screen.dart';
import 'package:notexpert/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:notexpert/src/features/authentication/screens/search_notes_screen/search_notes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deleteNote(int index) {
    setState(() {
      Note note = sampleNotes[index];
      sampleNotes.remove(note);
      sampleNotes.removeAt(index);
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const SearchNotes(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;

  Color _getIconColor(Brightness brightness) {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  Color _getTextColor(Brightness brightness) {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

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
    var iconColor = _getIconColor(isDark ? Brightness.dark : Brightness.light);
    var textColor = _getTextColor(isDark ? Brightness.dark : Brightness.light);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        leading: Icon(Icons.menu, color: isDark ? Colors.white : Colors.black),
        title: Container(
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    isDark ? kHomePageLogoDark : kHomePageLogo,
                  ),
                ),
              ),
            ],
          ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const ProfileScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              icon: const Image(image: AssetImage(kUserProfileImage)),
            ),
          )
        ],
        iconTheme: IconThemeData(color: iconColor),
        titleTextStyle: TextStyle(color: textColor),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: sampleNotes.length,
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
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => EditScreen(
                                note: sampleNotes[index],
                              ),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              int originalIndex =
                                  sampleNotes.indexOf(sampleNotes[index]);

                              sampleNotes[originalIndex] = Note(
                                id: sampleNotes[originalIndex].id,
                                title: result[0],
                                content: result[1],
                                modifiedTime: DateTime.now(),
                              );

                              sampleNotes[index] = Note(
                                id: sampleNotes[index].id,
                                title: result[0],
                                content: result[1],
                                modifiedTime: DateTime.now(),
                              );
                            });
                          }
                        },
                        title: RichText(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${sampleNotes[index].title} \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: isDark
                                  ? const Color.fromARGB(255, 218, 216, 216)
                                  : Color.fromARGB(226, 0, 0, 0),
                            ),
                            children: [
                              TextSpan(
                                text: '${sampleNotes[index].content} \n',
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
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        subtitle: Text(
                          '\nLast edited on ${DateFormat('EEE MMM d, yyyy h:mm a').format(sampleNotes[index].modifiedTime)}',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic,
                            color: isDark
                                ? Colors.grey.shade300
                                : Colors.grey.shade700,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  icon: Icon(
                                    Icons.info_outline,
                                    color: isDark
                                        ? Colors.white
                                        : Color.fromARGB(206, 0, 0, 0),
                                  ),
                                  backgroundColor: isDark
                                      ? Color.fromARGB(255, 34, 34, 34)
                                      : Color.fromARGB(227, 234, 237, 238),
                                  title: Text(
                                    'Are you sure you want to delete this note?',
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 34, 34, 34),
                                      fontSize: 24,
                                    ),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: isDark
                                              ? Color.fromARGB(255, 44, 84, 121)
                                              : Color.fromARGB(
                                                  255, 74, 140, 201),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 60,
                                          child: Text(
                                            'Yes',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.white
                                                  : const Color.fromARGB(
                                                      255, 34, 34, 34),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: isDark
                                              ? Color.fromARGB(255, 117, 43, 43)
                                              : Color.fromARGB(
                                                  255, 201, 74, 74),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 60,
                                          child: Text(
                                            'No',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.white
                                                  : const Color.fromARGB(
                                                      255, 34, 34, 34),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                            if (result != null && result == true) {
                              deleteNote(index);
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: isDark
                                ? Color.fromARGB(255, 179, 175, 175)
                                : Color.fromARGB(220, 63, 63, 63),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );
          if (result != null) {
            setState(() {
              sampleNotes.add(
                Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now(),
                ),
              );
            });
          }
        },
        elevation: 1,
        backgroundColor: isDark
            ? const Color.fromARGB(78, 255, 255, 255)
            : Color.fromARGB(96, 2, 70, 97),
        child: Icon(
          Icons.add,
          size: 30,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
