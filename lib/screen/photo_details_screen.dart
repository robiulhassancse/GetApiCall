import 'package:flutter/material.dart';
import '../model/product.dart';

class PhotoDetailsScreen extends StatefulWidget {
   // PhotoDetailsScreen({super.key, required this.photoList, });
  final Photo photoList;
  PhotoDetailsScreen({super.key, required this.photoList});


  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
 
// @override
//   void initState() {
//     super.initState();
//
//   }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Photo Details'),
        ),
      body:  Column(
        children: [
                 Text('Hello'),
        ],
      ),
    );
  }
}
