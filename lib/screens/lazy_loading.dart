import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LazyLoading extends StatefulWidget {
  const LazyLoading({Key? key}) : super(key: const Key('myLazyLoading'));

  @override
  LazyLoadingState createState() => LazyLoadingState();
}

class LazyLoadingState extends State<LazyLoading> {
  List<int> data = [];
  int currentLength = 0;

  final int increment = 10;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Loader'),
        backgroundColor: Colors.green,
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, position) {
            return DemoItem(position);
          },
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.deepOrange,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            const Text("GeeksforGeeks.org was created with a goal "
                "in mind to provide well written, well "
                "thought and well explained solutions for selected"
                " questions. The core team of five super geeks"
                " constituting of technology lovers and computer"
                " science enthusiasts have been constantly working"
                " in this direction ."),
          ],
        ),
      ),
    );
  }
}
