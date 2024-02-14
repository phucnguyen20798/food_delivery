import 'package:flutter/material.dart';

class ItemStore extends StatelessWidget {
  const ItemStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blueAccent.shade100,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Texas Chicken - Aeon Mall Hà Đông',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Tầng 1 Aeon Mall Hà Đông, P. Dương Nội, Hà Đông, Hà Nội',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 12.0, overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'QUÁN ĂN',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '09:00 - 22:00',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 6.0,
                      height: 6.0,
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const Text(
                      '20.000 - 275.000',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
