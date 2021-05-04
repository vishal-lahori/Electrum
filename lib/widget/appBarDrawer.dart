import 'package:electrum/view/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AppBarDrawer extends StatefulWidget {
  final String userName, email;

  AppBarDrawer({this.userName, this.email});

  @override
  _AppBarDrawerState createState() => _AppBarDrawerState();
}

class _AppBarDrawerState extends State<AppBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 90.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColorLight
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/person.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Welcome ${widget.userName}",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${widget.email}',
                  style: TextStyle(
                    color: Colors.indigoAccent[100],
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.home,
                    size: 28,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                  leading: Icon(
                    Icons.logout,
                    size: 28,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
