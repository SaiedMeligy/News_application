
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/constant.dart';
import '../../../models/ArticalDataModel.dart';

class ArticalItemWidget extends StatefulWidget {
  final Articles artical;
   const ArticalItemWidget({ super.key,required this.artical});

  @override
  State<ArticalItemWidget> createState() => _ArticalItemWidgetState();
}

class _ArticalItemWidgetState extends State<ArticalItemWidget> {
  late bool _isLoading = false;
  //final now = DateTime.now();
  late DateTime timestamp;


  @override
  void initState() {
    _isLoading = true;
    timestamp = DateTime.parse(widget.artical.publishedAt ?? "");
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ?
    const Skeletonizer(

        child: Card(
          child: ListTile(
            title: Text('Item number 1 as title'),
            subtitle: Text('Subtitle here'),
            trailing: Skeleton.replace(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.ac_unit, size: 32),
                  SizedBox(width: 8, height: 20,),
                  Icon(Icons.access_alarm, size: 32),
                ],
              ),
            ),
          ),
        ))
        :
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 250,
            child:
            CachedNetworkImage(
              imageUrl: _normalizeUrl(widget.artical.urlToImage ?? ""),
              imageBuilder: (context, imageProvider) =>
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 60, color: Colors.grey,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.artical.source?.name ?? "",
              style: Constants.theme.textTheme.bodySmall!.copyWith(
                  color: const Color(0xff79828B),
                  fontSize: 12
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.artical.title ?? "",
              style: Constants.theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              getRelativeTime(timestamp, DateTime.now() ),
              style: Constants.theme.textTheme.bodySmall!.copyWith(
                  color: const Color(0xff79828B),
                  fontSize: 12
              ),
              textAlign: TextAlign.end,
            ),
          ),
          TextButton(
            onPressed:
                () async {
              Uri url = Uri.parse(widget.artical.url ?? "");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                return;
              }
            }
            ,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.end,
                  "View Full Article",
                  style: Constants.theme.textTheme.bodySmall!.copyWith(
                    color: const Color(0xff42505C),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5,),
                const Icon(Icons.arrow_forward_outlined, color: Color(0xff42505C),size: 20,)
              ],
            ),
          ),

        ],
      ),
    );
  }

  // void _launchURL() async {
  //   Uri url = Uri.parse(widget.artical.url??"");
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     print('Could not launch URL: $url');
  //   }
  // }

  String getRelativeTime(DateTime timestamp, DateTime now) {
    final difference = now.difference(timestamp);
    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1
          ? ''
          : 's'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1
          ? ''
          : 's'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else {
      return '${(difference.inDays / 7).floor()} week${(difference.inDays / 7)
          .floor() == 1 ? '' : 's'} ago';
    }
  }
  String _normalizeUrl(String url) {
    // Remove any extra slashes from the URL
    return url.replaceAll(RegExp(r'https://+'), 'https://');
  }
}
