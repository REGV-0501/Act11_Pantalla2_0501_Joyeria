import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // --- CONTENIDO ---
          Column(
            children: [
              _buildAppBar(),
              const Expanded(
                child: Center(
                  child: Text("Bienvenido a la colección JB", 
                    style: TextStyle(color: Colors.white54)),
                ),
              ),
            ],
          ),

          // --- MENÚ DESPLEGABLE ---
          if (isMenuOpen) _buildDropdownMenu(),
        ],
      ),
    );
  }

  // --- HEADER XL ---
  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF800020), // Color Guinda
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 3))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: Colors.white),
            iconSize: 35, // Tamaño Grande
            onPressed: () {},
          ),
          const Text(
            'JB',
            style: TextStyle(
              fontSize: 38, // Logo Grande
              fontWeight: FontWeight.bold,
              letterSpacing: 6,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(isMenuOpen ? Icons.close : Icons.menu, color: Colors.white),
            iconSize: 40, // Menú Grande
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
          ),
        ],
      ),
    );
  }

  // --- MENÚ NEGRO ELEGANTE (Alineación Izquierda) ---
  Widget _buildDropdownMenu() {
    return Positioned(
      top: 120, // Justo debajo del header
      left: 15,
      right: 15,
      child: Material(
        elevation: 20,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF121212), // Negro Elegante
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white10, width: 0.5),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: [
              _buildCategoryItem("Inicio"),
              _buildCategoryItem("Anillos"),
              _buildCategoryItem("Colgantes"),
              _buildCategoryItem("Collares"),
              _buildCategoryItem("Pendientes"),
              _buildCategoryItem("Pulseras"),
              _buildCategoryItem("Relojes"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Divider(color: Colors.white24, thickness: 1),
              ),
              _buildAccountItem(Icons.person, "Iniciar Sesión"),
              _buildAccountItem(Icons.person_add_alt_1, "Crear Cuenta"),
            ],
          ),
        ),
      ),
    );
  }

  // Item de categoría sin icono alineado a la izquierda
  Widget _buildCategoryItem(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      title: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left, // Alineación izquierda
        style: const TextStyle(
          fontSize: 16, 
          letterSpacing: 2.5,
          fontWeight: FontWeight.w400,
          color: Colors.white
        ),
      ),
      onTap: () => setState(() => isMenuOpen = false),
    );
  }

  // Item de cuenta con icono alineado a la izquierda
  Widget _buildAccountItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      leading: Icon(icon, color: Colors.white, size: 26),
      title: Text(
        title, 
        style: const TextStyle(fontSize: 16, color: Colors.white)
      ),
      onTap: () => setState(() => isMenuOpen = false),
    );
  }
}