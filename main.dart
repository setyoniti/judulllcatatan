import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class Catatan {
  String judul;
  String deskripsi;
  Catatan(this.judul, this.deskripsi);
}

class _HomePageState extends State<HomePage> {
  final TextEditingController mycontroller = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  String catatan = "";
  List<Catatan> catatann = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan Pagi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                controller: mycontroller,
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Judul',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: TextField(
                controller: catatanController,
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Catatan',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      catatann.add(Catatan(mycontroller.text, catatanController.text));
                      mycontroller.clear();
                      catatanController.clear();
                    });
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      catatann.clear();
                      mycontroller.clear();
                      catatanController.clear();
                    });
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Text('Judul', style: TextStyle(fontWeight: FontWeight.bold)),
                    width: 100.0,
                  ),
                  Container(
                    child: Text('Catatan', style: TextStyle(fontWeight: FontWeight.bold)),
                    width: 100.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: catatann.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        child: Text(catatann[index].judul),
                        width: 100.0,
                      ),
                      Container(
                        child: Text(catatann[index].deskripsi),
                        width: 100.0,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
