import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[900],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/14955805_877366299064558_3716362908065848767_n.jpg'),
                  )),
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Vincent Mark Erese',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text('May 13, 1999',
                style: TextStyle(fontSize: 19, color: Colors.white)),
            SizedBox(
              height: 30,
            ),
            Text('BSIT', style: TextStyle(fontSize: 19, color: Colors.white)),
            Text('Ateneo de Davao\n University',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
