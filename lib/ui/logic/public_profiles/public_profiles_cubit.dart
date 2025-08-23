import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/public_profiles_datasource.dart';
import 'package:tu_bolitero/domain/models/public_profile.dart';

part 'public_profiles_state.dart';
part 'public_profiles_cubit.freezed.dart';

class PublicProfilesCubit extends Cubit<PublicProfilesState> {
  PublicProfilesCubit() : super(const PublicProfilesState.initial());

  void getPublicProfile(int id) async {
    emit(const PublicProfilesState.loading());
    final publicProfile = await publicProfilesDatasource.getPublicProfile(id);
    emit(PublicProfilesState.loaded(publicProfile));
  }
}
