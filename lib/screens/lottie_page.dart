import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  const LottiePage({super.key});

  @override
  LottiePageState createState() => LottiePageState();
}

class LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
              height: 200.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
