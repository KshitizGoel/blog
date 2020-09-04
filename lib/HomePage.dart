import 'package:blog/PhotoUpload.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'Authentication.dart';
import "Posts.dart";


class HomePage extends StatefulWidget{

  HomePage({
    this.auth,
    this.onSignedOut,
  }
      );

  final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

  List <Posts> postsList = [];

  @override
  void initState() {
   super.initState();

   DatabaseReference postsRef = FirebaseDatabase.instance.reference().child("Posts");

   postsRef.once().then((DataSnapshot snap){
   // ignore: non_constant_identifier_names
   var KEYS = snap.value.keys;
   var DATA = snap.value;

  postsList.clear();


   for(var individualKey in KEYS){

     Posts posts = Posts(

       DATA[individualKey]["date"],
       DATA[individualKey]["description"],
       DATA[individualKey]["image"],
       DATA[individualKey]["time"],

                     );
    postsList.add(posts);
       }
   }
   );

  }

  void _logoutUser() async{
      try{
      await widget.auth.signOut();
      widget.onSignedOut();
      }
      catch(e){
      print(e.toString());
      }
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
         centerTitle: true,
         title: Text(
         "Home",
       )
     ),

     body: Container(

      child: postsList.length==0? Text("Nothing available!") : ListView.builder(
        itemCount: postsList.length,
          itemBuilder:(_,index){
            return postsUI(postsList[index].image,postsList[index].description, postsList[index].date, postsList[index].time);
          }
      ),

     ),

     bottomNavigationBar: BottomAppBar(
       color: Colors.pink,

       child: Container(

         margin: EdgeInsets.only(left:70.0 , right: 70.0),

         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,

           children: <Widget>[
             IconButton(
               icon: Icon(Icons.local_car_wash),
               iconSize: 40.0,
               color: Colors.white,

               onPressed: _logoutUser,

             ),

             IconButton(
               icon: Icon(Icons.add_a_photo),
               iconSize: 40.0,
               color: Colors.white,

               onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context){
                       return UploadPhotoPage();
                     })
                 );
               },
             )

           ],

         ),
       ),

     ),
   );
  }

  Widget postsUI (String image, String description, String date, String time){

    return Card(
      elevation: 20.0,

      margin: EdgeInsets.only(left: 25.0 , right:25.0, top:15.0, bottom:15.0),

      child: Container(
        padding: EdgeInsets.all(20.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),

                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),

              ],

            ),

            SizedBox(height: 15.0,),
            Image.network(image,fit: BoxFit.cover,),

            SizedBox(height: 15.0,),
            Text(
              description,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),

    );

  }

}