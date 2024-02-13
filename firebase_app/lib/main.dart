import 'dart:async';
import 'dart:developer';
import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/LoginPage.dart';
import 'package:firebase_app/UiHelper.dart';
import 'package:firebase_app/services/NotificationServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationServices.initialize();

  // To fetch one document

  // DocumentSnapshot snapshott  = await FirebaseFirestore.instance.collection("users").doc("tLTnOZUDFqEbYoBoNSvJ").get();
  // log(snapshott.data().toString());

  // get will get all documents in collection users
  // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();

  // will get the instance of all the documents
  // log(snapshot.docs.toString());

  // to get data of document
  // for(var doc in snapshot.docs){
  //   log(doc.data().toString());
  // }


  // To add data to the firestore database
  // Map<String , dynamic> newUserData = {
  //   "name" : "yash",
  //   "email" : "yash@gamail.com"
  // };  Map<String , dynamic> new1UserData = {
  //   "name" : "shubham",
  //   "email" : "shubham@gamil.com",
  // };
  // await FirebaseFirestore.instance.collection("users").add(newUserData);
  // log("New user created");

  // updating data
  // await FirebaseFirestore.instance.collection("users").doc("v21WkoxHnQp2noNdJ2mY").update(
      // {"email": "yashbeta@gmail.com"}
  // );

  // adding another one
  // await FirebaseFirestore.instance.collection("users").doc("this-is-the-id").set(new1UserData);

  // for deleting one
  // await FirebaseFirestore.instance.collection("users").doc("tLTnOZUDFqEbYoBoNSvJ").delete();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser!= null) ? MyHomePage() : LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyHomePage();

}

class _MyHomePage  extends State<MyHomePage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  File? profilePic;

  void saveDetails()async{
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String ageString  = ageController.text.trim();

    int age = int.parse(ageString);

    nameController.clear();
    emailController.clear();
    ageController.clear();

    if(name!= "" && email != ""&& profilePic!= null){
      UploadTask uploadTask = FirebaseStorage.instance.ref().child("Profilepictures").child(Uuid().v1()).putFile(profilePic!);

      // form this we can track realtime progress of the image while uploading
      StreamSubscription taskSubscription = uploadTask.snapshotEvents.listen((snapshot) {
        double percentage = snapshot.bytesTransferred/snapshot.totalBytes * 100;
        log(percentage.toString());
      });

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      taskSubscription.cancel();

      Map<String , dynamic> newUser = {
        "name" : name ,
        "email" : email,
        "age" : age,
        "profilepic" : downloadUrl,
      };
      FirebaseFirestore.instance.collection("users").add(newUser);
      log("New user created");
    }
    else{
      UiHelper.CustomAlertBox(context, "Please fill required details");
    }

    setState(() {
      profilePic= null;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message.data["name"].toString()),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.green,
      ));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("app was opened by notification"),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.green,
      ));
    });

  }

  void logout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Firebase app"),
        actions: [
          IconButton(onPressed: (){
            logout();
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),

      // The details here saved in firestore database
      body:Column(
        children: [
          InkWell(
            onTap: () async {
              XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

              if(selectedImage != null){
                File convertedFile = File(selectedImage.path);
                setState(() {
                  profilePic = convertedFile;
                });
                log('Image selected');
              }
              else{
                log('No image selected');
              }
            },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: (profilePic!=null) ? FileImage(profilePic!) : null,
                backgroundColor: Colors.grey,
              ),

          ),
          UiHelper.CustomTextField(nameController, "name", Icons.person, false),
          UiHelper.CustomTextField(emailController, "email", Icons.mail, false),
          UiHelper.CustomTextField(ageController, "age", Icons.cake, false),
          UiHelper.CustomButton(() {
            saveDetails();
          }, "Save details"),

          SizedBox(height: 20,),

          // If use snapshots to fetch data then
          // it shows updated real time data
          StreamBuilder<QuerySnapshot>(
            // We can filter the documents using .where to access the filterd documents
            // We can arrage the list in order using .orderBy
              stream: FirebaseFirestore.instance.collection("users").where("age" , isGreaterThan: 18).orderBy("age"  , descending: true).snapshots(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.active){
                  if(snapshot.hasData && snapshot.data != null){
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context , index){
                      
                            Map<String , dynamic> userMap = snapshot.data!.docs[index].data() as Map<String , dynamic>;
                      
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(userMap["profilepic"]),
                              ),
                              title: Text(userMap["name"] + "(${userMap["age"]})"),
                              subtitle: Text(userMap["email"]),
                              trailing: IconButton(
                                onPressed: (){
                                  //delete
                                },
                                icon: Icon(Icons.delete),
                              ),
                            );
                        },
                      ),
                    );

                  }
                  else {
                    return Text("No Data");
                  }

                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

              },
          ),



      ],
      ),
    );
  }
}

