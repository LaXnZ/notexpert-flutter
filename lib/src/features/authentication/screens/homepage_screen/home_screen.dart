import 'package:flutter/material.dart';
import 'package:notexpert/models/note.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${sampleNotes[index].title} \n',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Color(kPrimaryBlackColor),
                            ),
                            children: [
                              TextSpan(
                                text: '${sampleNotes[index].content} \n',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Color(kPrimaryBlackColor),
                                  fontWeight: FontWeight.bold,
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
                          onPressed: () {},
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
