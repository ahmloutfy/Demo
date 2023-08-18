// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CameraAccess extends StatefulWidget {
//   const CameraAccess({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return CameraAccessState();
//   }
// }

// class CameraAccessState extends State<CameraAccess> {
//   XFile? cameraFile;

//   @override
//   Widget build(BuildContext context) {
//     display image selected from gallery
//     selectFromCamera() async {
//       cameraFile = await ImagePicker.pickImage(
//         source: ImageSource.camera,
//         // maxHeight: 50.0,
//         // maxWidth: 50.0,
//       );
//       setState(() {});
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Camera Access"),
//         backgroundColor: Colors.green,
//         actions: const [
//           Text(
//             "GFG",
//             textScaleFactor: 3,
//           )
//         ],
//       ),
//       body: Builder(
//         builder: (BuildContext context) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                     child: const Text('Select Image from Camera'),
//                     onPressed: selectFromCamera),
//                 SizedBox(
//                   height: 200.0,
//                   width: 300.0,
//                   child: cameraFile == null
//                       ? const Center(child: Text('Sorry nothing selected!!'))
//                       : Center(child: Image.file(cameraFile!)),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
