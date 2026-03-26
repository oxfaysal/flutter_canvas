import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';

final List<UIComponent> uiLibrary = [
  UIComponent(
    title: "Glassmorphic Toolbar",
    category: "Navigation & Tool",
    type: UIType.widget,
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
              IconButton(icon: Icon(Icons.brush_outlined), onPressed: () {}),
              IconButton(icon: Icon(Icons.layers_outlined), onPressed: () {}),
              // More icons...
            ],
          ),
        ),
      ),
    ),
    code: '''ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.brush_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.layers_outlined), onPressed: () {}),
          // More icons...
        ],
      ),
    ),
  ),
)''',
  ),
  UIComponent(
    title: "Glassy Stats Card",
    category: "Dashboard",
    type: UIType.widget,
    preview: Container(
      width: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF6366F1).withOpacity(0.2),
            child: Icon(Icons.trending_up_rounded, color: Color(0xFF6366F1), size: 20),
          ),
          SizedBox(height: 14),
          Text("Total Revenue", style: TextStyle(color: Colors.grey[600], fontSize: 10)),
          SizedBox(height: 6),
          Text("\$12,450", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white70)),
        ],
      ),
    ),
    code: '''Container(
      width: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF6366F1).withOpacity(0.2),
            child: Icon(Icons.trending_up_rounded, color: Color(0xFF6366F1), size: 20),
          ),
          SizedBox(height: 14),
          Text("Total Revenue", style: TextStyle(color: Colors.grey[600], fontSize: 10)),
          SizedBox(height: 6),
          Text("\$12,450", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white70)),
        ],
      ),
    ),''',
  ),
  UIComponent(
    title: "Chip Category Selector",
    category: "UI Elements",
    type: UIType.widget,
    preview: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF6366F1),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Color(0xFF6366F1).withOpacity(0.3), blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Text("Design", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("Code", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ),
      ],
    ),
    code: '''Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF6366F1),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Color(0xFF6366F1).withOpacity(0.3), blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Text("Design", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("Code", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ),
      ],
    ),''',
  ),
  UIComponent(
    title: "Neo-Profile Card",
    category: "Profile Screens",
    type: UIType.page,
    preview: Container(
      height: 210,
      width: 180,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.tealAccent.withAlpha(51), width: 0.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          SizedBox(height: 10),
          Text("Faysal Ahmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 6),
          Text("Full Stack Developer", style: TextStyle(color: Colors.grey, fontSize: 10)),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.local_florist)),
              IconButton(onPressed: (){}, icon: Icon(Icons.layers_rounded)),
              IconButton(onPressed: (){}, icon: Icon(Icons.palette)),
            ],
          )
        ],
      ),
    ),
    code: '''Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.tealAccent.withAlpha(51), width: 0.5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          SizedBox(height: 10),
          Text("Faysal Ahmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 6),
          Text("Full Stack Developer", style: TextStyle(color: Colors.grey, fontSize: 10)),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.local_florist)),
              IconButton(onPressed: (){}, icon: Icon(Icons.layers_rounded)),
              IconButton(onPressed: (){}, icon: Icon(Icons.palette)),
            ],
          )
        ],
      ),
    ),''',
  ),
  UIComponent(
    title: "Floating Glass Dock",
    category: "Navigation & Tool",
    type: UIType.widget,
    preview: Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_filled, color: Colors.white, size: 20),
          SizedBox(width: 15),
          Icon(Icons.search, color: Colors.white70, size: 20),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.white70, size: 20),
        ],
      ),
    ),
    code: '''Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_filled, color: Colors.white, size: 20),
          SizedBox(width: 15),
          Icon(Icons.search, color: Colors.white70, size: 20),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.white70, size: 20),
        ],
      ),
    ),''',
  ),
  UIComponent(
    title: "Minimal Task Card",
    category: "Productivity",
    type: UIType.widget,
    preview: Container(
      width: 120,
      height: 180,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("App Design", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[100],
            color: Colors.orangeAccent,
            minHeight: 4,
          ),
          SizedBox(height: 4),
          Text("70% Completed", style: TextStyle(color: Colors.white70, fontSize: 9)),
        ],
      ),
    ),
    code: '''Container(
      width: 120,
      height: 180,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("App Design", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[100],
            color: Colors.orangeAccent,
            minHeight: 4,
          ),
          SizedBox(height: 4),
          Text("70% Completed", style: TextStyle(color: Colors.white70, fontSize: 9)),
        ],
      ),
    )''',
  ),
  UIComponent(
    title: "Underline Animated Tabbar",
    category: "Custom Tabbar",
    type: UIType.widget,
    preview: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tab 1 (Selected)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Active",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF6366F1), // Primary Color
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Tab 2 (Unselected)
          const Text(
            "Inactive",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
    code: '''
// Usage: 
// CustomTabbar(
//   tabs: ["All", "Trending", "Popular", "Recent"],
//   selectedTab: _selectedTab,
//   onTabSelected: (tab) => setState(() => _selectedTab = tab),
// )

Widget _buildTab(String tab) {
  final bool isSelected = _selectedTab == tab;

  return GestureDetector(
    onTap: () => setState(() => _selectedTab = tab),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Reduced from 1500 for better UX
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: isSelected 
                ? const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)
                : const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
            child: Text(tab),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 3,
            width: isSelected ? 35 : 0, // Indicator expands when selected
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    ),
  );
}
''',
  ),
  UIComponent(
    title: "Expanding Search",
    category: "Search & Filter",
    type: UIType.widget,
    preview: SizedBox(
      width: 220,
      child: TextFormField(
        controller: TextEditingController(),
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          labelText: "Username",
          prefixIcon:  Icon(Icons.person, color: Colors.grey),
          hintText: "Tony",

          focusColor: Colors.amber,
          labelStyle: TextStyle(color: Colors.white70),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white54),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white54,),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyanAccent),
          ),

        ),
      ),
    ),
    code: '''TextFormField(
        controller: TextEditingController(),
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          labelText: "Username",
          prefixIcon:  Icon(Icons.person, color: Colors.grey),
          hintText: "Tony",
      
          focusColor: Colors.amber,
          labelStyle: TextStyle(color: Colors.white70),
      
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white54),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white54,),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyanAccent),
          ),
      
        ),
      )''',
  ),
  UIComponent(
    title: "Glassy Profile Card",
    category: "Advanced Cards",
    type: UIType.widget,
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 160,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightBlueAccent.withOpacity(0.05),
                Colors.lightBlueAccent.withOpacity(0.03),
              ],
            ),
            border: Border.all(
              color: Colors.blue.withOpacity(0.5),
              width: 1.2,
            ),
          ),
          child: Stack(
            children: [
              // Decorative Circle for the "Glass" look
              Positioned(
                right: -15,
                top: -15,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(0.15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.verified_user_rounded, color: Colors.blueAccent, size: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Premium User",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "ID #2018",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    code: '''ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 160,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.02),
                Colors.white.withOpacity(0.01),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: Stack(
            children: [
              // Decorative Circle for the "Glass" look
              Positioned(
                right: -15,
                top: -15,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(0.15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.verified_user_rounded, color: Colors.blueAccent, size: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Premium User",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "ID #2018",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),'''
  ),
  UIComponent(
    title: "Glow Action Button",
    category: "Buttons",
    type: UIType.widget,
    preview: Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
        ),
      ),
      child: const Text(
        "Upgrade Pro",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    ),
    code: '''
Widget buildGlowButton({
  required String text,
  required VoidCallback onTap,
  Color primaryColor = const Color(0xFF6366F1),
  Color secondaryColor = const Color(0xFF818CF8),
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          constraints: const BoxConstraints(minWidth: 120),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    ),
  );
}
''',
  ),
  UIComponent(
    title: "Soft Feedback Toast",
    category: "Feedback & Toast",
    type: UIType.widget,
    preview: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_rounded, color: Colors.green[700], size: 18),
          SizedBox(width: 8),
          Text("File Saved!", style: TextStyle(color: Colors.green[800], fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    ),
    code: '''
Widget buildSoftToast(String message, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.greenAccent.withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.greenAccent.withOpacity(0.3), width: 1.5),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 14),
        ),
        SizedBox(width: 12),
        Text(
          message,
          style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    ),
  );
}
''',
  ),
  UIComponent(
    title: "Activity Mini Chart",
    category: "Data Viz",
    type: UIType.widget,
    preview: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => Container(
        width: 10,
        height: (index + 1) * 8.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: index == 4 ? Color(0xFF6366F1) : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      )),
    ),
    code: '''
Widget buildMiniChart(List<double> data) {
  return Container(
    height: 100,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey[100]!),
    ),
    child: Row(
      mainAxisAlignment: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: data.map((value) {
        return AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 12,
          height: value * 60, // Scale the data
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF818CF8).withOpacity(0.6)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }).toList(),
    ),
  );
}
// Usage: buildMiniChart([0.4, 0.8, 0.5, 0.9, 0.7])
''',
  ),
  UIComponent(
    title: "Order Tracking Timeline",
    category: "Delivery & Logistics",
    type: UIType.page,
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 160, // Preview Card Width
        height: 210, // Preview Card Height
        color: const Color(0xFFF3F4F6), // Light Background
        child: Stack(
          children: [
            // Header (Blue Background Area)
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF6366F1), // Primary Color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_shipping_rounded, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "Track Order",
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // White Content Area (Timeline)
            Positioned(
              top: 60,
              left: 10,
              right: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: Offset(0, 2))
                    ]
                ),
                child: Column(
                  children: [
                    // Step 1 (Done)
                    _buildMiniTrackStep(Colors.greenAccent, Icons.assignment_turned_in_rounded, true),
                    _buildMiniTrackLine(),
                    // Step 2 (Active)
                    _buildMiniTrackStep(Colors.orangeAccent, Icons.delivery_dining_rounded, false),
                    _buildMiniTrackLine(),
                    // Step 3 (Pending)
                    _buildMiniTrackStep(Colors.grey[300]!, Icons.inventory_2_rounded, false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    code: '''
// full page implementation of Delivery Status Screen
class DeliveryStatusPage extends StatelessWidget {
  const DeliveryStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6366F1), // Using a primary brand color
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            // Custom App Bar Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const Text(
                    "Delivery Status",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TrackStepWidget(
                        icon: Icons.assignment_turned_in_rounded,
                        iconBgColor: Color(0xFFFFF8E1),
                        iconColor: Colors.orange,
                        title: "Order Taken",
                        isDone: true,
                      ),
                      const TrackStepLine(),
                      const TrackStepWidget(
                        icon: Icons.Outdoor_grill_rounded,
                        iconBgColor: Color(0xFFF5F5F5),
                        iconColor: Colors.blueGrey,
                        title: "Order Is Being Prepared",
                        isDone: true,
                      ),
                      const TrackStepLine(),
                      const TrackStepWidget(
                        icon: Icons.delivery_dining_rounded,
                        iconBgColor: Color(0xFFFFEBEE),
                        iconColor: Colors.redAccent,
                        title: "Order Is Being Delivered",
                        subtitle: "Your delivery agent is coming",
                        isDone: false,
                        isActive: true,
                      ),
                      
                      // Map Preview Integration
                      Padding(
                        padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.map_outlined, size: 50, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      
                      const TrackStepLine(),
                      const TrackStepWidget(
                        icon: Icons.inventory_2_rounded,
                        iconBgColor: Color(0xFFE8F5E9),
                        iconColor: Colors.green,
                        title: "Order Received",
                        isDone: false,
                        isLast: true,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Internal Widgets for the Timeline ---

class TrackStepWidget extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final bool isDone;
  final bool isActive;
  final bool isLast;

  const TrackStepWidget({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.isDone = false,
    this.isActive = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              if (subtitle != null)
                Text(subtitle!, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            ],
          ),
        ),
        if (isDone)
          const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 12,
            child: Icon(Icons.check, color: Colors.white, size: 14),
          )
        else if (isActive)
          const CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 12,
            child: Icon(Icons.local_phone, color: Colors.white, size: 14),
          )
        else if (isLast)
          const Icon(Icons.more_horiz, color: Colors.orange),
      ],
    );
  }
}

class TrackStepLine extends StatelessWidget {
  const TrackStepLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: List.generate(4, (i) => Container(
          width: 2,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 2),
          color: const Color(0xFF6366F1).withOpacity(0.3),
        )),
      ),
    );
  }
}
''',
  ),

  UIComponent(
    title: "Modern Expandable Menu",
    category: "Navigation",
    type: UIType.page,
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 160,
        height: 220,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.close, size: 16, color: Colors.black87),
              ),
            ),
            // TabBar Preview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMiniTab("WOMEN", true),
                _buildMiniTab("MEN", false),
                _buildMiniTab("KIDS", false),
              ],
            ),
            const SizedBox(height: 15),
            // Expandable List Preview
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    _buildMiniExpansionTile("New In"),
                    _buildMiniExpansionTile("Apparel"),
                    _buildMiniExpansionTile("Accessories"),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, size: 12, color: Colors.grey),
                        const SizedBox(width: 10),
                        Icon(Icons.camera_alt, size: 12, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    code: '''class MenuExpandScreen extends StatefulWidget {
  const MenuExpandScreen({super.key});

  @override
  State<MenuExpandScreen> createState() => _MenuExpandScreenState();
}

class _MenuExpandScreenState extends State<MenuExpandScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {})); // ✅
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Close Button
              Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ),
              const SizedBox(height: 16),

              // ✅ TabBar
              TabBar(
                isScrollable: false,
                tabAlignment: TabAlignment.fill,
                controller: _tabController,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: [
                  _buildTab("WOMEN", 0),
                  _buildTab("MEN", 1),
                  _buildTab("KIDS", 2),
                ],
              ),

              const SizedBox(height: 8),

              // ✅ Menu List
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMenuList("women"),
                    _buildMenuList("men"),
                    _buildMenuList("kids"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                spacing: 15,
                children: [
                  Icon(Icons.call, size: 20),
                  Text("(786) 713-8616", style: AppTextStyle.text33Grey16w400),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                spacing: 15,
                children: [
                  Icon(Icons.location_pin, size: 20),
                  Text("Store locator", style: AppTextStyle.text33Grey16w400),
                ],
              ),

              const SizedBox(height: 30),

              CustomDivider(width: 60),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.twitter,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.instagram,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.youtube,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Tab _buildTab(String label, int index) {
    bool isActive = _tabController.index == index;
    return Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: isActive
                ? AppTextStyle.tabActive18w400
                : AppTextStyle.tabUnActive18w400,
          ),
          const SizedBox(height: 6),
          isActive
              ? _buildDiamondIndicator()
              : Container(
                  margin: EdgeInsets.only(top: 3, bottom: 3),
                  height: 1,
                  width: double.infinity,
                  color: AppColors.divider55Color.withAlpha(40),
                ),
        ],
      ),
    );
  }

  Widget _buildMenuList(String key) {
    final list = menuData[key] ?? [];
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final items = list[index]['items'] as List<String>; // ✅ cast
        return Column(
          children: [
            ExpansionTile(
              shape: Border(),
              title: Text(
                list[index]['category'] as String, // ✅ cast
                style: AppTextStyle.textBlack16w400,
              ),
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/category_items',
                        arguments: {
                          'tab': key[0].toUpperCase() + key.substring(1),
                          'category': list[index]['category'] as String,
                          'item': item,
                        },
                      );
                    },
                    title: Text(item, style: AppTextStyle.text33Grey16w400),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDiamondIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 1, width: 30, color: AppColors.primaryColor),
        const SizedBox(width: 2),
        Transform.rotate(
          angle: 45 * 3.14159 / 180,
          child: Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(color: AppColors.primaryColor, width: 0.5),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Container(height: 1, width: 30, color: AppColors.primaryColor),
      ],
    );
  }
}''',
  ),
];


