import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarNetwork extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  const AvatarNetwork({
    Key key,
    this.url,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: CachedNetworkImage(
        imageUrl: this.url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
