import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/consultant.dart';
import 'package:covid19/covidupdates.dart';
import 'package:covid19/epass.dart';
import 'package:covid19/mydev.dart';
import 'package:covid19/precations.dart';
import 'package:covid19/symptoms.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/privacy.dart';

const String testDevice='6A240A6CD0E192EF8FD7670C58916030';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Offset _offset=Offset(0,0);
  GlobalKey globalKey=GlobalKey();
  List<double> limits=[];
  bool ismenu=false;
  bool isuser=false,isloaing=true;
  var id;
  var username='';
  static const MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
    testDevices: testDevice!=null?<String>[testDevice]:null,
    nonPersonalizedAds: true,
    keywords: <String>['Game','Mario'],
  );
  InterstitialAd _interstitialAd;
  InterstitialAd createInterstitialAd(){
    return InterstitialAd(
        adUnitId: "ca-app-pub-9474181461181417/2402017736",
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event){
          print('InterstitialAd $event');
        }
    );
  }



  userna() async{
    var user='';
    FirebaseUser us=await FirebaseAuth.instance.currentUser();
    user=us.uid;
    await Firestore.instance.collection('Userdata').document(user).get().
    then((val) => username=val.data['Name']).catchError((err){
      print(err);
    });
  }

  List<Widget> lt=[];

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-9474181461181417~8336870697");
    Future.delayed(Duration(minutes: 6)).then((value){
      _interstitialAd=createInterstitialAd()..load()..show();
    }).whenComplete(() {
      Future.delayed(Duration(minutes: 10)).then((value){
        _interstitialAd=createInterstitialAd()..load()..show();
      }).whenComplete(() {
        Future.delayed(Duration(minutes: 10)).then((value){
          _interstitialAd=createInterstitialAd()..load()..show();
        });
      });
    });


    limits=[0,0,0,0,0,0,0];
    userna();
    WidgetsBinding.instance.addPostFrameCallback(getposition);
    super.initState();
  }

  getposition(duration){
    RenderBox renderBox=globalKey.currentContext.findRenderObject();
    final position=renderBox.localToGlobal(Offset.zero);
    double start=position.dy-20;
    double conlim=position.dy+renderBox.size.height-20;
    double step=(conlim-start)/6;
    limits=[];
    for(double x=start;x<=conlim;x=x+step){
      limits.add(x);
    }
    setState(() {
      limits=limits;
    });
  }

  double getsize(int x){
    double size=(_offset.dy>limits[x] && _offset.dy<limits[x+1])?22:18;
    return size;
  }

  var v;
  bool tt=false;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    if(height<700){
      tt=true;
    }
    if(width<350){
      v=width*0.75;
    }
    else{
      v=width*0.65;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 80.0,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(height: 150,
                        width: width*0.9,
                          color: Color(0xffE76984),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(child: Image.asset('assets/sym.png',fit: BoxFit.cover,)),
                              ),
                              Expanded(
                                child: Text('You can check yourself by this app and you can check the corona updates through this application ',style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Material(
                            elevation: 6.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Updates()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: width*0.45,
                                  height: 100,
                                  color: Color(0xffFF8E35),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset('assets/corona1.png',fit: BoxFit.cover,),
                                        width: 50.0,
                                        height: 50.0,
                                      ),
                                      Text('Covid 19',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: 6.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Epass()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: width*0.45,
                                  height: 100,
                                  color: Color(0xff01CD98),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset('assets/truck.png',fit: BoxFit.cover,),
                                        height: 50.0,
                                      ),
                                      Text('Epass',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Material(
                            elevation: 6.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Precations()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: width*0.45,
                                  height: 100,
                                  color: Color(0xff2D3E50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset('assets/sympt.png',fit: BoxFit.cover,),
                                        width: 50.0,
                                        height: 50.0,
                                      ),
                                      Text('Precations',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: 6.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Symptoms()));
                              },
                              child: Container(
                                width: width*0.45,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xff9A59B5),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Image.asset('assets/symptoms.png',fit: BoxFit.cover,),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                    Text('Symptoms',style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Material(
                            elevation: 6.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Consultant()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: width*0.45,
                                  height: 100,
                                  color: Color(0xffFF2D54),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset('assets/doctor1.png',fit: BoxFit.cover,),
                                        width: 50.0,
                                        height: 80.0,
                                      ),
                                      Text('Consult doctor',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 50.0,),
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                height: 50.0,
                color: Colors.white,
                child: Material(
                  elevation: 4.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,),
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              ismenu=true;
                            });
                          },
                          icon: Icon(Icons.menu,size: 30,color: Colors.black,),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Text('Covid Snap',style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1500),
                left: ismenu?0:-(v),
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: v,
                  child: GestureDetector(
                    onPanUpdate: (update){
                      if(update.localPosition.dx<=v) {
                        setState(() {
                          _offset = update.localPosition;
                        });
                      }
                      if(update.localPosition.dx>(v)-20 && update.delta.distanceSquared>2){
                        setState(() {
                          ismenu=true;
                        });
                      }
                    },
                    onPanEnd: (det){
                      setState(() {
                        _offset=Offset(0,0);
                      });

                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(v,height),
                          painter: drawpaint(offset: _offset),
                        ),
                        Container(
                          height: height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue,Colors.blue]
                              )
                          ),
                          width: v,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                height: height*0.23,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(60.0),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle
                                          ),
                                          child: Image.asset('assets/breath.png',fit: BoxFit.cover,),
                                          //TODO:here we have to add the user's profile url link
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(username,style: TextStyle(color: Colors.white),),
                                      //todo user name
                                    ],
                                  ),
                                ),
                              ),
                              Divider(thickness: 1,),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: height/1.8,
                                child: Column(
                                  children: <Widget>[
                                    Mywidget(
                                      text: 'Home',
                                      icondata: Icons.home,
                                      textsize: getsize(0),
                                      height: (height/2)/6,
                                      x: 1,
                                    ),
                                    Mywidget(
                                      text: 'Updates',
                                      icondata: Icons.unarchive,
                                      textsize: getsize(1),
                                      height: (height/2)/6,
                                      x: 2,
                                    ),
                                    Mywidget(
                                      text: 'Consultant',
                                      icondata: Icons.laptop_chromebook,
                                      textsize: getsize(2),
                                      height: (height/2)/6,
                                      x: 3,
                                    ),
                                    Mywidget(
                                      text: 'Privacy Policy',
                                      icondata: Icons.settings,
                                      textsize: getsize(3),
                                      height: (height/2)/6,
                                      x: 4,
                                    ),
                                    Mywidget(
                                      text: 'About Developer',
                                      icondata: Icons.settings_applications,
                                      textsize: getsize(4),
                                      height: (height/2)/6,
                                      x: 5,
                                    ),
                                    Mywidget(
                                      text: 'Log out',
                                      icondata: Icons.exit_to_app,
                                      textsize: getsize(5),
                                      height: (height/2)/6,
                                      x: 6,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: (ismenu)?10:v,
                          bottom: 30,
                          child: IconButton(
                            enableFeedback: true,
                            icon: Icon(Icons.keyboard_backspace,size: 30,color: Colors.white,),
                            onPressed: (){
                              lt.clear();
                              setState(() {
                                isloaing=true;
                              });
                              setState(() {
                                ismenu=false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
        ),

      ),
    );
  }
}
class Mywidget extends StatefulWidget {
  final String text;
  final IconData icondata;
  final double textsize;
  final double height;
  final int x;
  Mywidget({this.text,this.icondata,this.textsize,this.height,this.x});

  @override
  _MywidgetState createState() => _MywidgetState();
}

class _MywidgetState extends State<Mywidget> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: widget.height,
      onPressed: (){
        if(widget.x==5){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Mydet()));
        }
        if(widget.x==6){
          FirebaseAuth.instance.signOut();
        }
        if(widget.x==2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Updates()));
        }
        if(widget.x==3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Consultant()));
        }
        if(widget.x==4){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacy()));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(widget.icondata,color: Colors.white,),
          SizedBox(width: 10,),
          Text(widget.text,style: TextStyle(color: Colors.white,fontSize: widget.textsize),)
        ],
      ),
    );
  }
}







class drawpaint extends CustomPainter{
  final Offset offset;
  drawpaint({this.offset});
  double getcon(double width){
    if(offset.dx==0){
      return width;
    }
    else{
      return offset.dx>width?offset.dx:width+75;
    }
  }
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()..color=Colors.blue..style=PaintingStyle.fill;
    Path path=Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(getcon(size.width),offset.dy,size.width,size.height);
    path.lineTo(-size.width, size.height);
    path.close();
    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}