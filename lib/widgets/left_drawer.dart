import 'package:flutter/material.dart';
import 'package:redunited_store/screens/menu.dart';
import 'package:redunited_store/screens/productlist_form.dart';
import 'package:redunited_store/screens/product_entry_list.dart';
import 'package:redunited_store/screens/my_product_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:redunited_store/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Gradient
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF8B0000), // Maroon
                    Color(0xFFDA291C), // Bright Red
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Shield Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shield,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'RedUnited',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Seluruh produk Manchester United terkini di sini!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFFFD700),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Home
            _buildDrawerItem(
              context: context,
              icon: Icons.home_rounded,
              title: 'Home',
              color: const Color(0xFF8B0000),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            
            // Create Product
            _buildDrawerItem(
              context: context,
              icon: Icons.add_circle_rounded,
              title: 'Create Product',
              color: const Color(0xFFDA291C),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductFormPage()),
                );
              },
            ),
            
            // All Product
            _buildDrawerItem(
              context: context,
              icon: Icons.inventory_2_rounded,
              title: 'All Product',
              color: const Color(0xFF8B0000),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                );
              },
            ),
            
            // My Product
            _buildDrawerItem(
              context: context,
              icon: Icons.person_pin_rounded,
              title: 'My Product',
              color: const Color(0xFF006400),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProductListPage()),
                );
              },
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Divider(thickness: 1),
            ),
            
            // Logout
            _buildDrawerItem(
              context: context,
              icon: Icons.logout_rounded,
              title: 'Logout',
              color: Colors.red[700]!,
              onTap: () async {
                try {
                  Navigator.pop(context);
                  
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF8B0000),
                        ),
                      );
                    },
                  );

                  final response = await request.logout(
                    "http://localhost:8000/auth/logout/",
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }

                  if (context.mounted) {
                    bool isSuccess = response['status'] == true || 
                                    response['status'] == 'success' ||
                                    response['status'] == 'True';
                    
                    if (isSuccess) {
                      String uname = response["username"] ?? "";
                      String message = response["message"] ?? "Logout successful";
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$message See you again, $uname."),
                          backgroundColor: const Color(0xFF006400),
                        ),
                      );
                      
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    } else {
                      String message = response["message"] ?? "Logout failed";
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Logout error: ${e.toString()}"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}