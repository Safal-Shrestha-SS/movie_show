// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/switchtheme_cubit.dart';
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
          ),
          actions: [
            BlocBuilder<SwitchthemeCubit, SwitchthemeState>(
                builder: (context, state) {
              state as SwitchthemeInitial;
              return IconButton(
                onPressed: () async {
                  final switchCubit = context.read<SwitchthemeCubit>();
                  switchCubit.switchTheme();
                },
                icon: state.isDarkThemeOn
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
              );
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              color: Theme.of(context).primaryColor,
              elevation: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Hero(
                        tag: data.title,
                        child: Badge(
                          badgeColor: Theme.of(context).secondaryHeaderColor,
                          position: BadgePosition.bottomStart(
                              bottom: -7.h, start: 2.w),
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
                    ),
                    Center(
                      child: Text(
                        data.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
