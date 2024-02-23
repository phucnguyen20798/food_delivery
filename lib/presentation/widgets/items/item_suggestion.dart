import 'package:flutter/material.dart';

class ItemSuggestion extends StatelessWidget {
  const ItemSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    double baseHeight = MediaQuery.of(context).size.width;
    return SizedBox(
      width: baseHeight * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200.0,
            height: 180.0,
            margin: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Cháo lươn cay bà Quế',
              maxLines: 2,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Số 142 đường Ngư Hải, tp.Vinh, tỉnh Nghệ An',
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'Cháo lươn bà Quế',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
