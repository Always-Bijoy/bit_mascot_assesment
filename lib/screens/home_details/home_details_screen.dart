import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp/data/model/photos_model.dart';
import 'package:erp/screens/home/components/start_icon_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key, required this.photos});

  final PhotosModel photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 300,
            width: double.infinity,
            imageUrl: photos.thumbnailUrl ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: 120,
                    width: 100,
                    imageUrl: photos.thumbnailUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photos.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Action, Adventure, Fantasy',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.blueAccent, height: 1.4),
                      ),
                      Text(
                        'December 18, 2023',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.amber, height: 1.6),
                      ),
                      IconTheme(
                        data: const IconThemeData(
                          color: Colors.cyanAccent,
                          size: 20,
                        ),
                        child: StarDisplay(
                          value: ((2 * 5) / 10).round(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
