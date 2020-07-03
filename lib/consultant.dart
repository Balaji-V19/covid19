import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Consultant extends StatefulWidget {
  @override
  _ConsultantState createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  TextEditingController tx;
  ScrollController _scrollController = ScrollController();
  List<Widget> lt = [];
  bool isloading = true;
  ostrue() async {
    await Firestore.instance
        .collection('Group chat')
        .orderBy('Time', descending: false)
        .getDocuments()
        .then((suc) {
      if (suc.documents.isNotEmpty) {
        isloading = false;
      }
    }).catchError((err) {
      print('$err');
    });
  }

  getuserchat() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var id;
    setState(() {
      id = user.uid;
    });
    await Firestore.instance
        .collection('Group chat')
        .orderBy('Time', descending: false)
        .getDocuments()
        .then((va) {
      setState(() {
        isloading = false;
      });
      va.documents.forEach((fe) {
        bool ri = false;
        if (fe.data['Id'] == id) {
          setState(() {
            ri = true;
          });
        } else {
          setState(() {
            ri = false;
          });
        }
        DateTime tody =
        DateTime.fromMillisecondsSinceEpoch(int.parse(fe.data['Time']));
        var dt = DateFormat("dd/MM/yyyy").format(tody);
        var td = DateTime.now();
        bool t = false;
        if (DateFormat("dd/MM/yyyy").format(td) == dt) {
          t = true;
        }
        List tt = [
          'assets/pro1.jpg','assets/pro2.jpg','assets/pro3.jpg','assets/pro4.jpg','assets/pro5.png','assets/pro6.png',
          'assets/pro7.jpg','assets/pro8.jpg','assets/pro9.jpg','assets/pro10.jpg','assets/pro11.jpg','assets/pro12.jpg',
        ];
        var ran = Random();
        var l = ran.nextInt(tt.length);
        var hrs = DateFormat("hh:mm").format(tody);
        setState(() {
          lt.add(Column(
            crossAxisAlignment:
            ri ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              ri
                  ? Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    fe.data['Name'],
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(tt[l]),
                    ),
                  ),

                ],
              )
                  : Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(tt[l]),
                    ),
                  ),
                  Text(
                    fe.data['Name'],
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ri?Padding(
                padding:
                const EdgeInsets.only(right: 25.0, top: 10.0, bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${fe.data['msg']}',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '${t ? hrs : dt}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10.0),
                        ),
                      )
                    ],
                  ),
                ),
              ):Padding(
                padding:
                const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${fe.data['msg']}',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '${t ? hrs : dt}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ));
        });
      });
    }).catchError((err) {
      print('here is the error');
      print('$err');
    });
  }

  @override
  void initState() {
    ostrue();
    print(lt.length);
    getuserchat();
    super.initState();
    tx = TextEditingController(text: '');
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFF2D54),
        title: Text('Consult doctor'),
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Column(
                  children: isloading
                      ? <Widget>[
                    Center(
                      child: Text('Loading....'),
                    ),
                  ]
                      : lt.length > 0
                      ? lt
                      : <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    Image.asset(
                      'assets/empty.png',
                      fit: BoxFit.cover,
                    ),
                    Text('No Chats here'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              width: width,
              child: TextField(
                controller: tx,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Enter message',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xffFF2D54),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                        var id;
                        setState(() {
                          id = user.uid;
                        });
                        var name, msg;
                        setState(() {
                          msg = tx.text;
                        });
                        tx.clear();
                        if (msg.toString().isEmpty || msg == null) {
                        } else {
                          await Firestore.instance
                              .collection('Userdata')
                              .document(id)
                              .get()
                              .then((suc) {
                            setState(() {
                              name = suc.data['Name'];
                              print(name);
                            });
                          }).catchError((err) {
                            Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                            ).show();
                          });
                          await Firestore.instance
                              .collection('Group chat')
                              .add({
                            'Name': name,
                            'msg': msg,
                            'Id': id,
                            'Time':
                            DateTime.now().millisecondsSinceEpoch.toString()
                          }).catchError((err) {
                            Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                            ).show();
                          });
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                          setState(() {
                            isloading=true;
                          });
                          lt.clear();
                          getuserchat();
                        }
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