Widget _buildMiniTab(String label, bool isActive) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 8, // Very small for preview
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
      const SizedBox(height: 2),
      if (isActive)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 0.5, width: 10, color: Colors.orange), // Primary Color
            Transform.rotate(
              angle: 45 * 3.14 / 180,
              child: Container(height: 3, width: 3, color: Colors.orange),
            ),
            Container(height: 0.5, width: 10, color: Colors.orange),
          ],
        )
      else
        Container(height: 0.5, width: 25, color: Colors.grey.withOpacity(0.2)),
    ],
  );
}
Widget _buildMiniExpansionTile(String title) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 0.5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.black87),
        ),
        const Icon(Icons.keyboard_arrow_down, size: 12, color: Colors.grey),
      ],
    ),
  );
}


Widget _buildMiniTrackStep(Color iconColor, IconData icon, bool isDone) {
  return Row(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: iconColor, size: 14),
      ),
      SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 6, width: double.infinity, color: Colors.grey[300]), // Skeleton Title
            SizedBox(height: 3),
            Container(height: 4, width: 40, color: Colors.grey[200]), // Skeleton Subtitle
          ],
        ),
      ),
      if (isDone) Icon(Icons.check_circle_rounded, color: Colors.green, size: 12),
    ],
  );
}
Widget _buildMiniTrackLine() {
  return Padding(
    padding: const EdgeInsets.only(left: 12),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 1.5,
        height: 10,
        color: Colors.grey[200],
      ),
    ),
  );
}