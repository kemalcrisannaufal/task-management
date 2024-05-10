import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  final String iconUrl;
  WeatherIconWidget({required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    String fullIconUrl = 'https:' + iconUrl;

    return Image.network(
      fullIconUrl,
      width: 70,
      height: 70,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error);
      },
    );
  }
}
