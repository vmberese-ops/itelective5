import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  final String title;
  const Header({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          child: Text(
            title,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 120,
        ),
        InkWell(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: Image(
            height: 35,
            image: AssetImage('assets/user.png'),
          ),
        )
      ],
    );
  }
}
