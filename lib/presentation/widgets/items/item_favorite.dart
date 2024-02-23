import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemFavorite extends StatelessWidget {
  const ItemFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    double baseHeight = MediaQuery.of(context).size.width;
    return SizedBox(
      width: baseHeight * 0.43,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            margin: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Cháo lươn bà Quế Siêu Cay',
              maxLines: 2,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RatingBar.builder(
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemSize: 16.0,
                  initialRating: 4.5,
                  allowHalfRating: true,
                  unratedColor: Colors.grey.shade300,
                  glowColor: Colors.amber,
                  onRatingUpdate: (value) {},
                ),
                const SizedBox(width: 8.0),
                const Text('4.5',
                    style: TextStyle(fontSize: 12.0, color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}
