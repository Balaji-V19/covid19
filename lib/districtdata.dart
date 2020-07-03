import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class District extends StatefulWidget {
  String statename;
  District(this.statename);
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  bool isloading=true;


  hello() async {

    final res = await http.get('https://api.covid19india.org/v2/state_district_wise.json');
    if (res.statusCode==200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var ss=json.decode(res.body);
      for(Map i in ss){
        if(i['state']==widget.statename){
          setState(() {
            for(Map j in i['districtData'] ){
              updatelist(j);
            }
            isloading=false;
          });
        }
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
                            child: Text(i['district'],style: TextStyle(fontSize: 20.0),),
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
                                      Text('death',style: TextStyle(color: Colors.white),),
                                      Text('${i['deceased']}',style: TextStyle(color: Colors.white),)
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
                                      Text('cured',style: TextStyle(color: Colors.white),),
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
            SizedBox(height: 20.0,),
          ],
        ),
      );
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hello();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.statename,style: TextStyle(
            color: Colors.white,fontSize: 25.0
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        width: width,
        height: height,
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
