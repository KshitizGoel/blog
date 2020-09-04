import "package:flutter/material.dart";
import "Authentication.dart";
import "DialogBox.dart";

class LoginPageRegister extends StatefulWidget{

  LoginPageRegister({
    this.auth,
    this.onSignedIn,
    }
      );

  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }
}

enum FormType{
  login,
  register
}

class _LoginRegisterState extends State<LoginPageRegister>{

  DialogBox dialogBox = DialogBox();

  final formKey = GlobalKey <FormState> ();
  FormType _formType = FormType.login;
  String _email = " ";
  String _password = " ";


  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void validateAndSubmit() async{

    if(validateAndSave()){
      try{

        if(_formType== FormType.login){
          String userId = await widget.auth.signIn(_email,_password);
          print("Login user ID: $userId ");
        }
        else{
          String userId = await widget.auth.signUp(_email,_password);
          dialogBox.information(context, "Congratulations!", "You have successfully registered your account!");

          print("Register user ID: $userId ");
        }

        widget.onSignedIn();

      }catch(e){
        dialogBox.information(context, "Error", e.toString());
        print("Exception ${e.toString()}");
      }
    }

  }

  void moveToLogin(){
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  void moveToRegister(){

    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(

        margin: EdgeInsets.all(15.0),

        child: Form(

          key: formKey,

          child: ListView(
            padding: EdgeInsets.all(10.0),
            children:  createInput() + createButton(),

          ),
        ),
      )
    );
  }

  List <Widget> createInput(){ // Created a List of Widgets so that all widgets can be placed under this list... Noice
    return [
        SizedBox(height: 10.0),

        getImageAsset(),

        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        labelText: "Enter the Email",

    ),
    textCapitalization: TextCapitalization.none,

          validator: (value){
            return value.isEmpty? "Email is required" : null;
          },
          onSaved: (value){
            return _email = value;
          },
        ) ,

      SizedBox(height: 20.0),
      TextFormField(

        keyboardType: TextInputType.number,

          decoration: InputDecoration(
            labelText: "Enter the Password",
              labelStyle: TextStyle(
              fontWeight: FontWeight.bold
          ),
            hintText: "Same as the email",
            prefixIcon: Icon(Icons.lock)
          ),
        obscureText: true,
        validator: (value){
          return value.isEmpty? "Password is required" : null;
        },
        onSaved: (value){
          return _password = value;
        },
      ),
    ];
  }
  List <Widget> createButton(){ // Created a List of Widgets so that all widgets can be placed under this list... Noice
  if(_formType == FormType.login){
    return [
      Padding(
        padding: EdgeInsets.all(15.0),
        child: RaisedButton(
          padding: EdgeInsets.all(10.0),
          elevation: 20.0,
          color: Colors.pink,
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
      new FlatButton(

          onPressed: moveToRegister,
          child: Text("New here? Register here" ,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0
            ),)
      )
    ];
  }
  else{
    return [
      Padding(
        padding: EdgeInsets.all(15.0),
        child: RaisedButton(

          padding: EdgeInsets.all(10.0),

          elevation: 20.0,
          color: Colors.pink,
          child: Text(
            "Register",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
      new FlatButton(

          onPressed: moveToLogin,
          child: Text("Login Here" ,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0
            ),)
      )

    ];}}
}
class getImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  AssetImage assetImage = AssetImage("image/veer.jpg");
  Image image = Image(image: assetImage);

  return Container(
      child: image,
  );
  }
}

