import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Mama Gang',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mama gang we look at your fashion',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
