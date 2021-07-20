import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
      child: SpinKitChasingDots(color: Colors.deepPurple,
      size: 60.0,)
    );
  }
}
