import 'package:flutter/material.dart';
import '../screen/moviel_list_page.dart';
import '../models/user.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;
  bool isLoginFailed = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username == user1.username && password == user1.password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MovieListPage()),
      );
    } 
    else {
      setState(() {
        isLoggedin = false;
        isLoginFailed = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Incorrect username or password.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLoggedin) ...[
                Text('Selmaat Datang di By You Scope'),
                SizedBox(height: 20),
                _usernameField(_usernameController, isLoginFailed),
                _passwordField(_passwordController, isLoginFailed),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 45),
                  ),
                  child: Text('Login'),
                ),
              ] else ...[
                Text('Halo, ${user1.nama}!'),
                SizedBox(height: 20),
                Text('Pasti username kamu: ${user1.username}'),
                Text('Pasti password kamu: ${user1.password}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController controller, bool isLoginFailed) {
  return _inputField(
    controller: controller,
    hint: 'Username',
    isLoginFailed: isLoginFailed,
  );
}

Widget _passwordField(TextEditingController controller, bool isLoginFailed) {
  return _inputField(
    controller: controller,
    hint: 'Password',
    isLoginFailed: isLoginFailed,
    obscure: true,
  );
}

Widget _inputField({
  required TextEditingController controller,
  required String hint,
  required bool isLoginFailed,
  bool obscure = false,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      enabled: true,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: isLoginFailed ? Colors.red : Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}