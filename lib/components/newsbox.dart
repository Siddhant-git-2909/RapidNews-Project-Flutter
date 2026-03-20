import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/text.dart';
import 'package:technewz/components/webview_page.dart';

import 'components.dart';

class NewsBox extends StatelessWidget {
  final String? imageurl, title, time, description, url;

  const NewsBox({
    Key? key,
    this.imageurl,
    this.title,
    this.time,
    this.description,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    // Safe image fallback
    String image = (imageurl != null && imageurl!.isNotEmpty)
        ? imageurl!
        : "https://via.placeholder.com/150";

    return Column(
      children: [
        InkWell(
          onTap: () {
            if (url != null && url!.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(url: url!),
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  width: 60,
                  height: 60,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      modifiedText(
                        color: AppColors.white,
                        size: 16,
                        text: title ?? "No Title",
                      ),
                      const SizedBox(height: 5),
                      modifiedText(
                        color: AppColors.lightwhite,
                        size: 12,
                        text: time ?? "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
