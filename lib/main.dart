import 'package:flutter/material.dart';

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

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String _messege="";

  // const MyApp({super.key});
  var _wtconroler =TextEditingController();
  var _ftconroler =TextEditingController();
  var _inchconroler =TextEditingController();
  var result="";
  var _bgColor;
  //var _bgColor;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
  title: Text('your BMI'),
  ),

  body: Container(
    color: _bgColor,
    child: Center(
    child: Container(

    width: 300,
         child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('BMI',style: TextStyle(
    fontSize: 34,fontWeight: FontWeight.bold
    ),),
    SizedBox(height: 21,),

    TextField(
    controller:_wtconroler,
    decoration: InputDecoration(
        label: Text("Enter your Weight"),
      prefixIcon: Icon(Icons.line_weight)
    ),
       keyboardType: TextInputType.number,),
       SizedBox(height: 11),
    TextField(
    controller:_ftconroler,
    decoration: InputDecoration(
    label: Text("Enter your Height (in-Feet"),
    prefixIcon: Icon(Icons.height)
    ),
    keyboardType: TextInputType.number,

    ),
    SizedBox(height: 11,),
    TextField(
    controller:_inchconroler,
    decoration: InputDecoration(
    label: Text("Enter your Height(in-Inch)"),
    prefixIcon: Icon(Icons.height)
    ),
    keyboardType: TextInputType.number,

    ),
    SizedBox(height: 20,),
    ElevatedButton(onPressed: (){
    var wt =_wtconroler.text.toString();
    var ft =_ftconroler.text.toString();
    var inch=_inchconroler.text.toString();
        if(wt!="" && ft!= ""&& inch!=""){
          {
            // BMI CALCULATION
            var iwt = int.parse(wt);
            var ift = int.parse(ft);
            var _Inch = int.parse(inch);

            var tinch = (ift * 12) + _Inch;
            var tcm = tinch * 2.54;
            var tM = tcm / 100;
            var bmi = iwt / (tM * tM);
            var msg = "";
            if (bmi > 25) {
              msg = "You are OverWeight 😟 !!";
              _bgColor = Colors.orangeAccent.shade200;
            } else if (bmi < 18) {
              msg = "You are UnderWeight 🥹 !!";
              _bgColor = Colors.red.shade200;
            } else {
              msg = "You are Healthy ❤️ !!";
              _bgColor = Colors.green.shade200;
            }
            setState(() {
              result = result = '$msg \n Your BMI is :${bmi.toStringAsFixed(2)}';
            });
          }

    } else {
       setState((){
       result ="please fill all the required blanks!!";
       });
          }







    }, child: Text('Calculate')),
    SizedBox(height: 12,),
       Text(result,style: TextStyle(fontSize: 22),)

    ],
    ),
    ),
    ),
  ),
  );

  }

  }







