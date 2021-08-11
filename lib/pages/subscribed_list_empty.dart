import 'package:flutter/material.dart';

class SubsribedListEmpty extends StatefulWidget {
  SubsribedListEmpty({Key? key}) : super(key: key);

  @override
  _SubscribedListEmptyState createState() => _SubscribedListEmptyState();
}

class _SubscribedListEmptyState extends State<SubsribedListEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Stack(
            children: [
             
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/image4.png'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 48.0),
                      Text(
                        'Tap to add Currencies',
                        style: TextStyle(
                          fontFamily: 'font1.otf',
                          fontSize: 28.0,
                        ),
                      )
                    ],
                  ),
                ),
            ],
    ),);
  }
}
