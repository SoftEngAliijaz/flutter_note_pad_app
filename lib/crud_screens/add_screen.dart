import 'package:flutter/material.dart';
import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:flutter_note_pad_app/services/data_base_services.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                ///title field
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _titleController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Field Should Not be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.title_outlined),
                        hintText: 'Enter title',
                        labelText: 'Enter title',
                      ),
                    ),
                  ),
                ),

                ///details field
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _detailsController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Field Should Not be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.details_outlined),
                        hintText: 'Enter details',
                        labelText: 'Enter details',
                      ),
                    ),
                  ),
                ),

                ///button

                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () async {
                        if (globalKey.currentState!.validate()) {
                          await DataBaseServices.addNotes(
                              _titleController.text, _detailsController.text);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppUtils.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 70,
                        child: const Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
