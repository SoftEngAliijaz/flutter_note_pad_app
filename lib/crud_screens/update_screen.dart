import 'package:flutter/material.dart';
import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:flutter_note_pad_app/services/data_base_services.dart';

class UpdateScreen extends StatefulWidget {
  final String? id;
  final String? title;
  final String? details;

  const UpdateScreen({
    Key? key,
    this.id,
    this.title,
    this.details,
  }) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Notes'),
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
                        hintText: '${widget.title}',
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
                        hintText: '${widget.details}',
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
                          await DataBaseServices.updateNotes(
                            _titleController.text,
                            _detailsController.text,
                            widget.id.toString(),
                          );
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
                            'Update',
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
