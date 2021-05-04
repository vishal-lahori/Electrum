import 'package:electrum/provider/usersProvider.dart';
import 'package:electrum/view/addUser.dart';
import 'package:electrum/widget/appBarDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final String userName, email;

  Dashboard({this.userName, this.email});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void afterBuildFunction(BuildContext context) {
    var usersProvider = Provider.of<UsersProvider>(context, listen: false);

    usersProvider.getUsersFun(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterBuildFunction(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.indigo,
        title: Text("Users List"),
      ),
      drawer: AppBarDrawer(
        userName: widget.userName,
        email: widget.email,
      ),
      body: Consumer<UsersProvider>(builder: (context, usersProvider, c) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: usersProvider.usersList.length,
                itemBuilder: (context, index) {
                  final String key =
                      usersProvider.usersList[index].id.toString();
                  return Dismissible(
                    key: Key(key),
                    onDismissed: (direction) {
                      setState(() {
                        usersProvider.usersList.removeAt(index);

                        usersProvider.deleteUsersFun(context,
                            usersProvider.usersList[index].id.toString());
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "ID - ${usersProvider.usersList[index].id} is deleted !!")));
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                usersProvider.usersList[index].avatar,
                                height: 70,
                                width: 70,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "${usersProvider.usersList[index].firstName} ${usersProvider.usersList[index].lastName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child:
                                    Text(usersProvider.usersList[index].email),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      }),
      floatingActionButton: getFloatingActionBtn(),
    );
  }

  Widget getFloatingActionBtn() {
    return FloatingActionButton(
      onPressed: () {
        return showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AddUser();
          },
          animationType: DialogTransitionType.slideFromBottomFade,
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
        );
      },
      child: Icon(Icons.person_add_alt_1_sharp),
    );
  }
}
