import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtController = TextEditingController();
  String name = "name";
  String? sValue;

  void saveString(String sText) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, sText);
  }

  void getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(name);
    if (value != null) {
      // setState(() {
      sValue = value;
      // });
      // txtController.text = value;
    }
  }

  @override
  void initState() {
    super.initState();
    getString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: txtController,
              // onChanged: (val) {
              //   saveString(val);
              // },
            ),
          ),
          Text("$sValue"),
          ElevatedButton(
            onPressed: () {
              saveString(txtController.text);
            },
            child: Text("Save"),
          ),
          ElevatedButton(
            onPressed: () {
              getString();
              print(sValue);
              setState(() {
                txtController.clear();
              });
            },
            child: Text("Get"),
          ),
        ]),
      ),
    );
  }
}
