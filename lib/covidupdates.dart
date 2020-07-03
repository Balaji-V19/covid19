import 'dart:convert';

import 'package:covid19/districtdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';


class Updates extends StatefulWidget {
  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> with SingleTickerProviderStateMixin{
  bool isloading=true;


  getstatecount() async {
    final response = await http.get('https://api.covidindiatracker.com/state_data.json');
    if(response.statusCode==200){
      var tt=json.decode(response.body);
      print(tt[1]['state']);
      for(Map i in tt){
        print(i['confirmed']);
        setState(() {
          isloading=false;
        });
        updatelist(i);
      }
    }
    else{
      Alert(
        title: 'Something wrong',
        type: AlertType.error,
        context: context,
      ).show();
    }
  }


  List<Widget> ls=[];
  updatelist(i){
    setState(() {
      return ls.add(
        Column(
          children: <Widget>[
            Material(
              elevation: 3.0,
           borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>District(i['state'])));
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white70
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(i['state'],style: TextStyle(fontSize: 20.0),),
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:6.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text('confirmed',style: TextStyle(color: Colors.white),),
                                        Text('${i['confirmed']}',style: TextStyle(color: Colors.white),)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:6.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffFF2D54),
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text('deaths',style: TextStyle(color: Colors.white),),
                                        Text('${i['deaths']}',style: TextStyle(color: Colors.white),)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:6.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff01CD98),
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text('recovered',style: TextStyle(color: Colors.white),),
                                        Text('${i['recovered']}',style: TextStyle(color: Colors.white),)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      );
    });

  }
  var confirm=0,death=0,recovered=0;

  getglobal() async {
    final response = await http.get('https://api.covid19api.com/world/total').catchError((err){
      Alert(
        title: 'Something wrong',
        desc: err.toString(),
        type: AlertType.error,
        context: context,
      ).show();
    });
    if(response.statusCode==200){
      var tt=json.decode(response.body);
        setState(() {
          confirm=tt['TotalConfirmed'];
          death=tt['TotalDeaths'];
          recovered=tt['TotalRecovered'];
        });
    }
    else{
      Alert(
        title: 'Something wrong',
        type: AlertType.error,
        context: context,
      ).show();
    }

  }

  @override
  void initState() {
    super.initState();
    getglobal();
    getstatecount();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Covid19',style: TextStyle(
            color: Colors.white,fontSize: 25.0
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                child: Image.asset('assets/doctor.jpg',fit: BoxFit.fill,),
              ),
              SizedBox(height: 20.0,),
              Text('Global count',style: TextStyle(fontSize: 30.0),),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFF8E35),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('confirmed',style: TextStyle(color: Colors.white),),
                                Text('$confirm',style: TextStyle(color: Colors.white),)
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFF2D54),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('death',style: TextStyle(color: Colors.white),),
                                Text('$death',style: TextStyle(color: Colors.white),)
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff01CD98),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('cured',style: TextStyle(color: Colors.white),),
                                Text('$recovered',style: TextStyle(color: Colors.white),)
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              SizedBox(height: 10.0,),
              Text('Indian count',style: TextStyle(fontSize: 30.0,),),
              SizedBox(height: 30.0,),
              Container(
                width: width*0.9,
                child: Column(
                  children: isloading?<Widget>[
                    Center(child: Text('Loading...')),
                  ]:ls.length>0?ls:<Widget>[Image.asset('assets/empty.png'),]
                ),
              ),
              SizedBox(height: 20.0,)

            ],
          ),
        ),

      ),

    );
  }
}
