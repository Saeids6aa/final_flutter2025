import 'package:final_flutter2025/widgets/AppBottomNavBar.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedSize;
  String? selectedGear;
  String? selectedCategory;
  String? selectedColor;
  String? selectedEngineCapacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تصفية"),
        backgroundColor: const Color(0xFF00C6FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("حجم السيارة"),
            buildOptionChips(["كبيرة", "متوسطة", "صغيرة"], selectedSize, (value) {
              setState(() => selectedSize = value);
            }),

            const SizedBox(height: 16),
            buildSectionTitle("ناقل الحركة"),
            buildOptionChips(["يدوي", "أوتوماتيك"], selectedGear, (value) {
              setState(() => selectedGear = value);
            }),

            const SizedBox(height: 16),
            buildSectionTitle("الفئة"),
            buildOptionChips(["رياضية", "اقتصادية", "عائلية", "فاخرة"], selectedCategory, (value) {
              setState(() => selectedCategory = value);
            }),

            const SizedBox(height: 16),
            buildSectionTitle("اللون"),
            buildColorOptions(),

            const SizedBox(height: 16),
            buildSectionTitle("سعة المحرك"),
            buildOptionChips(
              ["<2000 CC", "2500 CC", "3000 CC", "3500 CC"],
              selectedEngineCapacity,
                  (value) => setState(() => selectedEngineCapacity = value),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: تطبيق الفلاتر
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C6FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("احجز الآن", style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(context, 2),

    );
  }

  Widget buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  Widget buildOptionChips(List<String> options, String? selected, Function(String) onSelected) {
    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          selectedColor: const Color(0xFF00C6FF),
          backgroundColor: Colors.grey[200],
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
          onSelected: (_) => onSelected(option),
        );
      }).toList(),
    );
  }

  Widget buildColorOptions() {
    final colors = {
      "red": Colors.red,
      "orange": Colors.orange,
      "blue": Colors.blue,
      "purple": Colors.purple,
      "black": Colors.black,
      "green": Colors.green,
    };

    return Wrap(
      spacing: 12,
      children: colors.entries.map((entry) {
        final isSelected = selectedColor == entry.key;
        return GestureDetector(
          onTap: () => setState(() => selectedColor = entry.key),
          child: CircleAvatar(
            radius: isSelected ? 18 : 16,
            backgroundColor: entry.value,
            child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 18) : null,
          ),
        );
      }).toList(),
    );
  }
}
