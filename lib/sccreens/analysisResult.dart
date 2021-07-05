import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/constants.dart';
import 'package:mar/sccreens/analysisNotes.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/sccreens/showanalysisNotes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'analysisNotes.dart';
import 'infoAnalysis.dart';
import 'knowAnalysis.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:flutter/widgets.dart' as widgets;

class AnalysisResult extends StatefulWidget {
  final Map<String, dynamic> data;

  AnalysisResult({this.data});

  @override
  _AnalysisResultState createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  var userId = "";
  List analysis = [];
  List filteredAnalysis = [];

  VoiceController _voiceController;
  String text ="";

    @override
    void initState() {
      _voiceController = FlutterTextToSpeech.instance.voiceController();

      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
      _voiceController.stop();
    }

    _playVoice() {
      _voiceController.init().then((_) {
        _voiceController.speak(
          text,
          VoiceControllerOptions(),
        );
      });
    }

    _stopVoice() {
      _voiceController.stop();
    }


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getString("UserId");
    });
  }


  /*Future<dynamic> getCurrentOcr() async{
    var url = "http://10.0.2.2:5000/image";
    var data = {"user_id": userId};
    var response = await http.post(url, body: json.encode(data));
    print("hoosssssamn");
    print(response.body);
    //var try2 = json.decode(response.body);
    //print(try2);
    print("************************************");
  }*/

  // @override
  // void initState() {
  //   getCurrentOcr().then((data) {
  //     setState(() {
  //       analysis = filteredAnalysis = data;
  //     });
  //   });
  //   super.initState();
  // }

/*  @override
  void initState() {
    print(widget.data);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          title: Text(
            "Show Analysis Result",
          ),
          actions: [
            FlatButton(
              child: CircleAvatar(
                child: Image(
                  image: AssetImage('images/icons/medical.png'),
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Scan.id);
              },
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container (
          child:


                  Container(

                  child: Stack(

                    children: [
                      Column (
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text("Urein Analysis Test"),
                          ),
                          Divider(
                            thickness: 3,
                            indent: 30,
                            color: kMainColor,
                            endIndent: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [

                                Container(
                                  width: 100,
                                  child: Column (
                                    children: [

                                      Text("collection"),
                                    ],
                                  ),
                                ),

                                Container(
                                  width: 50,
                                  child: Column (
                                    children: [
                                      Text(widget.data['collection']),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                widget.data['collection'] == "random"?
                                Icon(Icons.thumb_up, color: Colors.green)
                                    : Icon(Icons.thumb_down,  color: Colors.red),
                              ],
                            ),
                          ),
                          SizedBox(width: 30,height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [

                              Container(
                                width: 100,
                                child: Column (
                                  children: [

                                    Text('volume'),
                                  ],
                                ),
                              ),

                              Container(
                                width: 50,
                                child: Column (
                                  children: [
                                    Text(widget.data['volume']),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              widget.data['volume'] == "Sample"?
                              Icon(Icons.thumb_up, color: Colors.green)
                                  : Icon(Icons.thumb_down,  color: Colors.red),
                            ],
                          ),
                          SizedBox(width: 30,height: 40,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [

                                Container(
                                  width: 100,
                                  child: Column (
                                    children: [
                                      Text('colour'),
                                    ],
                                  ),
                                ),

                                Container(
                                  width: 50,
                                  child: Column (
                                    children: [
                                      Text(widget.data['colour']),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                widget.data['colour'] == "yellow"?
                                Icon(Icons.thumb_up, color: Colors.green)
                                    : Icon(Icons.thumb_down,  color: Colors.red),
                              ],
                            ),

                          SizedBox(width: 10,height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [

                              Container(
                                width: 100,
                                child: Column (
                                  children: [

                                    Text('proteins'),
                                  ],
                                ),
                              ),

                              Container(
                                width: 50,
                                child: Column (
                                  children: [
                                    Text(widget.data['proteins']),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              widget.data['proteins'] == "nil"?
                              Icon(Icons.thumb_up, color: Colors.green)
                                  : Icon(Icons.thumb_down,  color: Colors.red),
                            ],
                          ),
                          SizedBox(width: 10,height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [


                                Container(
                                  width: 100,
                                  child: Column (
                                    children: [
                                      Text('Red Blood Cells'),
                                    ],
                                  ),
                                ),


                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  child: Column (
                                    children: [
                                      Text(widget.data['red_blood_cells']),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              widget.data['red_blood_cells'] == "5"?
                              Icon(Icons.thumb_up, color: Colors.green)
                                  : Icon(Icons.thumb_down,  color: Colors.red),
                            ],
                          ),
                          SizedBox(width: 10,height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [

                              Container(
                                width: 100,
                                child: Column (
                                  children: [

                                    Text('Pus Cells'),
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                child: Column (
                                  children: [
                                    Text(widget.data['pus_cells']),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              widget.data['pus_cells'] == "6"?
                              Icon(Icons.thumb_up, color: Colors.green)
                                  : Icon(Icons.thumb_down,  color: Colors.red),
                            ],
                          ),
                          SizedBox(width: 10,height: 40,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [

                              Container(
                                width: 100,
                                child: Column (
                                  children: [

                                    Text('bacteruria'),
                                  ],
                                ),
                              ),

                              Container(
                                width: 50,
                                child: Column (
                                  children: [
                                    Text(widget.data['bacteruria']),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              widget.data['bacteruria'] == "nit"?
                              Icon(Icons.thumb_up, color: Colors.green)
                                  : Icon(Icons.thumb_down,  color: Colors.red),
                            ],
                          ),
                          SizedBox(width: 10, height: 30,),
                          Row    (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: Column(
                                  children: [
                                    IconButton(icon: Icon(Icons.event_note_outlined, size: 50,),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes(dataNotes: widget.data)));

                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15, left: 15),
                                      child: Text("Notes"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
              ),

    ),
        ),


    //Navigation
    bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: kUnActiveColor,
    currentIndex: _bottomBarIndex,
    fixedColor: kMainColor,
    onTap: (value) async {
    if (value == 3) {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    await _auth.signOut();
    Navigator.popAndPushNamed(context, LoginScreen.id);
    }
    setState(() {
    _bottomBarIndex = value;
    });
    if (value == 1) {
    Navigator.pushNamed(context, Information.id);
    }
    setState(() {
    _bottomBarIndex = value;
    });
    if (value == 2) {
    Navigator.pushNamed(context, Know.id);
    }
    if (value == 0) {
    Navigator.pushNamed(context, Scan.id);
    }
    setState(() {
    _bottomBarIndex = value;
    });
    },
    items: [
    BottomNavigationBarItem(
    icon: Icon(
    Icons.camera_alt,
    ),
    title: Text('Scan'),
    backgroundColor: kMainColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.perm_device_information,
    ),
    title: Text('Information'),
    backgroundColor: kMainColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.open_in_new_outlined,
    ),
    title: Text('Know analysis'),
    backgroundColor: kMainColor,
    ),
    ],
    ),
    );
    }


  }
