import 'package:calculator_app_flutter/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
} 

class _HomeState extends State<Home> {

  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(userQuestion,
                style: const TextStyle(fontSize: 20),)),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(userAnswer,
                style: const TextStyle(fontSize: 20),)),
            ],
           ),
          )),
        Expanded(
          flex: 2,
        child: Container(
        child: GridView.builder(
          itemCount: buttons.length,
        gridDelegate: 
        const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4
        ),
         itemBuilder:(BuildContext context, int index){
          // clear button 
         if (index == 0) {
            return MyButton(
              buttonTapped: (){
                setState(() {
                  userQuestion = '';
                });
              },
          buttontext: buttons[index],
          color: Colors.green,
          textcolor: Colors.white);
         }
         // delete button  
          else if (index == 1){
            return MyButton(
              buttonTapped: (){
                setState(() {
                  userQuestion = userQuestion.substring(0, userQuestion.length-1);
                });
              },
          buttontext: buttons[index],
          color: Colors.red,
          textcolor: Colors.white);
         }
          else if (index == buttons.length-1){
            return MyButton(
              buttonTapped: (){
                setState(() {
                  equalPressed();
                });
              },
          buttontext: buttons[index],
          color: Colors.deepPurple,
          textcolor: Colors.white);
         }
         // equal button 
         // rest of the buttons
          else {
           return MyButton(
            buttonTapped: (){
              setState(() {
                userQuestion += buttons[index];
              });
            },
          buttontext: buttons[index],
          color: isOperator(buttons[index]) ?Colors.deepPurple : Colors.deepPurple[50],
          textcolor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,);
         }
         })
        ))
        ],
      ),
    );
  }
  bool isOperator(String x){
  if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
    return false;
  }


  void equalPressed(){

   String finalQuestion =  userQuestion;
   finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}




 

 