import 'package:flutter/material.dart';

import '../widgets/AppBottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: const Color(0xFF00C6FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile_placeholder.jpg'),
            ),
            const SizedBox(height: 16),

            const Text(
              'أحمد محمد',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            const Text(
              'ahmad@example.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            buildInfoRow(Icons.phone, 'رقم الجوال', '0599123456'),
            buildInfoRow(Icons.location_on, 'المدينة', 'الرياض'),
            buildInfoRow(Icons.calendar_today, 'تاريخ الميلاد', '1 يناير 1995'),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.edit, color: Color(0xFF00C6FF)),
                label: const Text(
                  'تعديل الملف الشخصي',
                  style: TextStyle(color: Color(0xFF00C6FF)),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF00C6FF)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // TODO: تنفيذ التعديل
                },
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout,color: Colors.white,),
                label: const Text('تسجيل الخروج',
                  style: TextStyle(color: Colors.white),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,

                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // TODO: تنفيذ تسجيل الخروج
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(context, 3),

    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Color(0xFF00C6FF)),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(value),
          ],
        ),
        const Divider(height: 24),
      ],
    );
  }
}
