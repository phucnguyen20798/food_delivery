import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemHotel extends StatelessWidget {
  const ItemHotel({super.key});

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
          const Text(
            'Texas Chicken - Aeon Mall Hà Đông',
            maxLines: 1,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Tầng 1 Aeon Mall Hà Đông, P. Dương Nội, Hà Đông, Hà Nội',
            maxLines: 1,
            style: TextStyle(fontSize: 12.0, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 4.0),
                  const Text(
                    '880.000 VND',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orange,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
              const SizedBox(width: 16.0),
              ButtonTheme(
                minWidth: 100.0,
                height: 32.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0.0,
                  color: Colors.orange,
                  child: const Text(
                    'Chọn phòng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
