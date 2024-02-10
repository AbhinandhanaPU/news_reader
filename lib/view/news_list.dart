import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.date,
  });

  final String author;
  final String title;
  final String description;
  final String image;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            author,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 250,
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(height: 18),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Icon(Icons.share, size: 20)
            ],
          ),
        ],
      ),
    );
  }
}
