import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/home/cubit/home_state.dart';
import 'package:medlife_v2/features/home/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/home/data/services/medical_equipments_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInit());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final _medicalEquipmentFirebaseService = MedicalEquipmentsFirebaseService();

  Future<void> uploadMedicalEquipmentToFireStore(
    MedicalEquipment equipment,
    List<File> imageFiles,
  ) async {
    emit(UploadMedicalEquipmentsLoading());
    try {
      await _medicalEquipmentFirebaseService.addMedicalEquipment(
        equipment,
        imageFiles,
      );
      emit(UploadMedicalEquipmentsSuccess());
    } catch (e) {
      emit(UploadMedicalEquipmentsError(Failure.fromException(e).message));
    }
  }

  Future<void> uploadMedicalEquipmentImagesToFireStorage(
    List<File> imageFiles,
  ) async {
    emit(UploadMedicalEquipmentImagesLoading());
    try {
      await _medicalEquipmentFirebaseService.uploadImages(imageFiles);
      emit(UploadMedicalEquipmentsImagesSuccess());
    } catch (e) {
      emit(
        UploadMedicalEquipmentsImagesError(Failure.fromException(e).message),
      );
    }
  }
}
