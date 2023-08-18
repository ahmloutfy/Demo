import 'package:flutter/material.dart';

class ArgumentsScreen extends StatelessWidget {
  const ArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeekForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: Arguments(
                    titleBar: 'Extract Arguments Screen',
                    textMessage: 'Extracted in the build method.',
                  ),
                );
              },
              child: const Text("Extracts arguments"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: Arguments(
                    titleBar: 'Accept Arguments Screen',
                    textMessage: 'Extracted in the onGenerateRoute function.',
                  ),
                );
              },
              child: const Text("Accepts arguments"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  const ExtractArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.titleBar ?? ''),
      ),
      body: Center(
        child: Text(args.textMessage ?? ''),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String? title;
  final String? message;

  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: Center(
        child: Text(message ?? ''),
      ),
    );
  }
}

class Arguments {
  final String? titleBar;
  final String? textMessage;

  Arguments({this.titleBar, this.textMessage});
}
