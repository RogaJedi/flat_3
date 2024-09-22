import 'package:flutter/material.dart';

class BoardGameCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String shortDescription;
  final VoidCallback onTap;

  const BoardGameCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.shortDescription,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    shortDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
