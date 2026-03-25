import 'package:flutter/material.dart';

import '../main.dart';

final List<UIComponent> uiLibrary = [
  UIComponent(
    title: "SebaXpress Service Card",
    category: "Services",
    type: UIType.widget,
    preview: Container(
      width: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.plumbing_rounded,
            color: Color(0xFF6366F1),
            size: 30,
          ),
          const SizedBox(height: 10),
          const Text(
            "Plumbing",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    code: "// SebaXpress Service Card Code...",
  ),
  UIComponent(
    title: "SebaXpress Service Card",
    category: "Button",
    type: UIType.widget,
    preview: Container(
      width: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.plumbing_rounded,
            color: Color(0xFF6366F1),
            size: 30,
          ),
          const SizedBox(height: 10),
          const Text(
            "Plumbing",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    code: "// SebaXpress Service Card Code...",
  ),
  UIComponent(
    title: "Service Card",
    category: "Button",
    type: UIType.widget,
    preview: Container(
      width: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.plumbing_rounded,
            color: Color(0xFF6366F1),
            size: 30,
          ),
          const SizedBox(height: 10),
          const Text(
            "Plumbing",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    code: "// SebaXpress Service Card Code...",
  ),
  UIComponent(
    title: "Glassmorphic Login",
    category: "Auth Templates",
    type: UIType.page,
    preview: const Icon(
      Icons.login_rounded,
      size: 50,
      color: Color(0xFF818CF8),
    ),
    code: "// Full Login Page Code...",
  ),
  UIComponent(
    title: "Modern Login",
    category: "Auth Screens",
    // Ei nam-ti automatic category grid-e chole ashbe
    type: UIType.page,
    preview: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Auth Screens',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(hintText: 'Enter Email'),
          ),
        ],
      ),
    )
    ,
    code: '''
Column(
  children: [
    Text(
      'Auth Screens',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20),
    TextField(
      decoration: InputDecoration(hintText: 'Enter Email'),
    ),
  ],
)
''',
  ),

  // Notun Category "Charts" er jonno:
  UIComponent(
    title: "Sales Bar Chart",
    category: "Charts",
    // Automatic notun category grid hobe
    type: UIType.widget,
    preview: Icon(Icons.bar_chart_rounded, size: 40, color: Colors.greenAccent),
    code: "// Chart widget code here...",
  ),
];
