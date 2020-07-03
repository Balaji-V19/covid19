import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Precations extends StatefulWidget {
  @override
  _PrecationsState createState() => _PrecationsState();
}

class _PrecationsState extends State<Precations> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Precations',style: TextStyle(
            color: Colors.black,fontSize: 25.0
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 25.0,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Stay home ',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/stayhome.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('I have to admit that I’m the opposite of these people. I enjoy '
                              'staying home. I save up my errands until I have a nice long list and '
                              'then go take care of it all at one time. I don’t go out just to go. I '
                              'need to have a compelling reason and just running out for one thing or to '
                              'cure cabin fever isn’t a reason for me to go out. Even around the holidays I '
                              'stay in (thank you, online shopping), preferring to avoid the crowds and craziness.',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.savingadvice.com/articles/2013/01/04/1013284_11-benefits-of-staying-home.html')){
                                await launch('https://www.savingadvice.com/articles/2013/01/04/1013284_11-benefits-of-staying-home.html');
                              }
                            },
                            child: Text('Read more',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('KEEP a safe distance',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Ministers are reported to be considering whether '
                              'to relax the two-metre rule for social distancing in workplaces.'
                              'It could make it easier for people to get back to jobs where it is '
                              'not always feasible to stay apart.'
                              'But a key question is whether that would be safe, given how little '
                              'is known about how far the virus can spread.',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/headache')){
                                await launch('https://www.healthline.com/health/headache');
                              }
                            },
                            child: Text('Read more',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/social.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('WASH hands often',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/handwash.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Proper handwashing not only reduces the '
                              'spread of Coronavirus (COVID-19), it can prevent the'
                              ' spread of other viral illnesses such as cold and flu. '
                              'Handwashing also reduces the risk of getting other easily '
                              'spread infections, such SARS (severe acute respiratory syndrome) '
                              'and MERS (Middle East respiratory syndrome).',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://familydoctor.org/handwashing-and-covid-19/')){
                                await launch('https://familydoctor.org/handwashing-and-covid-19/');
                              }
                            },
                            child: Text('Read more',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('COVER your cough',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Recent studies suggest that coronavirus disease 2019 '
                              '(COVID-19) may be transmitted by infected persons even '
                              'in the absence of symptoms of disease. While social distancing '
                              'and good hand hygiene are the most important methods to prevent '
                              'virus transmission, new guidelines state that healthy individuals'
                              ' can consider wearing masks in public settings, particularly when physical '
                              'distancing is difficult (like in grocery stores or pharmacies). Primary'
                              ' benefits of wearing a mask include limiting the spread of the virus from '
                              'someone who knows or does not know they have an infection to others.',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/headache')){
                                await launch('https://www.healthline.com/health/headache');
                              }
                            },
                            child: Text('Read more',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/covidmask.png',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('SICK? Call the helpline',style: TextStyle(fontSize: 30,color: Colors.redAccent),),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/phonecall.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('NEW DELHI: As India sees a surge in novel coronavirus cases, '
                              'the Union Health Ministry on Monday activated a toll-free 24x7 '
                              'national helpline number, 1075, to address queries related to the '
                              'infection.The previous helpline number, 011-239 78046, will also remain operational, the ministry officials said.'
                              'Besides the toll-free numbers,the ministry also issued a helpline email ID ncov2019@gmail.com.'),
                       GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf')){
                                await launch('https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf');
                              }
                            },
                            child: Text('Read more',style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }
}
