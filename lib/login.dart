import 'package:uts_mobile/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _IDTextboxController = TextEditingController();
  final _PasswordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _textboxID(),
            _textboxPassword(),
            _tombolLogin(),
            _userlogin(),
            _erni()
          ],
        ),
      ),
    );
  }

  _textboxID() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "ID", contentPadding: EdgeInsets.all(12)),
      controller: _IDTextboxController,
    );
  }

  _textboxPassword() {
    return TextField(
      obscureText: true,
      decoration: const InputDecoration(
          labelText: "Password", contentPadding: EdgeInsets.all(12)),
      controller: _PasswordTextboxController,
    );
  }

  _tombolLogin() {
    return ElevatedButton(
        onPressed: () {
          String ID = _IDTextboxController.text;
          String Password = _PasswordTextboxController.text;
          if (ID == "erni" && Password == "erni") {
            // pindah ke halaman Produk Detail dan mengirim data
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
            Fluttertoast.showToast(
                msg: "Login sukses",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Color.fromARGB(255, 253, 72, 27),
                textColor: Colors.white);
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Kesalahan Autentikasi"),
                      content: const Text("ID atau Password Salah"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("OK"),
                            ))
                      ],
                    ));
            return;
          }
        },
        child: const Text('Login'));
  }

  _userlogin() {
    return Column(
      children: [Text("ID: erni"), Text("Password: erni")],
    );
  }

  _erni() {
    return Column(
      children: [
        Text("\n"),
        Text("Nama: ERNI 201011400071"),
      ],
    );
  }
}
