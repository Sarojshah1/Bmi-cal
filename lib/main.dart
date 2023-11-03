import 'package:bmi/TextBox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.cyan
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var foot=TextEditingController();
  var inch=TextEditingController();
  var mass=TextEditingController();
  var bmi="";
  var stay="";
  void calculate(){
    var f=double.parse(foot.text);
    var i=double.parse(inch.text);
    var m=double.parse(mass.text);
    var cal;
    var inc=i*0.083;
    var foo=f+inc;
    var meter=foo*0.3048;
    cal=m/(meter*meter);
    if(cal<=18.4){
      stay="your bmi is UnderWeight";
    }
    else if(cal>18.4 && cal<=24.9){
      stay="your bmi is Normal";
    }
    else if(cal>24.9 && cal<=39.9){
      stay="your bmi is OverWeight";
    }
    else{
      stay="you are obese";
    }
    bmi=cal.toStringAsFixed(3);
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        elevation: 10,
        shadowColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 140,),

          Row(
            children: [
              Texttox(heighttype: "Foot",control: foot),
              SizedBox(width: 10,),
              Texttox(heighttype: "Inch",control: inch),
            ],

          ),
          SizedBox(height: 20,),
          Container(
            width: 300,
            child: TextField(
              controller: mass,
            decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
            suffixText: "kg",
            labelText: "weight"
            ),),
          ),
          ElevatedButton(onPressed:calculate, child: Text("calculate")),
          Text("your BMI is"),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),

                  labelText: "$bmi"
              ),),
          ),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                  labelText: "$stay"
              ),),
          ),

        ],
      ),

    );
  }
}
