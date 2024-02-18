import 'package:flutter/material.dart';

class ItemSuggestion extends StatelessWidget {
  const ItemSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(color: Colors.blueAccent.shade100),
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Texas Chicken - Aeon Mall Hà Đông',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Tầng 1 Aeon Mall Hà Đông, P. Dương Nội, Hà Đông, Hà Nội',
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12.0, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
