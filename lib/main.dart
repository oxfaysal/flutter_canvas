import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Node;
import 'package:flutter_canvas/widget/search_bar.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clipboard/clipboard.dart';
import 'package:highlight/highlight.dart' show highlight, Node;
import 'package:url_launcher/url_launcher.dart';
import 'controller/canvas_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlutterCanvas());
}

class FlutterCanvas extends StatelessWidget {
  const FlutterCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Flutter Canvas | LoomixDev',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const CanvasDashboard(),
    );
  }
}

// --- DATA MODEL ---
enum UIType { widget, page }

class UIComponent {
  final String title;
  final String category;
  final Widget preview;
  final String code;
  final UIType type;

  UIComponent({
    required this.title,
    required this.category,
    required this.preview,
    required this.code,
    required this.type,
  });
}

// --- MAIN UI (Stateless) ---
class CanvasDashboard extends StatelessWidget {
  const CanvasDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CanvasController());
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: isMobile ? _buildDrawer(controller) : null,
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          Row(
            children: [
              if (!isMobile) _buildGlassSidebar(controller),
              Expanded(
                child: Column(
                  children: [
                    _buildResponsiveHeader(isMobile, controller),
                    Expanded(
                      child: Obx(
                        () => controller.selectedCategory.value == null
                            ? _buildCategoryGrid(controller)
                            : _buildComponentGrid(controller),
                      ),
                    ),
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- REBUILD-FREE HEADER ---
  Widget _buildResponsiveHeader(bool isMobile, CanvasController controller) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (isMobile)
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                ),
              Obx(
                () => controller.selectedCategory.value != null
                    ? IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                        onPressed: () =>
                            controller.selectedCategory.value = null,
                      )
                    : const SizedBox(),
              ),

              const SizedBox(width: 10),
              Expanded(
                child: Obx(
                  () => Text(
                    controller.selectedCategory.value ??
                        (controller.activeType.value == UIType.widget
                            ? "Explore Widget"
                            : "Templates"),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (!isMobile)
                _headerAction(FontAwesomeIcons.github, () {
                  _launchURL("https://oxfaysal.github.io");
                }),
              if (!isMobile) const SizedBox(width: 15),
              _buildProfileAvatar(),
            ],
          ),
          const SizedBox(height: 15),
          Align(
            alignment: isMobile ? Alignment.center : Alignment.centerRight,
            child: LoomixSearchBar(
              width: isMobile ? double.infinity : 300,
              controller: controller.searchController,
              onChanged: (val) => controller.searchQuery.value = val,
            ),
          ),
        ],
      ),
    );
  }

  // --- DRAWER & SIDEBAR ---
  Widget _buildDrawer(CanvasController controller) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: _buildSidebarContent(controller, true),
        ),
      ),
    );
  }

  Widget _buildGlassSidebar(CanvasController controller) {
    return Container(
      width: 270,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: _buildSidebarContent(controller, false),
    );
  }

  Widget _buildSidebarContent(CanvasController controller, bool isDrawer) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildLogo(),
            const SizedBox(height: 60),
            _sidebarItem(
              controller,
              "Widgets",
              Icons.widgets_outlined,
              UIType.widget,
              isDrawer,
            ),
            _sidebarItem(
              controller,
              "Templates",
              Icons.auto_awesome_mosaic_rounded,
              UIType.page,
              isDrawer,
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "v2.0.1 STABLE",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sidebarItem(
    CanvasController controller,
    String title,
    IconData icon,
    UIType type,
    bool isDrawer,
  ) {
    return Obx(() {
      bool isSelected = controller.activeType.value == type;
      return ListTile(
        onTap: () {
          controller.switchType(type);
          if (isDrawer) Get.back();
        },
        leading: Icon(
          icon,
          color: isSelected ? const Color(0xFF818CF8) : Colors.white30,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white30,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      );
    });
  }

  // --- GRID RENDERERS ---
  Widget _buildCategoryGrid(CanvasController controller) {
    return Obx(() {
      final categories = controller.categories;
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.6,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => _GlassCategoryCard(
          title: categories[index],
          onTap: () => controller.selectedCategory.value = categories[index],
        ),
      );
    });
  }

  Widget _buildComponentGrid(CanvasController controller) {
    return Obx(() {
      final items = controller.filteredComponents
          .where((e) => e.category == controller.selectedCategory.value)
          .toList();
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => _GlassComponentCard(
          item: items[index],
          onCode: () => _showCodeEditor(items[index]),
        ),
      );
    });
  }

  // --- DESIGN FUNCTIONS (REMAINS SAME) ---
  Widget _buildBackgroundGradient() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF020617)),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            left: -50,
            child: CircleAvatar(
              radius: 200,
              backgroundColor: const Color(0xFF6366F1).withOpacity(0.05),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -50,
            child: CircleAvatar(
              radius: 200,
              backgroundColor: const Color(0xFFA855F7).withOpacity(0.05),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() => Column(
    children: [
      const FaIcon(
        FontAwesomeIcons.diceD20,
        color: Color(0xFF818CF8),
        size: 32,
      ),
      const SizedBox(height: 12),
      Text(
        "CANVAS",
        style: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w900,
          letterSpacing: 4,
          fontSize: 18,
        ),
      ),
    ],
  );

  Widget _headerAction(FaIconData icon, VoidCallback onTap) => InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FaIcon(icon, size: 18, color: Colors.white70),
    ),
  );

  Widget _buildProfileAvatar() => InkWell(
    onTap: () => _showAboutModal(),
    child: Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
        ),
      ),
      child: const CircleAvatar(
        radius: 18,
        backgroundColor: Color(0xFF0F172A),
        child: Icon(Icons.person, size: 20, color: Colors.white),
      ),
    ),
  );

  // --- MODALS & FOOTER ---
  void _showCodeEditor(UIComponent item) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: Get.width > 900 ? 850 : Get.width * 0.9,
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(Icons.terminal, color: Color(0xFF6366F1)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(20),
                              child: SelectableText.rich(
                                _convertHighlightToTextSpan(item.code),
                                cursorColor: const Color(0xFF6366F1),
                                showCursor: true,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: ElevatedButton.icon(
                              onPressed: () => FlutterClipboard.copy(item.code),
                              icon: const Icon(Icons.copy, size: 12),
                              label: const Text(
                                "Copy",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextSpan _convertHighlightToTextSpan(String code) {
    final result = highlight.parse(code, language: 'dart');
    return TextSpan(
      style: GoogleFonts.firaCode(
        fontSize: 12,
        height: 1.6,
        color: const Color(0xffabb2bf),
      ),
      children: _buildNodes(result.nodes!),
    );
  }

  List<TextSpan> _buildNodes(List<Node> nodes, {TextStyle? parentStyle}) {
    List<TextSpan> spans = [];
    for (var node in nodes) {
      TextStyle? nodeStyle = parentStyle;
      if (node.className != null) {
        switch (node.className) {
          case 'keyword':
          case 'built_in':
          case 'type':
            nodeStyle = const TextStyle(
              color: Color(0xFFC678DD),
              fontWeight: FontWeight.bold,
            );
            break;
          case 'title':
          case 'function':
            nodeStyle = const TextStyle(color: Color(0xFF61AFEF));
            break;
          case 'string':
          case 'attr':
            nodeStyle = const TextStyle(color: Color(0xFF98C379));
            break;
          case 'number':
          case 'literal':
            nodeStyle = const TextStyle(color: Color(0xFFD19A66));
            break;
          case 'comment':
            nodeStyle = const TextStyle(
              color: Color(0xFF5C6370),
              fontStyle: FontStyle.italic,
            );
            break;
        }
      }
      if (node.value != null) {
        spans.add(TextSpan(text: node.value, style: nodeStyle));
      } else if (node.children != null) {
        spans.addAll(_buildNodes(node.children!, parentStyle: nodeStyle));
      }
    }
    return spans;
  }

  Widget _buildFooter() => Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        const Text(
          "© 2026 - All Right Reserved by LoomixDev",
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
        const Spacer(),
        _socialIcon(
          FontAwesomeIcons.facebook,
          "https://web.facebook.com/0xfaysal",
        ),
        const SizedBox(width: 15),
        _socialIcon(FontAwesomeIcons.github, "https://oxfaysal.github.io"),
        const SizedBox(width: 15),
        _socialIcon(FontAwesomeIcons.telegram, "https://t.me/loomixdev"),
        const SizedBox(width: 15),
        _socialIcon(FontAwesomeIcons.whatsapp, "https://wa.me/+8801833732555"),
      ],
    ),
  );

  Widget _socialIcon(FaIconData icon, String url) => InkWell(
    onTap: () => _launchURL(url),
    child: FaIcon(icon, size: 15, color: Colors.white54),
  );

  void _showAboutModal() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          backgroundColor: const Color(0xFF0F172A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/248434219',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Faysal",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter Developer",
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(color: Colors.white10),
              ),
              _buildAboutLink(
                FontAwesomeIcons.envelope,
                "loomixdev@gmail.com",
                () => _launchURL("mailto:loomixdev@gmail.com"),
              ),
              _buildAboutLink(
                FontAwesomeIcons.github,
                "github.com/oxfaysal",
                () => _launchURL("https://github.com/oxfaysal"),
              ),
              _buildAboutLink(
                FontAwesomeIcons.facebook,
                "facebook.com/0xfaysal",
                () => _launchURL("https://web.facebook.com/0xfaysal"),
              ),
              _buildAboutLink(
                FontAwesomeIcons.whatsapp,
                "whatsapp/01833732555",
                () => _launchURL("https://wa.me/+8801833732555"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutLink(FaIconData icon, String text, VoidCallback onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            FaIcon(icon, size: 16, color: const Color(0xFF818CF8)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- UTILS & CARDS (SAME BUT CLEANER) ---
Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $urlString');
  }
}

class _GlassCategoryCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _GlassCategoryCard({required this.title, required this.onTap});

  @override
  State<_GlassCategoryCard> createState() => _GlassCategoryCardState();
}

class _GlassCategoryCardState extends State<_GlassCategoryCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(28),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              colors: [
                isHovered
                    ? Colors.white.withOpacity(0.12)
                    : Colors.white.withOpacity(0.05),
                isHovered
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white.withOpacity(0.01),
              ],
            ),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF818CF8).withOpacity(0.5)
                  : Colors.white.withOpacity(0.08),
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -20,
                right: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(
                          0xFF6366F1,
                        ).withOpacity(isHovered ? 0.2 : 0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.layers_rounded,
                      size: 20,
                      color: isHovered ? Colors.white : const Color(0xFF818CF8),
                    ),
                    const Spacer(),
                    Text(
                      widget.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
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

class _GlassComponentCard extends StatefulWidget {
  final UIComponent item;
  final VoidCallback onCode;

  const _GlassComponentCard({required this.item, required this.onCode});

  @override
  State<_GlassComponentCard> createState() => _GlassComponentCardState();
}

class _GlassComponentCardState extends State<_GlassComponentCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(isHovered ? 0.05 : 0.02),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isHovered
                ? const Color(0xFF6366F1).withOpacity(0.5)
                : Colors.white.withOpacity(0.05),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: AnimatedScale(
                scale: isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Center(child: widget.item.preview),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.item.category,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onCode,
                    icon: const Icon(
                      Icons.code,
                      size: 18,
                      color: Color(0xFF818CF8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
