import 'package:flutter/material.dart';
import 'package:per4/profil.dart';
import 'package:date_time_picker/date_time_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 246, 255),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ACCOUNT",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.black,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyProfile()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: const ProfileEdit(),
    );
  }
}

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Your Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Nama",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 25,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    autocorrect: true,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        hintText: "Masukkan nama",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 30,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    autocorrect: true,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        hintText: "Masukkan email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "No. Hp",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 13,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    autocorrect: true,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        hintText: "Masukkan no.Hp",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    DateTimePicker(
                      initialValue: '',
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100),
                      dateLabelText: 'Date',
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
