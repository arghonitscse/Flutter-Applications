import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  CurrencyConverterMaterialPage({super.key}) {
    // print(
    //   'constructor',
    // );
  }
  @override // since this is present because of statefulwidget
  State<CurrencyConverterMaterialPage> createState() {
    // print(
    //   'createState',
    // );
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController =
      TextEditingController(); // its value won't change
  void convert() {
    result = double.parse(textEditingController.text) *
        83.60; // as of Fri, 21st June 2024; 08:49 IST
    setState(() {});
  }

  // @override
  // void initState() { // called before build func/ before anything is built
  //   super.initState();
  // }

  @override
  void dispose() { // avoids memory leaks
    textEditingController.dispose();
    super.dispose();// called when the entire widget is discarded 
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //   'build fn',
    // );
    // double result = 0;
    // final TextEditingController textEditingController =
    //     TextEditingController(); // its value won't change
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(
        60,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation:
            0, //not required though because its already zero by default in the system
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // 'Hello',
                // result.toString(),
                'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller:
                    textEditingController, //will help in getting access to user inputs
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  // label: Text(
                  //   'Please enter the amount in USD',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                // onPressed: () {
                //   // if (kDebugMode) {
                //   //   print(
                //   //     'button clicked',
                //   //   );
                //   // }

                //   result = double.parse(textEditingController.text) * 81;
                //   setState(() {});
                // },
                onPressed: convert,
                // style: ButtonStyle(
                //   backgroundColor: const WidgetStatePropertyAll(
                //     Colors.black,
                //   ),
                //   foregroundColor: const WidgetStatePropertyAll(
                //     Colors.white,
                //   ),
                //   minimumSize: const WidgetStatePropertyAll(
                //     Size(
                //       double.infinity,
                //       50,
                //     ),
                //   ),
                //   shape: WidgetStatePropertyAll(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(
                //         10,
                //       ),
                //     ),
                //   ),
                // ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                child: const Text(
                  'Convert',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
