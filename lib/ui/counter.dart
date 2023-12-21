import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controller/counter_controller.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: const Color.fromARGB(255, 229, 161, 140),
      ),
      body: GetX<MyCounter>(
        builder: (myCounter) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('counter ${myCounter.count.value}'),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  child: const Text('increment count'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 161, 140),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  child: const Text('decrement count'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 161, 140),
                  ),
                )
              ],
            ),
          ],
        ),
        init: MyCounter(),
      ),
    );
  }
}
