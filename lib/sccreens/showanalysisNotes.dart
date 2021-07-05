import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Services/auth.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Notes extends StatefulWidget {
  final Map<String, dynamic> dataNotes;

  Notes({this.dataNotes});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  bool isExpand = false;

  VoiceController _voiceController;
  String text ="It is 600 to 2500 ml /24 hours, and the average volume is 1200 ml/24 hours.";
  String text1 ="There not be enough blood in the urine to change the color, but in severe cases, the urine may look pink, red, or tea colored.";
  String text2 =" Normal numbers of pus cells are up to 5 in males and may be up to 10 in females";
  String text3 ="Dr/ IBRAHIM  urology doctor";
  String text4 ="Your Analysis of Volume is";

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    isExpand = false;
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

  _playVoice1() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text1,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice2() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text2,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice3() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text3,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice4() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text4,
        VoiceControllerOptions(),
      );
    });
  }


  _stopVoice() {
    _voiceController.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: kMainColor,
          title: Text("Notes of analysis", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          centerTitle: true,
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
        ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                widget.dataNotes['collection'] == "random"? Text("")
:                ExpansionTile(
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        "Collection",
                        //widget.dataNotes['aspect'],
                        style: TextStyle(fontSize: 18),
                      ),

                    ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['collection']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                      setState(() {
                        isExpand = value;
                      });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Column(
                             children: [
                               IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              // Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                             ],
                           ),
                           Column(
                             children: [
                               Text("Your Analysis of Collection is"),
                             ],
                           )
                         ],
                       ),

                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['volume'] == "Sample"? Text(""):
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Volume",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['volume']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              ],
                            ),
                            Column(
                              children: [
                                 Container(
                                     width: 250,
                                     child: Text("$text")),                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['colour'] == "yellow"? Text(""):
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Color",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['colour']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Your Analysis of Color is"),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['proteins'] == "nil"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Proteins",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['proteins']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Your Analysis of Protiens is "),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['red_blood_cells'] == "5"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Red Blood Cells",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['red_blood_cells']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice1)
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 250,
                                    child: Text("$text1 ")),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['pus_cells'] == "6"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Pus Cells",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['pus_cells']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice2)
                              ],
                            ),
                            Column(
                              children: [

                                Container(
                                  width: 250,
                                    child: Text("$text2")
                                ),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['bacteruria'] == "nit"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Bacteruria",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['bacteruria']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                              ],
                            ),
                            Column(
                              children: [
                                 Text("Your Analysis of Red Blood Cells is"),                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),

              ],
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text("Recomended Doctor", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(0)),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(width: 200,child: Text("press on this icon to search for urology doctor", style: TextStyle(color: Colors.black),)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Column(
                                    children: [
                                      IconButton(icon: Icon(Icons.location_on_outlined, color: Colors.orange,size: 50,), onPressed: urologyDoctor)
                                    ],
                                  ),
                                )
                              ],
                            )


                          ],
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
            /*Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text("Recomended Analysis", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20.0)),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text("", style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            /*Row(
                              children: [
                                Column(
                                  children: [
                                    Text("urology doctor", style: TextStyle(color: Colors.grey[500]),),
                                    Text("urology doctor", style: TextStyle(color: Colors.grey[500]),),
                                    IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice3)
                                  ],
                                ),
                                Column(
                                  children: [

                                  ],
                                )
                              ],
                            )*/

                          ],
                        ),
                      ),
                      Icon(Icons.star_border, color: Colors.yellow,),
                    ],
                  ),

                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  urologyDoctor() async{
    const url1 ='https://www.google.com/maps/search/?api=1&query=urology+doctor';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

}
