import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(const FlutterCanvas());
}

class FlutterCanvas extends StatelessWidget {
  const FlutterCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Canvas | LoomixDev',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0175C2)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// UI Data Model
class UIComponent {
  final String name;
  final String category;
  final Widget preview;
  final String code;

  UIComponent({
    required this.name,
    required this.category,
    required this.preview,
    required this.code
  });
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'All';

  // Dummy UI Data (Apni ekhane aro components add korben)
  final List<UIComponent> components = [
    UIComponent(
      name: "Modern Gradient Button",
      category: "Buttons",
      preview: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text("Elevate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      code: '''Container(
  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
    borderRadius: BorderRadius.circular(30),
  ),
  child: Text("Elevate", style: TextStyle(color: Colors.white)),
)''',
    ),
    UIComponent(
      name: "Minimalist Login Card",
      category: "Login",
      preview: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: "Email")),
              TextField(decoration: InputDecoration(labelText: "Password"), obscureText: true),
              SizedBox(height: 10),
              Icon(Icons.login, color: Colors.blue),
            ],
          ),
        ),
      ),
      code: '// Sample Login Card UI Code...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = selectedCategory == 'All'
        ? components
        : components.where((c) => c.category == selectedCategory).toList();

    return Scaffold(
      body: Row(
        children: [
          // Navigation Sidebar
          Container(
            width: 250,
            color: const Color(0xFF1E1E2E),
            child: Column(
              children: [
                const DrawerHeader(child: Center(child: Text("FLUTTER\nCANVAS", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)))),
                _buildNavItem("All", Icons.grid_view),
                _buildNavItem("Buttons", Icons.smart_button),
                _buildNavItem("Login", Icons.lock_outline),
                _buildNavItem("Shopping", Icons.shopping_cart_outlined),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("by LoomixDev", style: TextStyle(color: Colors.white54)),
                )
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Container(
              color: const Color(0xFFF8FAFC),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UI Gallery - $selectedCategory", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 1.2
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) => _buildComponentCard(filtered[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon) {
    bool isSelected = selectedCategory == title;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.white70),
      title: Text(title, style: TextStyle(color: isSelected ? Colors.blue : Colors.white70)),
      onTap: () => setState(() => selectedCategory = title),
    );
  }

  Widget _buildComponentCard(UIComponent comp) {
    return InkWell(
      onTap: () => _showCodeDetails(comp),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: Center(child: comp.preview)),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
              child: Text(comp.name, style: const TextStyle(fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }

  void _showCodeDetails(UIComponent comp) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(comp.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 20),
              // Code Block with Scroll
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF282C34)),
                child: Stack(
                  children: [
                    // SingleChildScrollView(
                    //   padding: const EdgeInsets.all(16),
                    //   child: SyntaxView(
                    //     code: comp.code,
                    //     syntax: Syntax.DART,
                    //     theme: SyntaxTheme.dracula(),
                    //   ),
                    // ),
                    Positioned(
                      top: 10, right: 10,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          FlutterClipboard.copy(comp.code);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Code Copied!")));
                        },
                        icon: const Icon(Icons.copy, size: 16),
                        label: const Text("Copy"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}