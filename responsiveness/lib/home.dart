import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components.dart';
import 'data.dart';

/// A widget that displays product information based on screen size.
/// It uses the [GetResponsiveView] mixin to build the product view
/// for different screen sizes, namely desktop, tablet, mobile, and watch.
class HomePage extends GetResponsiveView {
  // Take [settings] as a parameter to define custom breakpoints for different
  // screen sizes.
  HomePage({super.key, super.settings});

  /// An instance of [ProductData] to display product information.
  final ProductData product = ProductData();

  /// Always use the builder method to return a widget irrespective of the screen
  /// size.
  @override
  bool get alwaysUseBuilder => true;

  /// The builder method returns a scaffold widget with an appbar. appbar's
  /// title and scaffold's body are built based on the screen size. The app bar
  /// also displays the screen width.
  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // Define page title based on screen size.
          screen.responsiveValue<String>(
            desktop: product.desktop.name,
            tablet: product.tablet.name,
            mobile: product.phone.name,
            watch: product.watch.name,
          )!,
        ),
        actions: [
          Container(
            width: 100,
            color: Colors.white,
            child: Center(
              // Display the screen width in the app bar.
              child: Text(
                '${screen.width.round()}px',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          // Build the product view based on screen size.
          child: screen.responsiveValue<Widget>(
            desktop: desktop(),
            tablet: tablet(),
            mobile: phone(),
            watch: watch(),
          )!,
        ),
      ),
    );
  }

  /// Returns a row widget with product image on the left and product name,
  /// description, and like/dislike buttons on the right for desktop screen
  /// size.
  @override
  Widget? desktop() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ProductImage(src: product.desktop.image),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductName(name: product.desktop.name),
              const SizedBox(height: 24),
              ProductDescription(description: product.desktop.description),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LikeButton(),
                  SizedBox(width: 24),
                  DislikeButton(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns a row widget with product image and like/dislike buttons on the
  /// left and product name and description on the right for tablet screen size.
  @override
  Widget? tablet() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 400,
                child: ProductImage(src: product.tablet.image),
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LikeButton(),
                  SizedBox(width: 24),
                  DislikeButton(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductName(name: product.tablet.name),
              const SizedBox(height: 24),
              ProductDescription(description: product.tablet.description),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns a column widget with product image, name, description, and
  /// like/dislike buttons for phone screen size.
  @override
  Widget? phone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductImage(src: product.phone.image),
        const SizedBox(height: 24),
        Column(
          children: [
            ProductName(name: product.phone.name),
            const SizedBox(height: 24),
            ProductDescription(description: product.phone.description),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LikeButton(),
                SizedBox(width: 24),
                DislikeButton(),
              ],
            ),
          ],
        )
      ],
    );
  }

  /// Returns a column widget with product image, name, and like/dislike icon
  /// buttons for watch screen size.
  @override
  Widget? watch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductImage(src: product.watch.image),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LikeButton(small: true),
              const SizedBox(width: 24),
              ProductName(name: product.watch.name),
              const SizedBox(width: 24),
              const DislikeButton(small: true),
            ],
          ),
        ),
      ],
    );
  }
}
