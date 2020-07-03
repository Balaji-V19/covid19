import 'package:covid19/Homepage.dart';
import 'package:covid19/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MaterialApp(home:checkuser()));



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/splash.png',fit: BoxFit.cover,),
              ),
            ),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>checkuser()));
                    },
                    elevation: 3.0,
                    color: Colors.white,
                    child: Text('Next->'),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}


class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> with TickerProviderStateMixin{
  Animation delayanimation,ordanim;
  Animation<double> animation,anim;
  AnimationController animationController;
  TextEditingController email,pswd;
  static final key=GlobalKey<ScaffoldState>();
  bool sel=true;
  ProgressDialog pd;

  @override
  void initState() {

    email=TextEditingController(text:"");
    pswd=TextEditingController(text:"");
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=Tween<double>(begin: 100.0,end: -75.0).animate(animationController)..addListener((){
      setState(() {
      });
    });
    ordanim=Tween(begin: 100,end: -50.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
    ));
    delayanimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5,1.0,curve: Curves.easeInOut)
    ));
    anim=Tween<double>(begin: 0,end: -250.0).animate(animationController)..addListener((){
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
    pd=ProgressDialog(context);
    pd.style(
      message: 'Please wait',
      elevation: 7.0,
      borderRadius: 2.0,
      backgroundColor: Colors.white,
    );
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    animationController.forward();
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
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
                        offset: Offset(-150,-anim.value/5),
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
                        offset: Offset(-150,anim.value),
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
                        offset: Offset(20,animation.value*0.6),
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
//                    Padding(
//                      padding: const EdgeInsets.all(20.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text('Covid Snap',style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 30.0
//                          ),),
//                        ],
//                      ),
//                    )

                  ],
                ),
              ),
              SingleChildScrollView(
                child: Transform(
                  transform: Matrix4.translationValues(delayanimation.value*width, 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Login',style: TextStyle(
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
                          obscureText: sel,
                          controller: pswd,
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
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text('Forget password ?',style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0
                            ),),
                            RaisedButton(
                              onPressed: (){
                                if(email.text.isEmpty || pswd.text.isEmpty){
                                  Alert(
                                      context: context,
                                      title: 'Warning',
                                      desc: 'Please enter valid email and password',
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
                                }
                                else{
                                  pd.show();
                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.toString(), password: pswd.text.toString())
                                      .then((suc){
                                    pd.hide();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
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
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account",style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xff403D52),
                                fontStyle: FontStyle.italic
                            ),),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=> Signin()));
                              },
                              child: Text(" Sign in",style: TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class checkuser extends StatefulWidget {
  @override
  _checkuserState createState() => _checkuserState();
}

class _checkuserState extends State<checkuser> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
        if(!snapshot.hasData || snapshot.data==null){
          return Myapp();
        }else{
          return Homepage();
        }

      },
    );
  }
}

