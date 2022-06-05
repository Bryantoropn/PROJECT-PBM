import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  var show_password = false;
  var err_msg = '';
  var ctrlEmail = TextEditingController();
  var ctrlPass = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 247, 246, 255)),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 70),
                  child: Image.asset('./images/logo.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'MaemsApp',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text('Food and Delivery'),
                    ],
                  ),
                ),
                _buildFormRegistrasi(),
                _buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBtns() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, top: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: Colors.white,
        color: Color.fromARGB(255, 255, 89, 37),
        child: Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () => {
          if (formkey.currentState != null)
            {
              if (formkey.currentState!.validate())
                {do_signup()}
              else
                {print('ada inputan belum valid')}
            }
        },
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sudah punya akun ?'),
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myLogin()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Color.fromARGB(255, 23, 143, 253)),
              ))
        ],
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 10),
        child: TextFormField(
          controller: ctrlPass,
          obscureText: show_password == false,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: 'Password...',
              hintText: 'Enter your secure Password',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    show_password = !show_password;
                  });
                },
              )),
          validator: (val) {
            if (val == null) {
              return 'password harus diisi';
            }
            if (val.length < 6) {
              return 'password minimal 6 karakter';
            }
            return null;
          },
        ));
  }

  Widget _buildEmail() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, top: 30),
      child: TextFormField(
        controller: ctrlEmail,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            labelText: 'Email...',
            hintText: 'Enter your Email'),
        validator: (val) {
          if (val == null) {
            return 'Email tidak boleh kosong';
          } else if (val.length < 5) {
            return 'Email minimal 5 karakter';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFormRegistrasi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmail(),
            _buildPassword(),
            SizedBox(height: 5),
            if (err_msg.isNotEmpty)
              Text(
                'Email dan password telah terdaftar',
                style: TextStyle(
                  color: Colors.red.shade600,
                ),
              ),
            _buildBtns(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotelp() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, top: 10),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            labelText: 'No.Telp...',
            hintText: 'Enter your email or no.telp'),
      ),
    );
  }

  Future<void> do_signup() async {
    try {
      setState(() {
        err_msg = '';
      });
      var email = ctrlEmail.text;
      var pass = ctrlPass.text;
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('sign up success');
      print(res);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Akun berhasil ditambahkan, silakan untuk login'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myLogin()));
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (ex) {
      print('exception signup');
      print(ex.runtimeType);
      if (ex is FirebaseAuthException) {
        print(ex);
        print(ex.message);
        setState(() {
          err_msg = ex.message ?? 'kesalahan saat login.';
        });
      }
    }
  }
}
