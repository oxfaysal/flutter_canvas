import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/ui_list.dart';
import '../main.dart';

class CanvasController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var activeType = UIType.widget.obs;
  var selectedCategory = RxnString();
  var searchQuery = "".obs;
  final TextEditingController searchController = TextEditingController();

  // Optimized Filtered List
  List<UIComponent> get filteredComponents {
    return uiLibrary.where((item) {
      final matchesType = item.type == activeType.value;
      final matchesSearch =
          item.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              item.category.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesType && matchesSearch;
    }).toList();
  }

  List<String> get categories {
    return filteredComponents.map((e) => e.category).toSet().toList();
  }

  void switchType(UIType type) {
    activeType.value = type;
    selectedCategory.value = null;
    searchQuery.value = "";
    searchController.clear();
  }
}