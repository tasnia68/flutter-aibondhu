import 'package:flutter/material.dart';

class ProblemSelectionScreen extends StatefulWidget {
  const ProblemSelectionScreen({super.key});

  @override
  State<ProblemSelectionScreen> createState() => _ProblemSelectionScreenState();
}

class Category {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  Category({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _ProblemSelectionScreenState extends State<ProblemSelectionScreen> {
  final List<Category> categories = [
    Category(title: 'পারিবারিক', description: 'বিবাহ, তালাক, ভরণপোষণ ও অভিভাবকত্ব', icon: Icons.family_restroom, color: const Color(0xFFD0BB95)),
    Category(title: 'জমি ও সম্পত্তি', description: 'নামজারি, দখল, রেজিস্ট্রেশন ও বন্টন', icon: Icons.landscape, color: Colors.blue),
    Category(title: 'ফৌজদারি', description: 'মামলা, জামিন, জিডি ও পুলিশি সহায়তা', icon: Icons.gavel, color: Colors.red),
    Category(title: 'চেক ও অর্থ', description: 'চেক ডিজঅনার, লোন ও আর্থিক লেনদেন', icon: Icons.payments, color: Colors.green),
    Category(title: 'দলিল ও চুক্তি', description: 'চুক্তিপত্র, হলফনামা ও লিগ্যাল নোটিশ', icon: Icons.description, color: Colors.purple),
    Category(title: 'সাইবার অপরাধ', description: 'হ্যাকিং, ব্ল্যাকমেইল ও ডিজিটাল নিরাপত্তা', icon: Icons.security, color: Colors.cyan),
    Category(title: 'ব্যবসা ও কোম্পানি', description: 'ট্রেড লাইসেন্স, কোম্পানি গঠন ও ভ্যাট', icon: Icons.storefront, color: Colors.orange),
    Category(title: 'অন্যান্য', description: 'অন্য যেকোনো আইনি পরামর্শ', icon: Icons.more_horiz, color: Colors.grey),
  ];

  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFFF7F7F6),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.grey),
            onPressed: () {},
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.balance, color: Color(0xFFD0BB95)),
              const SizedBox(width: 8),
              const Text(
                'আইনবন্ধু',
                style: TextStyle(
                  color: Color(0xFFD0BB95),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                  onPressed: () {},
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xFFD0BB95),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 20,),
              ),
            ),
          ],
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'সমস্যার ধরণ\nনির্বাচন করুন',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Manrope',
                      color: Color(0xFF2A3441)
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'সঠিক আইনজীবী খুঁজে পেতে আপনার আইনি সমস্যার ক্যাটাগরি বেছে নিন',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'সমস্যা খুঁজুন (যেমন: জমি, ডিভোর্স)...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18)
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = selectedCategoryIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? const Color(0xFFD0BB95) : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 4)
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: category.color.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(category.icon, color: category.color),
                                  ),
                                  if (isSelected)
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD0BB95),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.check, color: Colors.white, size: 16),
                                    ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF2A3441)
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    category.description,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[600],
                                      height: 1.4
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 120) // For bottom button spacing
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F6).withOpacity(0.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF7F7F6).withOpacity(0.0),
              const Color(0xFFF7F7F6).withOpacity(1.0),
              const Color(0xFFF7F7F6).withOpacity(1.0),
            ],
            stops: [0.0, 0.4, 1.0]
          )
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD0BB95),
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadowColor: const Color(0xFFD0BB95).withOpacity(0.5),
            elevation: 8
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'পরবর্তী ধাপ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: Colors.white
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
