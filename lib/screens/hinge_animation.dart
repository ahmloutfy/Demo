import 'package:flutter/material.dart';

//create a stateful widget
class HingeAnimation extends StatefulWidget {
  const HingeAnimation({super.key});

  @override
  HingeAnimationState createState() => HingeAnimationState();
}

class HingeAnimationState extends State<HingeAnimation>
    with SingleTickerProviderStateMixin {
// animation setup
  AnimationController? _controller;
  Animation<double>? _rotationAnimation;
  Animation<double>? _slideAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _rotationAnimation = Tween(end: 0.15, begin: 0.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );
    // setrtup the Tween for creating curve
    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    // setup opacticty as per need
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

// the animation widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        automaticallyImplyLeading: false,
        title: const Text("GeeksForGeeks"),
        centerTitle: true,
      ),

      body: AnimatedBuilder(
        animation: _slideAnimation!,
        builder: (BuildContext context, Widget? child) => Container(
          width: 200,
          height: 150,
          padding: const EdgeInsets.all(0),
          margin: EdgeInsets.only(
            left: 100,
            top: _slideAnimation!.value,
          ),
          child: RotationTransition(
            turns: _rotationAnimation!,
            child: Center(
              child: Text(
                'GeeksForGeeks',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                        300, 150, 500, _opacityAnimation!.value)),
              ),
            ),
          ),
        ),
      ),
      // the button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        onPressed: () {
          _controller!.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
