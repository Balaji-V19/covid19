import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Symptoms',style: TextStyle(
          color: Colors.black,fontSize: 25.0
        ),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 25.0,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/sore_throat.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('A sore throat is a painful, dry, or scratchy feeling in the throat.'
                              'Pain in the throat is one of the most common symptoms. It accounts for more '
                              'than 13 million visits to doctor’s offices each year'
                              'Most sore throats are caused by infections, or by environmental factors like dry air. '
                              'Although a sore throat can be uncomfortable, it’ll usually go away on its own.',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/sore-throat')){
                                await launch('https://www.healthline.com/health/sore-throat');
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('A headache is a very common condition that causes pain'
                              ' and discomfort in the head, scalp, or neck. It’s estimated that 7 '
                              'in 10 people have at least one headache each year.'
                              'Headaches can sometimes be mild, but in many cases, they can cause severe pain '
                              'that makes it difficult to concentrate at work and perform other daily activities',textAlign: TextAlign.justify,),
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
                      child: Image.asset('assets/headache.png',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/cough.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Coughing is your body’s way of getting rid of an irritant.'
                              'When something irritates your throat or airway, your nervous system '
                              'sends an alert to your brain. Your brain responds by telling the muscles '
                              'in your chest and abdomen to contract and expel a burst of air.',
                          textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/types-of-coughs')){
                                await launch('https://www.healthline.com/health/types-of-coughs');
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Fever is also known as hyperthermia, pyrexia, or '
                              'elevated temperature. It describes a body temperature that’s '
                              'higher than normal. Fever can affect children and adults.'
                              'A short-term increase in body temperature can help your body fight'
                              ' off illness. However, a severe fever can be a symptom of a serious '
                              'condition that requires immediate medical attention',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/fever')){
                                await launch('https://www.healthline.com/health/fever');
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
                      child: Image.asset('assets/fever.png',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/weakness.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Muscle aches (myalgia) are extremely common. '
                              'Almost everyone has experienced discomfort in their muscles at some point.'
                              'Because there’s muscle tissue in nearly all parts of the body, this type of pain '
                              'can be felt practically anywhere. However, there’s no single cause for muscle aches and pains.'
                              'While overuse or injury is common, there are other possible explanations for ongoing discomfort.',
                            textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/muscle-aches#common-causes')){
                                await launch('https://www.healthline.com/health/muscle-aches#common-causes');
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Nasal congestion, also called a stuffy nose, '
                              'is often a symptom of another health problem such as a '
                              'sinus infection. It may also be caused by the common cold.'
                              'Home remedies may be enough to alleviate nasal congestion, '
                              'particularly if it’s caused by the common cold. However, if you '
                              'experience long-term congestion, you may need medical treatment.',textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/nasal-congestion')){
                                await launch('https://www.healthline.com/health/nasal-congestion');
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
                      child: Image.asset('assets/rhinitis.png',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: width*0.4,
                      child: Image.asset('assets/breath.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Experiencing breathing difficulty describes '
                              'discomfort when breathing and feeling as if you can’t draw a '
                              'complete breath. This can develop gradually or come on suddenly.'
                              ' Mild breathing problems, such as fatigue after an aerobics class, '
                              'don’t fall into this category.'
                              'Breathing difficulties can be caused by many different conditions.'
                              ' They can also develop as a result of stress and anxiety.',
                            textAlign: TextAlign.justify,),
                          GestureDetector(
                            onTap: ()async{
                              if(await canLaunch('https://www.healthline.com/health/breathing-difficulties')){
                                await launch('https://www.healthline.com/health/breathing-difficulties');
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
