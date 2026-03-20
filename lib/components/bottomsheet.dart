import 'package:flutter/material.dart';
import 'package:technewz/components/components.dart';
import 'package:technewz/utils/text.dart';
import 'package:technewz/components/webview_page.dart'; // IMPORTANT

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return MyBottomSheetLayout(
        url: url,
        imageurl: imageurl,
        title: title,
        description: description,
      );
    },
  );
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20), // space from nav bar
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              BottomSheetImage(imageurl: imageurl, title: title),

              Padding(
                padding: const EdgeInsets.all(12),
                child: modifiedText(
                  text: description,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 NEW BUTTON
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.open_in_browser),
                  label: const Text(
                    "Read Full Article",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    if (url.isNotEmpty) {
                      Navigator.pop(context); // close bottom sheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: url),
                        ),
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

