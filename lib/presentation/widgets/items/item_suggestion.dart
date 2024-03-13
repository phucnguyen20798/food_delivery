import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/food.dart';

class ItemSuggestion extends StatelessWidget {
  final Food food;

  const ItemSuggestion({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    return Container(
      width: baseWidth * 0.5,
      height: baseWidth * 0.64,
      margin: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(food.image),
                  fit: BoxFit.fitWidth,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              food.name,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(food.restaurant.logo),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      food.restaurant.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      food.restaurant.categories
                          .map((e) => e.toString())
                          .toString()
                          .replaceFirst('(', '')
                          .replaceFirst(')', ''),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
