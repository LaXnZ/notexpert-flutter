import 'package:flutter/material.dart';
import 'package:notexpert/src/features/authentication/models/note.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deleteNote(int index) {
    setState(() {
      sampleNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          leading: const Icon(Icons.menu, color: Colors.black),
          title: Container(
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      kHomePageLogo,
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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0)),
              child: IconButton(
                onPressed: () {},
                icon: const Image(image: AssetImage(kUserProfileImage)),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      color: Color.fromARGB(87, 112, 184, 202),
                      child: ListTile(
                        title: RichText(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${sampleNotes[index].title} \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Color(kPrimaryBlackColor),
                            ),
                            children: [
                              TextSpan(
                                text: '${sampleNotes[index].content} \n',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(kPrimaryBlackColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        subtitle: Text(
                          '\nLast edited on ${DateFormat('EEE MMM d, yyyy h:mm a').format(sampleNotes[index].modifiedTime)}',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    icon: const Icon(Icons.info_outline,
                                        color: Color.fromARGB(206, 0, 0, 0)),
                                    backgroundColor:
                                        Color.fromARGB(227, 234, 237, 238),
                                    title: Text(
                                      'Are you sure you want to delete this note?',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 34, 34, 34),
                                          fontSize: 24),
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
                                              primary: Color.fromARGB(
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
                                                    color: const Color.fromARGB(
                                                        255, 34, 34, 34)),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
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
                                                    color: const Color.fromARGB(
                                                        255, 34, 34, 34)),
                                              ),
                                            ),
                                          )
                                        ]),
                                  );
                                });
                            if (result != null && result == true) {
                              deleteNote(index);
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black38,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0.5,
          backgroundColor: Color.fromARGB(96, 2, 70, 97),
          child: Icon(Icons.add,
              size: 30, color: Color.fromARGB(255, 255, 255, 255)),
        ));
  }
}
