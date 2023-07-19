import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({Key? key, this.image}) : super(key: key);

  final String? image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageBuilder: (context, imageProvider) =>
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill
                  )
              ),
            ),
        placeholder: (context, error) =>
        const Icon(
          Icons.image_outlined,
          color: Colors.grey,
        ),
        fit: BoxFit.fill,
        imageUrl: image!,
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error_outline))
    );
  }
}
