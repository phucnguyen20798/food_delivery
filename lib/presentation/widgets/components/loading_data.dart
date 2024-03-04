import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/constants/app_color.dart';

class LoadingData extends StatefulWidget {
  final LoadingType loadingType;

  const LoadingData({
    super.key,
    required this.loadingType,
  });

  @override
  State<LoadingData> createState() => _LoadingDataState();
}

class _LoadingDataState extends State<LoadingData> {
  @override
  Widget build(BuildContext context) {
    switch (widget.loadingType) {
      case LoadingType.SUGGESTION:
        return _buildSuggestionLoadingData();
      case LoadingType.BEST_VOTE:
        return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildSuggestionLoadingData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 180.0,
              height: 16.0,
              color: AppColor.loadingColor,
            ),
            const SizedBox(height: 12.0),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      15,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    width: 250.0,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: AppColor.loadingColor,
                                    )),
                                const SizedBox(height: 8.0),
                                Container(
                                    width: 250.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      color: AppColor.loadingColor,
                                    )),
                                const SizedBox(height: 16.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: AppColor.loadingColor,
                                          shape: BoxShape.circle,
                                        )),
                                    const SizedBox(width: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 180.0,
                                          height: 16.0,
                                          color: AppColor.loadingColor,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Container(
                                          width: 90.0,
                                          height: 16.0,
                                          color: AppColor.loadingColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )).toList(),
                )),
          ]),
    );
  }
}

enum LoadingType { SUGGESTION, BEST_VOTE }
