import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_calismasi/SayfaA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> veriKaydi() async {
    var sp =await SharedPreferences.getInstance();
    sp.setString("ad", "Halil");
    sp.setInt("yaş", 18);
    sp.setDouble("boy", 1.70);
    sp.setBool("bekarMi", true);

    var arkadasListe = <String>[];
    arkadasListe.add("Hüseyin");
    arkadasListe.add("Halil");

    sp.setStringList("arkadasListe", arkadasListe);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton( 
              child: Text("Geçiş Yap"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SayfaA()));

              },
            )
          ],
        ),
      ),
    );
  }
}
