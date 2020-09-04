import 'dart:io';
import 'package:blog/HomePage.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:firebase_database/firebase_database.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:image_picker/image_picker.dart";



  class UploadPhotoPage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
      return _UploadPhotoPageState();
    }
  }

  class _UploadPhotoPageState extends State <UploadPhotoPage>{

  File sampleImage;
  String _myValue;
  final formKey = GlobalKey<FormState> ();
  String url;
  final picker = ImagePicker();

  Future getImage() async {
    final tempImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      sampleImage =File(tempImage.path);
    });

  }

  void uploadStatusImage() async{
    if(validateAndSave()){

      final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
      var timeKey = DateTime.now();

      final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = ImageUrl.toString();
      print("ImageUrl is $url");

      goToHomePage();
      saveToDatabase(url);

    }
  }

  void saveToDatabase(url){

  var dbTimeKey = DateTime.now();
  var formatDate = DateFormat("MMM d"); // These are the format for Date shown as MonthName date
  var formatTime = DateFormat("EEEE, hh:mm aaa"); // These are the format for time and "aaa" goes for AM/PM.

  String date = formatDate.format(dbTimeKey);
  String time = formatTime.format(dbTimeKey);

  DatabaseReference ref = FirebaseDatabase.instance.reference();

  var data = {
    "image": url,
    "description": _myValue,
    "date": date,
    "time":time
  };

  ref.child("Posts").child(time).set(data); // push function generates a random key through which the data is stored ...
                                            // For VeeCar app  avoid using push function while retrieving the data from Database as well as storing it.
  }

  void goToHomePage(){
  Navigator.push(context,
      MaterialPageRoute(builder: (context ){
        return HomePage();

      }),);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    appBar: AppBar(
      title: Text("Upload a Photo"),
      centerTitle: true,
    ),

      body: Center(

       child: sampleImage == null? Text( "Please upload a photo to continue!"): enableUpload(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "AddImage",
        child: Icon(Icons.add_a_photo),
      ),

    );
  }

  Widget enableUpload(){
    return Form(
    key: formKey,
    child: ListView(
     children: <Widget>[

       Image.file(sampleImage , height: 330.0,width: 660.0),

       SizedBox(height:15.0),
       Padding(
         
         padding: EdgeInsets.all(20.0),

       child: TextFormField(
         decoration: InputDecoration(
           labelText: "Description",
           labelStyle: TextStyle(fontWeight: FontWeight.bold),
           prefixIcon: Icon(Icons.description),
         ),

         validator: (value){
           return value.isEmpty? "Description can't be empty": null;
         },

         onSaved: (value){
           return _myValue = value;
         },

       ),
       ),

       SizedBox(height: 15.0,),
       RaisedButton(
         elevation: 10.0,
         child: Text("Add a new post"),
         textColor: Colors.white,
         color: Colors.black,

         onPressed: uploadStatusImage,
       )
       
     ],
    )
    );
  }

  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }


}