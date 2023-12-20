import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp/data/model/photos_model.dart';
import 'package:erp/screens/home/components/start_icon_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosTile extends StatelessWidget {
  const PhotosTile({
    super.key,
    required this.photos, required this.onTap,
  });

  final PhotosModel photos;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        leading: CachedNetworkImage(
          imageUrl: photos.thumbnailUrl ?? '',
          placeholder: (context, url) => const CupertinoActivityIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(photos.title ?? ''),
        subtitle:  Row(
          children: [
            IconTheme(
              data: const IconThemeData(
                color: Colors.cyanAccent,
                size: 20,
              ),
              child: StarDisplay(
                value: ((2 * 5) / 10).round(),
              ),
            ),
            const Text(
              "2/10",
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}