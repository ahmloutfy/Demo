import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

List<StaggeredGridTile> _cardTile = <StaggeredGridTile>[
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    child: BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child:
        BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    child:
        BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    child: BackGroundTile(
        backgroundColor: Colors.blue, icondata: Icons.access_alarms),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    child: BackGroundTile(
        backgroundColor: Colors.cyan, icondata: Icons.search_sharp),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.yellowAccent, icondata: Icons.adjust_rounded),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 3,
    child: BackGroundTile(
        backgroundColor: Colors.deepOrange, icondata: Icons.attach_money),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.grey, icondata: Icons.add),
  ),
];

class Staggered extends StatelessWidget {
  const Staggered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG App"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.85,
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            children: _cardTile,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color? backgroundColor;
  final IconData? icondata;

  const BackGroundTile({super.key, this.backgroundColor, this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}
