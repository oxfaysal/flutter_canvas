import 'package:flutter/material.dart';

class LoomixSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final double width;

  const LoomixSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: const InputDecoration(
          hintText: "Search items...",
          prefixIcon: Icon(Icons.search, size: 18, color: Colors.white38),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}