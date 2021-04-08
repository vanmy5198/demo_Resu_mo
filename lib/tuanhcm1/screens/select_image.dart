import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resu_mo/tuanhcm1/components/image_thumbnail.dart';
import 'package:resu_mo/tuanhcm1/screens/image_view.dart';

class SelectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an image'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
        itemBuilder: (context, idx) => InkWell(
            onTap: () => _navigateToView(context), child: ImageThumbnail()),
        itemCount: 100,
      ),
    );
  }

  void _navigateToView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageView(
                  <ImageThumbnail>[
                    ImageThumbnail(),
                    ImageThumbnail(),
                    ImageThumbnail(),
                  ],
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                )));
  }
}
