import 'package:flutter/material.dart';
import 'package:nasa_apod/repository/nasa_api.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final api = NasaAPI();
  final images = [];

  @override
  void initState(){
    super.initState();
    api.get_images_APOD().then((value) {
      setState(() {
        images.addAll(value);
      });
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){setState(() {
            api.get_images_APOD().then((value) {
              setState(() {
                images.addAll(value);
              });
            } );
          });},
          child: const Text("Push me")
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      ClipRRect(
                          child: Image.network(images[index], width: double.infinity))
                    ],
                  ),);
              },
              itemCount: images.length,
              physics: const BouncingScrollPhysics(),))
          ],
        ),
      )
    );
  }
}
