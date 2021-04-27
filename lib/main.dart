import "package:flutter/material.dart";
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.green,
      ),
    home: MyHomePage(title: 'Activity 12 (Checkpoint 3)'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key : key);
  final String title;
  @override
  _MyHomePageState  createState() => _MyHomePageState();
}
class LoginData {
  String name = "";
  String surname = "";
  String username = "";
  String password = "";
}
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showMessage(String message){
    try {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: 'Back',
              onPressed: () {
                print('Action in Snackbar has been pressed.');
              },
            ),
          )
      );
    } on Exception catch (e, str) {
      print(str);
    }
  }

  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
        home : Scaffold(
          body : Container(
           padding : EdgeInsets.all(50.0),
              child : Form(
                  key : this._formKey,
                  child : Column(
                      children : [
                        TextFormField(
                            keyboardType : TextInputType.emailAddress,
                            validator : (String inValue) {
                              if (inValue.length == 0) {
                                return "Please enter username";
                              }
                              return null;
                              },
                            onSaved: (String inValue) {
                              this._loginData.username = inValue;
                              },
                            decoration : InputDecoration(
                                hintText : "none@none.com",
                                labelText : "Username (eMail address)"
                            )
                        ),
                        TextFormField(
                            obscureText : true,
                            validator : (String inValue) {
                              if (inValue.length < 10) {
                                return "Password must be >=10 in length";
                              }
                              return null;
                              },
                            onSaved : (String inValue) {
                              this._loginData.password = inValue;
                              },
                            decoration : InputDecoration(
                                hintText : "Password",
                                labelText : "Password"
                            )
                        ),
                        RaisedButton(
                            child : Text("Log In!"),
                            onPressed : () {

            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              _showMessage("Welcome ${_loginData.username}");
              _showMessage("Welcome ${_loginData.password}");
              print("Username: ${_loginData.username}");
              print("Password: ${_loginData.password}");
            }
          }
      ) ]
    )))));}}
