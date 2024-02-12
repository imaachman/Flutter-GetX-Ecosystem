import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/responsive/data.dart';

import 'components.dart';

class HomePage extends GetResponsiveView {
  HomePage({super.key, super.settings});

  final ProductData product = ProductData();

  @override
  bool get alwaysUseBuilder => true;

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              child: Text(
                '${screen.width.round()}px',
                style: TextStyle(
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
        SizedBox(width: 24),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductName(name: product.desktop.name),
              SizedBox(height: 24),
              ProductDescription(description: product.desktop.description),
              SizedBox(height: 24),
              Row(
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
              SizedBox(height: 24),
              Row(
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
        SizedBox(width: 24),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductName(name: product.tablet.name),
              SizedBox(height: 24),
              ProductDescription(description: product.tablet.description),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget? phone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductImage(src: product.phone.image),
        SizedBox(height: 24),
        Column(
          children: [
            ProductName(name: product.phone.name),
            SizedBox(height: 24),
            ProductDescription(description: product.phone.description),
            SizedBox(height: 24),
            Row(
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
              LikeButton(small: true),
              SizedBox(width: 24),
              ProductName(name: product.watch.name),
              SizedBox(width: 24),
              DislikeButton(small: true),
            ],
          ),
        ),
      ],
    );
  }
}
