import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/add_data.dart';

import 'components/profile.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
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

            body:Builder(
              builder: (context) {
                return Column(
                  children: [
                    SizedBox(
                      height: 630,
                      child: fetchData(),
                    ),
                    Container(
                      margin: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        // style: style,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddData()));
                        },
                        child: const Text('Go To Login Page'),
                      ),
                    ),
                  ],
                );
              }
            )
        ),
        routes: {
          "/home":(context)=>MyApp(),
          "/form":(context)=>AddData(),
        },
    );
  }
}

fetchData(){
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Contacts').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Profile(Name:data["Name"],GitHub_ID:data["GitHub ID"],Roll_No:data["Roll No"],Hall: data["Hall"],);
          }).toList(),
        );
      },
    );
  }
