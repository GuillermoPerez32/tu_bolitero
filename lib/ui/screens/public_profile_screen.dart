import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/humanize.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';
import 'package:tu_bolitero/ui/logic/public_profiles/public_profiles_cubit.dart';

class PublicProfileScreen extends StatelessWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, postState) {
        return BlocBuilder<PublicProfilesCubit, PublicProfilesState>(
          builder: (context, state) {
            return state.maybeWhen(
                loaded: (profile) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        profile.username!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    body: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return <Widget>[
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(profile.photo!),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            _buildStatColumn(
                                              'Publicaciones',
                                              formatter.format(profile
                                                      .posts!.length +
                                                  profile.profilePosts!.length),
                                            ),
                                            _buildStatColumn(
                                              'Seguidores',
                                              formatter.format(
                                                  profile.followersCount!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      if (profile.fullName.isNotEmpty)
                                        Text(
                                          profile.fullName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      if (profile.info!.isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            profile.info!,
                                            maxLines: 5,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                      body: const Center(child: Text('Publicaciones')),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  );
                },
                orElse: () => const Center(child: CircularProgressIndicator()));
          },
        );
      },
    );
  }

  Column _buildStatColumn(String label, String number) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          number,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
