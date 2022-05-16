// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/constants.dart';

class MovieInfo extends StatelessWidget {
  final MovieArguments data;
  const MovieInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          data.title,
          overflow: TextOverflow.ellipsis,
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              elevation: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Badge(
                        position:
                            BadgePosition.bottomStart(bottom: -7.h, start: 2.w),
                        badgeContent: Text(data.vote.toString()),
                        child: SizedBox(
                          width: double.infinity,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: imageURL + data.posterPath,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    LinearProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        data.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                          " ${months[data.date.month]}-${data.date.day.toString()}-${data.date.year.toString()}"),
                    ),
                    const Text('Overview'),
                    Text(data.overview)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MovieArguments {
  final String posterPath;
  final String title;
  final DateTime date;
  final double vote;
  final String overview;

  MovieArguments({
    required this.posterPath,
    required this.title,
    required this.date,
    required this.vote,
    required this.overview,
  });
}



// Card(
//         child: Column(
//           children: [
//             Badge(
//               position: BadgePosition.bottomStart(bottom: -7.h, start: 2.w),
//               badgeContent: Text(data.vote.toString()),
//               child: CachedNetworkImage(
//                 fit: BoxFit.fill,
//                 imageUrl: imageURL + data.posterPath,
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     LinearProgressIndicator(value: downloadProgress.progress),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             Center(
//               child: Text(
//                 data.title,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Center(
//               child: Text(
//                   " ${months[data.date.month]}-${data.date.day.toString()}-${data.date.year.toString()}"),
//             )
//           ],
//         ),
//       );