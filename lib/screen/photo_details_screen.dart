import 'package:flutter/material.dart';
import '../model/product.dart';

class PhotoDetailsScreen extends StatefulWidget {
  final Photo photoList;
  const PhotoDetailsScreen({super.key, required this.photoList});
  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Photo Details'),
        ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Image.network('${widget.photoList.url}'),
            SizedBox(height: 10,),
            Text('Title: ${widget.photoList.title}',style: const TextStyle(
              fontSize: 16,
            ),),
            Text('ID: ${widget.photoList.id}',style: const TextStyle(
              fontSize: 16,
            ),),

          ],
        ),
      ),
    );
  }
}
