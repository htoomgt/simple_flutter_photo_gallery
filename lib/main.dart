import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(const KodetrApp());
}

class KodetrApp extends StatelessWidget {
  const KodetrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Gallery',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Simple Gallery'),
          ),
          body: const PhotoGallery(),
        ));
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  static const galleryItems = [
    'https://upload.wikimedia.org/wikipedia/commons/b/b8/Formation_of_a_Legacy%2C_Hertiage_flight_merges_aviation_past_and_present_86-16-51-22.jpg',
    'https://imageio.forbes.com/specials-images/imageserve/60c67d6ba39ea67170b4012e/0x0.jpg?format=jpg&crop=3564,2004,x0,y0,safe&width=1200',
    'https://pbs.twimg.com/media/FQRP7CoVEAQtgrG?format=jpg&name=medium',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/F-35A_flight_%28cropped%29.jpg/1280px-F-35A_flight_%28cropped%29.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(galleryItems[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(tag: index),
        );
      },
      itemCount: galleryItems.length,
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
      // onPageChanged: onPageChanged,
    );
  }
}
