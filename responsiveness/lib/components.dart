import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A responsive widget that builds an image with constraints based on screen
/// size.
class ProductImage extends GetResponsiveView {
  /// The image source URL.
  final String src;

  ProductImage({super.key, required this.src});

  /// Builds an image widget with the given source URL.
  @override
  Widget? builder() {
    return Image.network(src, fit: BoxFit.cover);
  }

  /// Returns the image widget with width constraints for desktop screens
  /// because the image shouldn't be too wide on larger screens.
  @override
  Widget? desktop() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: builder(),
    );
  }

  /// Returns the image widget with height constraints for tablet screens
  /// because the image shouldn't be too tall on portrait-oriented tablets.
  @override
  Widget? tablet() {
    return SizedBox(
      height: 500,
      child: builder(),
    );
  }

  /// Returns the image widget with tighter width constraints for phone screens
  /// because the image cannot take much space on smaller screens.
  @override
  Widget? phone() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450),
      child: builder(),
    );
  }
}

/// A widget that displays the product name as a stylized text.
class ProductName extends StatelessWidget {
  final String name;

  const ProductName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

/// A widget that displays the product description in a limited number of lines.
class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 18),
      maxLines: 15,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// A widget that acts as the like button for the product. It can be displayed
/// as an icon button or an elevated button based on the screen size.
class LikeButton extends StatelessWidget {
  /// Whether to display the button as a small icon button.
  final bool small;

  const LikeButton({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    if (small) {
      return IconButton(
        icon: const Icon(Icons.thumb_up),
        onPressed: () {},
      );
    } else {
      return SizedBox(
        width: 100,
        height: 36,
        child: ElevatedButton(
          child: const Text('Like', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
      );
    }
  }
}

/// A widget that acts as the dislike button for the product. It can be
/// displayed as an icon button or an elevated button based on the screen size.
class DislikeButton extends StatelessWidget {
  /// Whether to display the button as a small icon button.
  final bool small;

  const DislikeButton({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    if (small) {
      return IconButton(
        icon: const Icon(Icons.thumb_down),
        onPressed: () {},
      );
    } else {
      return SizedBox(
        width: 100,
        height: 36,
        child: ElevatedButton(
          child: const Text('Dislike', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
      );
    }
  }
}
