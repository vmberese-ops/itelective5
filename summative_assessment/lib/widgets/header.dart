import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  final String title;
  const Header({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          child: Text(
            title,
            textAlign: TextAlign.start,
          ),
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
