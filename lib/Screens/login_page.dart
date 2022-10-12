import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:loginpage/models/user.dart';
import 'package:loginpage/Screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        leading: Icon(
          Icons.account_balance,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 300,
                height: 300,
                child: Image.asset('assets/Logo.png'),
              ),
              ///////Input text form fields (username, password).........
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (value) {},
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your username",
                          hintText: 'username',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your password",
                          hintText: 'pssword',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //////Login button .......
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: 200,
                child: ElevatedButton(
                  onPressed: loginButtonClick,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginButtonClick() {
    if (_usernameController.text == 'user123' &&
        _passwordController.text == '12345') {
      print('Login success');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Login Fail');
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Ok'));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong username and password'),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
