import 'package:flutter/material.dart';

class ItemKara extends StatelessWidget {
  const ItemKara({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      right: -2.0,
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                      ),
                    ),
                  ],
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
          ),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '300.000 đ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 32.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.green.shade700, width: 1.0)),
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0.0,
                  color: Colors.white,
                  child: Text(
                    'Đặt phòng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green.shade700,
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
