import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:flutter_note_pad_app/crud_screens/add_screen.dart';
import 'package:flutter_note_pad_app/crud_screens/update_screen.dart';
import 'package:flutter_note_pad_app/services/data_base_services.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const AddScreen();
          }));
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: firestore.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final v = snapshot.data!.docs[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (ss) async {
                    await DataBaseServices.deleteNotes(v.id);
                  },
                  child: Card(
                    child: ExpansionTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return UpdateScreen(
                              id: v.id,
                              title: v['title'],
                              details: v['details'],
                            );
                          }));
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      title: Text(v['title']),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Details: ${v['details']}"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
/*
 StreamBuilder(
        stream: firestore.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(snapshot.data!.docs[index]['title']),
                  );
                });
          } else {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
*/