import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'my_drawer_header.dart';

void main() {
  runApp(const KodetrApp());
}

class KodetrApp extends StatelessWidget {
  const KodetrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Simple Gallery', home: ScafoldHoder());
  }
}

class ScafoldHoder extends StatelessWidget {
  const ScafoldHoder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Gallery'),
      ),
      body: const PhotoGalleryStful(),
      drawer: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(),
            // MyDrawerList()
          ],
        ),
      )),
    );
  }
}

class PhotoGalleryStful extends StatefulWidget {
  const PhotoGalleryStful({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryStful> createState() => _PhotoGalleryStfulState();
}

class _PhotoGalleryStfulState extends State<PhotoGalleryStful> {
  int _currentImageIndex = 0;

  final _galleryItems = [
    {
      "id": 1,
      "name": "US Four Famous Fighters",
      "image_url":
          'https://upload.wikimedia.org/wikipedia/commons/b/b8/Formation_of_a_Legacy%2C_Hertiage_flight_merges_aviation_past_and_present_86-16-51-22.jpg'
    },
    {
      "id": 2,
      "name": "Strike Eagle F-15",
      "image_url":
          'https://imageio.forbes.com/specials-images/imageserve/60c67d6ba39ea67170b4012e/0x0.jpg?format=jpg&crop=3564,2004,x0,y0,safe&width=1200',
    },
    {
      "id": 3,
      "name": "F-16 Falcon",
      "image_url":
          'https://pbs.twimg.com/media/FQRP7CoVEAQtgrG?format=jpg&name=medium'
    },
    {
      "id": 4,
      "name": "F-35 Lightning II",
      "image_url":
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/F-35A_flight_%28cropped%29.jpg/1280px-F-35A_flight_%28cropped%29.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    // print(galleryItems[0]["name"]);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Text(_galleryItems[_currentImageIndex]["name"].toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Expanded(
            child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            String imgUrl = _galleryItems[index]["image_url"].toString();

            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imgUrl),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: index),
            );
          },
          itemCount: _galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          backgroundDecoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).canvasColor,
          ),
          // pageController: widget.pageController,
          onPageChanged: (index) {
            setState(() {
              _currentImageIndex = index;
            });
          },
        ))
      ],
    );
  }
}
