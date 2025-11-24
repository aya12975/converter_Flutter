import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ConvertPage(), debugShowCheckedModeBanner: false);
  }
}

class ConvertPage extends StatefulWidget {
  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  String type = "Temperature";
  String num1 = "";
  String res = "";

  void doConvert() {
    double? v = double.tryParse(num1);

    if (v == null) {
      setState(() {
        res = "Please enter a number";
      });
      return;
    }

    double out;

    if (type == "Temperature") {
      out = (v * 9 / 5) + 32;
      res = "$v C = ${out.toStringAsFixed(2)} F";
    } else if (type == "Length") {
      out = v / 1000;
      res = "$v m = ${out.toStringAsFixed(3)} km";
    } else if (type == "Weight") {
      out = v * 1000;
      res = "$v kg = ${out.toStringAsFixed(0)} g";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unit Converter"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Choose what you want to convert"),
            SizedBox(height: 10),
            DropdownButton(
              value: type,
              items: [
                DropdownMenuItem(
                  child: Text("Temperature"),
                  value: "Temperature",
                ),
                DropdownMenuItem(child: Text("Length"), value: "Length"),
                DropdownMenuItem(child: Text("Weight"), value: "Weight"),
              ],
              onChanged: (x) {
                setState(() {
                  type = x.toString();
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter value here",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (txt) {
                num1 = txt;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: doConvert, child: Text("Convert")),
            SizedBox(height: 20),
            Text(
              res,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
