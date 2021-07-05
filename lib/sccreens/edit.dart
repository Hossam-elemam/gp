import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mar/constants.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  static String id='Edit';




  @override
  State<StatefulWidget> createState() {

    return new _EditStates();
  }
}

class _EditStates extends State<Edit> {
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // Start Form Controller

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  String validglobal(String val) {
    if (val.isEmpty) {
      return "Filed can't be empty";
    }
  }

// trim for spacing
  String validusername(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "User Name Minimum Length 4 characters";
    }
    if (val.trim().length > 20) {
      return "User Name Maximum Length 20 characters";
    }
  }

  String validpassword(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "password Minimum Length 4 characters";
    }
    if (val.trim().length > 20) {
      return "password Maximum Length 20 characters";
    }
  }

  String validconfirmpassword(String val) {
    if (val != password.text) {
      return "Not Matched With Password";
    }
  }

  String validemail(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "User Name Minimum Length 4 characters";
    }
    if (val.trim().length > 50) {
      return "User Name Maximum Length 20 characters";
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "Email not valid for ex: ahmed@gmail.com";
    }
  }

  edit() async {
    var data = {"UserId" : UserId ,"email" : email.text, "password" : password.text, "username" : username.text};
    var url = "http://10.0.2.2/medical/edit.php";
    var response = await http.post(url, body: data);
    var responcebody = jsonDecode(response.body);
    if (responcebody['status'] == 'success') {
      print("Done");
    } else {
      print("Failed");
      //Navigator.of(context).pop();
    }
  }


  var UserId;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {


      UserId = preferences.getString("UserId");
      print (UserId);
    });


  }
  @override
  void initState() {
    getPref();
    super.initState();
  }


  bool showedit = true;



  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(

        body: Stack(
          children: [
            Container(height: double.infinity, width: double.infinity),
            // call method position top
            buildPositionedtop(mdw),

            // call method position bottom
            buildPositionedBottom(mdw),
            Container(
                height: 1000,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      buildContainerAvatar(mdw),
                      buildFormBoxEditProfile(mdw),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [

                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    RaisedButton(
                                        elevation: 10,
                                        color:  kMainColor,

                                        onPressed: edit,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Update",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700)),

                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RaisedButton(
                                        elevation: 10,
                                        color:  kMainColor,

                                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Scan()));} ,

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Back",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700)),

                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),



                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
    /* return new Scaffold(
      appBar: AppBar(
        title: new Text("Edit Your Profile"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20),
        child: new Column(
          children: [
            new TextField(
              keyboardType: TextInputType.name,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Write Your Name",
                  labelText: "Your Name"),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            new TextField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Write Your Email",
                  labelText: "Email"),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Write Your User Old Password",
                  labelText: "Old Password"),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Write Your User New Password",
                  labelText: "New Password"),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Confirm Your User Password",
                  labelText: "Confirm New Password"),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            RaisedButton(
              onPressed: () {},
              child: Text("Save"),
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
    );*/
  }
  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
      obscureText: pass,
      validator: myvalid,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        hintText: myhinttext,
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[500],
              style: BorderStyle.solid,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[500],
              style: BorderStyle.solid,
              width: 1,
            )),
      ),
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 30, spreadRadius: 10)
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 25,
            child: Icon(Icons.edit, size: 50, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // method for position top
  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
          // for larger circular to right and left
          scale: 1.3,
          child: Transform.translate(
            // for position and movement to top
            offset: Offset(0, -mdw / 1.7),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mdw),
                    color:kMainColor
                )),
          ),
        ));
  }

  // method for position bottom
  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
      top: 300,
      left: mdw / 1.5,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: kMainColor)),
    );
  }

  Center buildFormBoxEditProfile(double mdw) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOutBack,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(top: showedit ? 40 : 20),
        height: 380,
        width: mdw / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kMainColor,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ],
        ),
        child: Form(
          key: formstatesignup,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start TextField UserName
                  Text("User Name",
                      style: TextStyle(
                          color: kMainColor, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter UserName....", false, username, validusername),
                  SizedBox(height: 10),
                  Text("New Password",
                      style: TextStyle(
                          color: kMainColor, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter New Password....", true, password, validpassword),
                  SizedBox(height: 10),
                  Text("Email",
                      style: TextStyle(
                          color: kMainColor, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter Email....", false, email, validemail),
                  //End TextField password
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
