import 'package:flutter/material.dart';
import 'package:shapable_image/shapable_image/shapable_image.dart';

class ShapeInteractiveDemo extends StatefulWidget {
  const ShapeInteractiveDemo({super.key});

  @override
  State<ShapeInteractiveDemo> createState() => _ShapeInteractiveDemoState();
}

class _ShapeInteractiveDemoState extends State<ShapeInteractiveDemo> {
  String selectedShape = "circle";

  // Controllers
  final TextEditingController widthController = TextEditingController(
    text: "150",
  );
  final TextEditingController heightController = TextEditingController(
    text: "150",
  );
  final TextEditingController radiusController = TextEditingController(
    text: "20",
  );

  bool topRounded = false;
  bool rightRounded = false;
  bool bottomRounded = false;
  bool leftRounded = false;

  String imageUrl = "https://picsum.photos/300";

  // All shapes list
  final List<String> allShapes = [
    "circle",
    "oval",
    "square",
    "rectangle",
    "rounded",
    "triangle",
    "pentagon",
    "hexagon",
    "heptagon",
    "octagon",
    "nonagon",
    "decagon",
    "polygon <number>",
    "custom_rectangle",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interactive Shape Demo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ShapableImage(
              shape: ShapeType.customRadius,
              width: 150,
              height: 150,
              topLeft: 40,
              topRight: 10,
              bottomLeft: 0,
              bottomRight: 50,
              child: Image.asset("assets/Frame 4076694.png", fit: BoxFit.cover),
            ),
            ShapableImage(
              shape: ShapeType.rectangle,
              width: 150,
              height: 100,
              topLeft: 40,
              topRight: 10,
              bottomLeft: 0,
              bottomRight: 50,
              child: Image.asset("assets/Frame 4076694.png", fit: BoxFit.cover),
            ),
            ShapableImage(
              shape: ShapeType.customRadius,

              child: Image.asset("assets/Frame 4076694.png"),
            ),
          ],
        ),
      ),
    );
  }
}
