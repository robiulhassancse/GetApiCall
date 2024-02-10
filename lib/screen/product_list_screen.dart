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
  bool _inProgress = false;

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  Future<void> getPhotos() async {
    _inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    // print(response.statusCode);
    // print(response.body);
    // print(response);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      for (var e in decodedResponse) {
        Photo photo = Photo.toJson(e);
        photoList.add(photo);
        setState(() {});
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unfortunately Error! Please Try agian'),
          ),
        );
      }
    }
    _inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gellery App'),
        actions: [
          IconButton(
              onPressed: () {
                getPhotos();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getPhotos();
        },
        child: SizedBox(
          height: double.infinity,
          child: Visibility(
            visible: _inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
                itemCount: photoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoDetailsScreen(photoList: photoList[index]),),);},
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(photoList[index].url ?? ''),
                    // ),

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoDetailsScreen(
                                  photoList: photoList[index])));
                    },

                    leading: Image.network(photoList[index].url ?? ''),
                    title: Text(photoList[index].title ?? 'unknown'),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
