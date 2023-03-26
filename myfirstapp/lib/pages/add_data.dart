import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _controllername = TextEditingController();
  TextEditingController _controllerrollno = TextEditingController();
  TextEditingController _controllergithub = TextEditingController();
  TextEditingController _controllerhall = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'DataBase App',
              style: TextStyle(
                  fontFamily: 'RubikIso',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  height: 2,
                  color: Colors.yellow.withOpacity(1)
              ),
            ),
          ),
          backgroundColor: Colors.blue[800],
          toolbarHeight: 80,
          centerTitle: true,
        ),
        key: _formKey,
        body: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _controllername,
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Username"
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _controllerrollno,
                      decoration: InputDecoration(
                          hintText: "Enter Roll Number",
                          labelText: "Roll Number"
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _controllerhall,
                      decoration: InputDecoration(
                          hintText: "Enter Hall of Residence",
                          labelText: "Hall"
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _controllergithub,
                      decoration: InputDecoration(
                          hintText: "Enter GitHub ID",
                          labelText: "GitHub ID"
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Map<String, String> dataToSave={
                          "Name": _controllername.text,
                          "Roll No": _controllerrollno.text,
                          "GitHub ID": _controllergithub.text,
                          "Hall": _controllerhall.text
                        };
                        // if (_formKey.currentState!.validate()) {
                        //   FirebaseFirestore.instance.collection("Contacts").add(dataToSave);
                        //   // If the form is valid, display a snackbar. In the real world,
                        //   // you'd often call a server or save the information in a database.
                        //   Navigator.pushNamed(context, "\home").then((
                        //   _){});
                        //   setState(() {
                        //     _controllerhall.clear();
                        //     _controllergithub.clear();
                        //     _controllerrollno.clear();
                        //     _controllername.clear();
                        //   });
                        // }
                        FirebaseFirestore.instance.collection("Contacts").add(dataToSave);
                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Go back!'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}