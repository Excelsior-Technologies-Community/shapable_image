# ShapableImage

A beautiful, lightweight, and dependency-free Flutter widget to clip any widget
(Image, Container, etc.) into different shapes using a custom clipper.

Supports **Circle, Oval, Rectangle, Rounded, Custom Radius, and Polygon** shapes.
Ideal for profile images, cards, avatars, galleries, and interactive UI demos.

---

## ✨ Features

🔵 Circle, Oval, Rectangle shapes  
🔶 Rounded rectangle with fixed radius  
🎯 Custom individual corner radius (per corner)  
🔺 Polygon shapes (Triangle, Pentagon, Hexagon, etc.)  
🧩 Works with **any widget**, not only images  
⚡ Lightweight & fast (pure Flutter)  
❌ No third-party dependencies  
🎨 Fully customizable size, radius & shape  
🧪 Includes interactive demo screen  

---

## ✨ Preview

<img width="305" height="618" alt="Screenshot 2025-12-15 at 11 28 59 AM" src="https://github.com/user-attachments/assets/659cff3b-1111-4bf9-80f2-a414db8bb9db" />





---


## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  shapable_image:
    path: ../shapable_image
```
from git:
```
dependencies:
  shapable_image:
    git:
      url: https://github.com/yourusername/shapable_image.git

```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
shapable_image/
│
├── lib/
│   └── shapable_image.dart
│
├── example/
│   └── shape_interactive_demo.dart
│
└── README.md
  ```
## 🚀 Usage
```
import 'package:flutter/material.dart';
import 'package:shapable_image/shapable_image.dart';

void main() {
  runApp(const ShapeDemoApp());
}

class ShapeDemoApp extends StatelessWidget {
  const ShapeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShapableImage Demo',
      home: const ShapeInteractiveDemo(),
    );
  }
}

class ShapeInteractiveDemo extends StatelessWidget {
  const ShapeInteractiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShapableImage Demo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Custom Radius
            ShapableImage(
              shape: ShapeType.customRadius,
              width: 150,
              height: 150,
              topLeft: 40,
              topRight: 10,
              bottomLeft: 0,
              bottomRight: 50,
              child: Image.asset(
                "assets/Frame 4076694.png",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Rectangle
            ShapableImage(
              shape: ShapeType.rectangle,
              width: 150,
              height: 100,
              child: Image.asset(
                "assets/Frame 4076694.png",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Default size (no width/height)
            ShapableImage(
              shape: ShapeType.customRadius,
              child: Image.asset(
                "assets/Frame 4076694.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
