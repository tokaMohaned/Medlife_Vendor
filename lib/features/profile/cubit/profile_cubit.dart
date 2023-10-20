import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/profile/cubit/profile_state.dart';
import 'package:medlife_v2/features/profile/data/services/profile_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';
import 'package:medlife_v2/utils/data/models/vendor.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  final profileFirebaseService = ProfileFirebaseService();
  late Vendor vendor;

  Future<void> getVendor() async {
    emit(ProfileLoading());
    try {
      vendor = await profileFirebaseService.getVendor();
      emit(GetUserSuccess());
    } catch (e) {
      emit(GetUserError(Failure.fromException(e).message));
    }
  }
  Future<void> updateVendor(Vendor updateVendor) async {
    emit(UpdateUserLoading());
    try {
      await profileFirebaseService.updateVendor(updateVendor);
      emit(UpdateUserSuccess());
    } catch (e) {
      emit(UpdateUserError(Failure.fromException(e).message));
    }
  }
}
