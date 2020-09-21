import 'package:flutter/material.dart';

class CircularProgressCenter extends StatelessWidget {
  const CircularProgressCenter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
