import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends GetResponsiveView {
  final String src;

  ProductImage({super.key, required this.src});

  @override
  Widget? builder() {
    return Image.network(src, fit: BoxFit.cover);
  }

  @override
  Widget? desktop() {
    return Container(
      constraints: BoxConstraints(maxWidth: 800),
      child: builder(),
    );
  }

  @override
  Widget? tablet() {
    return SizedBox(
      height: 500,
      child: builder(),
    );
  }

  @override
  Widget? phone() {
    return Container(
      constraints: BoxConstraints(maxWidth: 450),
      child: builder(),
    );
  }
}

class ProductName extends StatelessWidget {
  final String name;

  const ProductName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(fontSize: 18),
      maxLines: 15,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class LikeButton extends StatelessWidget {
  final bool small;

  const LikeButton({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    if (small) {
      return IconButton(
        icon: Icon(Icons.thumb_up),
        onPressed: () {},
      );
    } else {
      return SizedBox(
        width: 100,
        height: 36,
        child: ElevatedButton(
          child: Text('Like', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
      );
    }
  }
}

class DislikeButton extends StatelessWidget {
  final bool small;

  const DislikeButton({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    if (small) {
      return IconButton(
        icon: Icon(Icons.thumb_down),
        onPressed: () {},
      );
    } else {
      return SizedBox(
        width: 100,
        height: 36,
        child: ElevatedButton(
          child: Text('Dislike', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
      );
    }
  }
}
