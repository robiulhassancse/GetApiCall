import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:listviewfetchdata/screen/photo_details_screen.dart';
import '../model/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Photo> photoList = [];

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  Future<void> getPhotos() async {
    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    print(response.statusCode);
    print(response.body);
    print(response);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      // var list = decodedResponse['data'];
      for (var e in decodedResponse) {
        Photo photo = Photo.toJson(e);
       // Photo photo = Photo(
            // title: e['title'],
            // url: e['url'],
            // tumbnailUrl: e["tumbnailUrl"],
            // albumId: e['albumId'],
            // id: e['id']);
        photoList.add(photo);
        setState(() {});
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gellery App'),
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            itemCount: photoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoDetailsScreen(photoList: photoList[index]),),);},
                // leading: CircleAvatar(
                //   backgroundImage: NetworkImage(photoList[index].url ?? ''),
                // ),

                leading: Image.network(photoList[index].url ?? ''),
                title: Text(photoList[index].title ?? 'unknown'),
              );
            }),
      ),
    );
  }
}
