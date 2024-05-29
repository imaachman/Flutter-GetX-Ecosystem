/// Defines the data model for the product.
class ProductDataModel {
  final String name;
  final String image;
  final String description;

  ProductDataModel({
    required this.name,
    required this.image,
    required this.description,
  });
}

/// Provides the product data for the app.
class ProductData {
  ProductDataModel get desktop => ProductDataModel(
        name: 'Desktop',
        image:
            'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description:
            'Elevate your desktop experience with "DeskConnect," a powerhouse app designed to seamlessly blend productivity and connectivity. Transition effortlessly between tasks, organize projects with precision, and stay connected with colleagues and friends through a feature-rich interface. "DeskConnect" transforms your desktop into a hub of efficiency, where every click and keystroke is met with unparalleled responsiveness. With a sleek design and an array of functionalities, this app caters to the demands of a dynamic desktop environment, ensuring that your work and interactions are not just efficient but effortlessly enjoyable.',
      );

  ProductDataModel get tablet => ProductDataModel(
        name: 'Tablet',
        image:
            'https://images.unsplash.com/photo-1542751110-97427bbecf20?q=80&w=1984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description:
            'Dive into immersive experiences with "TabletTales," an app meticulously optimized for the expansive canvas of your tablet. Whether you\'re indulging in captivating interactive stories, managing tasks with effortless efficiency, or enjoying a rich multimedia adventure, "TabletTales" adapts seamlessly to your tablet\'s capabilities. The app\'s intuitive design and versatile features make it the perfect companion for both productivity and leisure, creating an environment where your tablet becomes a portal to a world of endless possibilities and seamless interactions, ensuring your every touch is met with delightful responsiveness.',
      );

  ProductDataModel get phone => ProductDataModel(
        name: 'Phone',
        image:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description:
            'Step into a world of connections with "MobileMingle," the definitive smartphone app designed to redefine your social landscape. Seamlessly combining modern aesthetics with intuitive functionality, "MobileMingle" is your gateway to meaningful relationships on the go. Swipe through profiles effortlessly, engage in vibrant conversations, and discover like-minded individuals. With a user-friendly interface and a plethora of features, this app transforms the mobile experience into a dynamic and engaging journey, ensuring that your quest for connection is not just convenient but captivating.',
      );

  ProductDataModel get watch => ProductDataModel(
        name: 'Watch',
        image:
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        description:
            'The "Timeless" watch is a modern classic. With a sleek, minimalist design and a variety of color options, this watch is the perfect accessory for any occasion. Whether you\'re looking for something casual or formal, this watch will be sure to impress. It\'s also water resistant up to 30 meters, so you can wear it in the shower or while swimming without worrying about damaging it. And with its durable stainless steel case and scratch-resistant sapphire crystal glass face, this watch is built to last.',
      );
}
