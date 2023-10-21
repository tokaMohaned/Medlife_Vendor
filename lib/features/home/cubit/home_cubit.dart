import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/home/cubit/home_state.dart';
import 'package:medlife_v2/features/home/data/services/medical_equipments_firebase_service.dart';

import '../../../utils/data/failure/failure.dart';
import '../data/models/medical_equipment.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInit());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final _medicalEquipmentFirebaseService = MedicalEquipmentsFirebaseService();

  Future<void> uploadMedicalEquipmentToFireStore(
      MedicalEquipment equipment) async {
    emit(UploadMedicalEquipmentsLoading());
    try {
      await _medicalEquipmentFirebaseService.addMedicalEquipment(equipment);
      emit(UploadMedicalEquipmentsSuccess());
    } catch (e) {
      emit(UploadMedicalEquipmentsError(Failure.fromException(e).message));
    }
  }
}
