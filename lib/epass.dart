import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Epass extends StatefulWidget {
  @override
  _EpassState createState() => _EpassState();
}

class _EpassState extends State<Epass> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Epass',style: TextStyle(
            color: Colors.white,fontSize: 25.0
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 25.0,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Container(child: Image.asset('assets/travel1.jpg',fit: BoxFit.fill,),width: width*0.9
                ,height: 250,),
              SizedBox(height: 20.0,),
              _elements(width,'Andaman and Nicobar','https://southandaman.nic.in/whos-who/',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Chandigarh','http://admser.chd.nic.in/dpc/',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Goa','https://goaonline.gov.in/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'Jharkhand','https://ranchi.nic.in/e-pass/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Maharashtra','https://covid19.mhpolice.in/',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Nagaland','https://www.iamstranded.nagaland.gov.in/',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),
              _elements(width,'Sikkim','https://eservices.sikkim.gov.in/directApply.do?serviceId=1364',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Uttarakhand','http://smartcitydehradun.uk.gov.in/e-pass',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Andhra Pradesh','https://www.spandana.ap.gov.in/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'Chhattisgarh','https://raipur.gov.in/cg-covid-19-epass/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Gujarat','https://www.digitalgujarat.gov.in/Citizen/CitizenService.aspx',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Karnataka','https://sevasindhu.karnataka.gov.in/Sevasindhu/English',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),


              _elements(width,'Manipur','https://tengbang.in/',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Odisha','https://covid19.odisha.gov.in/',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Tamil Nadu','https://tnepass.tnega.org/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'West Bengal','https://coronapass.kolkatapolice.org/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Arunachal Pradesh','http://18.206.76.226/covid19portal/scr/register/',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Dadra and Nagar Haveli','http://dnh.nic.in/Departments/COVID19.aspx',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),
              _elements(width,'Haryana','https://edisha.gov.in/eForms/MigrantService',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Kerala','https://covid19jagratha.kerala.nic.in/home/addDomestic',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Meghalaya','https://megedistrict.gov.in/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'Puducherry','https://epass.py.gov.in/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Telengana','https://policeportal.tspolice.gov.in/',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Assam','https://eservices.assam.gov.in/directApply.do?serviceId=1533',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),



              _elements(width,'Daman and Diu','https://epass.dddcovid19.in/',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Himachal Pradesh','http://covid19epass.hp.gov.in/',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Ladakh','https://leh.nic.in/epass/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'Mizoram','https://mcovid19.mizoram.gov.in/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Punjab','http://covidhelp.punjab.gov.in/',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Tripura','https://covid19.tripura.gov.in/',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),
              _elements(width,'Bihar','https://serviceonline.bihar.gov.in/',Color(0xffE76984)),
              SizedBox(height: 20.0,),
              _elements(width,'Delhi','https://epass.jantasamvad.org/epass/relief/english/',Color(0xffFF8E35)),
              SizedBox(height: 20.0,),
              _elements(width,'Jammu and Kashmir','http://jkmonitoring.nic.in/',Color(0xff01CD98)),
              SizedBox(height: 20.0,),
              _elements(width,'Lakshadweep','https://lakshadweep.gov.in/service/epass-covid19-interstate-movement-pass/',Color(0xff3598DC)),
              SizedBox(height: 20.0,),
              _elements(width,'Madhya Pradesh','https://mapit.gov.in/covid-19/',Color(0xff9A59B5)),
              SizedBox(height: 20.0,),
              _elements(width,'Rajasthan','https://sso.rajasthan.gov.in/signin',Color(0xff2D3E50)),
              SizedBox(height: 20.0,),
              _elements(width,'Uttar Pradesh','http://jansunwai.up.nic.in/',Color(0xffE76984)),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }

  _elements(width,statename,link,color) {
    return Material(
      elevation: 4.0,
      shadowColor: color,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: width*0.9,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white
        ),
        child: GestureDetector(
          onTap: () async {
            if(await canLaunch('$link')){
            await launch('$link');
            }
          },
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$statename',
                  style: TextStyle(fontSize: 25.0,color: color),),
              ),),
              Divider(thickness: 0.5,color: Colors.black45,),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Click here to apply for the Epass',style: TextStyle(color: Colors.blue,
                    decoration: TextDecoration.underline),),
              ),)
            ],
          ),
        ),

      ),
    );
  }
}
