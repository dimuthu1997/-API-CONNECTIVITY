import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginpage/Screens/user_screen.dart';
import 'package:loginpage/Services/rest_api_service.dart';
import 'package:loginpage/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();

  @override
  void initState() {
    super.initState();
    apiService.getUsers().then((value) {
      if (value != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: apiService.getUsers(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserScreen(user: snapShot.data![index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    color: Colors.grey.withOpacity(0.3))
                              ]),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListTile(
                            title: Text(
                              snapShot.data![index].username,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            subtitle: Text(
                              snapShot.data![index].email,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            leading: ClipOval(
                                child: Image.network(
                              snapShot.data![index].urlAvatar,
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            )),
                            trailing: IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Text(
                        'Loading....',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
