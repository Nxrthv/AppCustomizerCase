import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class CounterFunction extends StatefulWidget {

  const CounterFunction({super.key});

  @override
  State<CounterFunction> createState() => _CounterFunctionState();
}

class _CounterFunctionState extends State<CounterFunction> {

  int clickCounter = 0;
  // String text = 'Clicks!!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador'),
          actions: [
            IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () { 
              setState(() {
                clickCounter = 0;
              });
            },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle(fontSize: 160,fontWeight:FontWeight.w100)),
              //Text(' $text ',style:const TextStyle(fontSize: 25))
              Text('Hola Mundo${clickCounter == 1 ? '':'s' }',style:const TextStyle(fontSize: 25))
          ],
        ),
      ),
        floatingActionButton: Column(

          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            CustomButton(icon:Icons.refresh_rounded,
            onPressed: (){
              setState(() {
                clickCounter = 0;
                });
              }
            ),
            const SizedBox(height: 15),
            CustomButton(icon:Icons.plus_one,
            onPressed: (){
              setState((){
                clickCounter++;
                });
              }
            ),
            const SizedBox(height: 15),
            CustomButton(icon:Icons.exposure_minus_1_outlined,
            onPressed: (){
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
                });
              },
            ),
          ],
        )
      );
    }
  }

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}