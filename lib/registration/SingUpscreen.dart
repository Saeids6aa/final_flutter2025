import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreed = false;
  bool _obscurePass = true;
  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => profileImage = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.96),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007AFF),
                      ),
                    ),
                    const SizedBox(height: 24),

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.blue[100],
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : const AssetImage("assets/images/profile_placeholder.jpg") as ImageProvider,

                    ),
                    const SizedBox(height: 12),

                    TextButton.icon(
                      onPressed: pickImage,
                      label: const Text("تحميل صورة"),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF007AFF),
                      ),
                    ),

                    const SizedBox(height: 24),

                    inputField(label: 'الاسم', controller: nameController),
                    const SizedBox(height: 16),

                    inputField(
                      label: 'كلمة المرور',
                      controller: passwordController,
                      obscure: _obscurePass,
                      suffix: IconButton(
                        icon: Icon(
                          _obscurePass ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => setState(() => _obscurePass = !_obscurePass),
                      ),
                    ),
                    const SizedBox(height: 16),

                    inputField(label: 'البريد الإلكتروني', controller: emailController),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Checkbox(
                          value: agreed,
                          onChanged: (val) => setState(() => agreed = val ?? false),
                        ),
                        const Expanded(child: Text("أوافق على الشروط والأحكام")),
                      ],
                    ),

                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (agreed) {
                            // TODO: تنفيذ التسجيل
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C6FF),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("مستخدم جديد", style: TextStyle(fontSize: 18)),
                      ),
                    ),

                    const Divider(height: 32),
                    const Center(child: Text('أو تسجيل دخول بواسطة')),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/facebook.svg',
                              width: 24,
                              height: 24,
                              color: Colors.blue,
                            ),
                            label: const Text("فيسبوك"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 24,
                              height: 24,
                            ),
                            label: const Text("جوجل"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("لديك حساب؟ "),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: const Text(
                            "تسجيل دخول",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputField({
    required String label,
    required TextEditingController controller,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: 'أدخل $label',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
