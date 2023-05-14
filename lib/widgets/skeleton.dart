import 'package:flutter/material.dart';
import 'package:flutter_f6sny/themes/theme.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: myColors["Skeleton"]["backgroundColor"],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}

class ContentSkeleton extends StatelessWidget {
  const ContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(height: 20, width: 160),
              SizedBox(
                height: 10,
              ),
              Skeleton(height: 16, width: 260),
              SizedBox(
                height: 5,
              ),
              Skeleton(height: 16, width: 300),
              SizedBox(
                height: 5,
              ),
              Skeleton(height: 16, width: 150)
            ],
          ),
          const Skeleton(height: 50, width: 50),
        ],
      ),
    );
  }
}

class TagSkeleton extends StatelessWidget {
  const TagSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(height: 20, width: 160),
              SizedBox(
                height: 10,
              ),
              Skeleton(height: 20, width: 260)
            ],
          )
        ],
      ),
    );
  }
}
