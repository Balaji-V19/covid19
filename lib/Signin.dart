import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin>  with TickerProviderStateMixin{

  static final key=GlobalKey<ScaffoldState>();
  Animation delayanimation,ordanim;
  Animation<double> animation,anim;
  AnimationController animationController;
  TextEditingController email,pswd,name, prof,gender,phone;
  bool sel=true;
  ProgressDialog pd;

  @override
  void initState() {
    phone=TextEditingController(text:"");
    email=TextEditingController(text:"");
    pswd=TextEditingController(text:"");
    name=TextEditingController(text:"");
    prof=TextEditingController(text:"");
    gender=TextEditingController(text:"");
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=Tween<double>(begin: -100,end: 10).animate(animationController)..addListener((){
      setState(() {
      });
    });
    ordanim=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
    ));
    delayanimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5,1.0,curve: Curves.easeInOut)
    ));
    anim=Tween<double>(begin: 300,end: -550).animate(animationController)..addListener((){
      setState(() {
      });
    });


    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    animationController.forward();
    pd=ProgressDialog(context);
    pd.style(
      message: 'Please wait',
      elevation: 6.0,
      backgroundColor: Colors.white,
      borderRadius: 2.0,
    );
    return Scaffold(
      key: key,
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                height: height*0.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: width,
                      height: height*0.5,
                      child: Image.asset('assets/lo.png',fit: BoxFit.cover,),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0,0.7),
                      child: Transform.translate(
                        offset: Offset(150,-anim.value/5),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/smallcorona.png')
                              )
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0,0.7),
                      child: Transform.translate(
                        offset: Offset(0,animation.value*0.6),
                        child: Container(
                          width: width,
                          height: height*0.38,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/corona.png')
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Transform(
                  transform: Matrix4.translationValues(delayanimation.value*width, 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Sign in',style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                            ),),
                          ],
                        ),
                      ),

                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: Icon(Icons.email),

                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: Icon(Icons.person),

                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: Icon(Icons.phone_android),

                          ),
                        ),
                      ),

                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: gender,
                          decoration: InputDecoration(
                            hintText: "Gender",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: Icon(Icons.person_pin),

                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: pswd,
                          obscureText: sel,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: IconButton(icon:Icon(sel?Icons.visibility_off:Icons.visibility),onPressed: (){
                              setState(() {
                                sel=!sel;
                              });
                            },),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: TextField(
                          controller: prof,
                          obscureText: sel,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            suffixIcon: IconButton(icon:Icon(sel?Icons.visibility_off:Icons.visibility),onPressed: (){
                              setState(() {
                                sel=!sel;
                              });
                            },),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: (){
                                if(email.text.isEmpty || pswd.text.isEmpty || phone.text.isEmpty || prof.text.isEmpty ||
                                    name.text.isEmpty || gender.text.isEmpty){
                                  Alert(
                                      context: context,
                                      title: 'Warning',
                                      desc: 'Please enter all the fields',
                                      type: AlertType.warning,
                                      buttons: [
                                        DialogButton(
                                          child: Text('Okay'),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          width: 50.0,
                                        )
                                      ]
                                  ).show();

                                }else{
                                  pd.show();
                                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.toString(), password: pswd.text.toString())
                                      .then((suc) async{
                                    FirebaseUser user=await FirebaseAuth.instance.currentUser();
                                    var id=user.uid;
                                    Firestore.instance.collection('Userdata').document(id).setData({'email':email.text,'Name':name.text,
                                      'Phone':phone.text,'Gender':gender.text,
                                      'Id':id.toString()})
                                        .then((su){
                                      pd.hide();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                                    }).catchError((e){
                                      pd.hide();
                                      Alert(
                                          context: context,
                                          title: 'Error',
                                          desc: '$e',
                                          type: AlertType.error,
                                          buttons: [
                                            DialogButton(
                                              child: Text('Okay'),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              width: 50.0,
                                            )
                                          ]
                                      ).show();
                                    });

                                  }).catchError((err){
                                    pd.hide();
                                    Alert(
                                        context: context,
                                        title: 'Error',
                                        desc: '$err',
                                        type: AlertType.error,
                                        buttons: [
                                          DialogButton(
                                            child: Text('Okay'),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            width: 50.0,
                                          )
                                        ]
                                    ).show();
                                  });
                                }

                              },
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 6.0,
                              color: Color(0xff403D52),
                              child: Text('Submit',style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Already have an account",style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xff403D52),
                                fontStyle: FontStyle.italic
                            ),),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Text(" Log in",style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                              ),),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 60.0,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
