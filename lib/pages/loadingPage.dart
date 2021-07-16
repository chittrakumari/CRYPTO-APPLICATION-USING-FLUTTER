import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPage createState() => _LoadingPage();
}

class  _LoadingPage extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      new Container(
          decoration: new BoxDecoration(

            image: new  DecorationImage(
              image: AssetImage('assets/loading_page_image.png'),
              fit: BoxFit.fitWidth,
            ),

          ),

          child:Column(

              children:[
                Row(

                    children:[
                      Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 70.0, 20.0, 0),
                          child: Text('Welcome!',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 70.0,
                              fontFamily: 'font1.otf',
                            ),
                          )
                      )
                    ]
                ),
                SizedBox(height: 360.0),
                Row(
                    children:[
                      Padding(
                          padding: EdgeInsets.fromLTRB(45.0,0, 0, 0),
                          child: Text('Buy Crypto,',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'font1.otf',
                            ),
                          )
                      )
                    ]
                ),
                SizedBox(height: 10.0),



                Row(

                    children:[
                      Padding(
                          padding: EdgeInsets.fromLTRB(46.0,0, 0, 0),
                          child: Text('Sell Crypto',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'font1.otf',
                            ),
                          )
                      )
                    ]
                ),

                SizedBox(height: 10.0),
                Row(

                    children:[
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                          child: Text('Safe fast and simple',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'font1.otf',
                            ),
                          )
                      )
                    ]
                ),
                SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(210.0, 0, 0, 0),
                   child: ButtonTheme(
                    buttonColor: Colors.deepPurple[600],
                    child: RaisedButton(

                  onPressed: (){
                  Navigator.pushReplacementNamed(context, "LoginPage");
                },
                        child: Icon(
                    Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                            size: 26.0,


                ),


                ),
                    shape: CircleBorder(side: BorderSide.none),
                    padding:EdgeInsets.all(18.0),
    ),
                  ),
              ]
          )
      ),
    );

  }
}
