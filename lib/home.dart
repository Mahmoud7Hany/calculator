import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _num1controller = TextEditingController();
  final TextEditingController _num2controller = TextEditingController();
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formState = GlobalKey();
  int z = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
      ),
      body: Form(
          key: _formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 180),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextFormField(
                    validator: ((value) =>
                        value!.isEmpty ? "This field is required" : null),
                    controller: _num1controller,
                    keyboardType: TextInputType.number,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'first number',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextFormField(
                    validator: ((value) =>
                        value!.isEmpty ? "This field is required" : null),
                    controller: _num2controller,
                    keyboardType: TextInputType.number,
                    // ignore: prefer_const_constructors,
                    decoration: InputDecoration(
                      labelText: 'Secons number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          int x = int.parse(_num1controller.value.text);
                          int y = int.parse(_num2controller.value.text);
                          // ignore: avoid_print
                          setState(() {
                            z = x + y;
                          });
                        }
                        // ignore: prefer_const_constructors
                      },
                      child: const Text(
                        "  Add  ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            height: 1.3),
                      )),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "sum:$z",
                    style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        backgroundColor: Colors.pink,
                        fontWeight: FontWeight.w700,
                        height: 2),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
