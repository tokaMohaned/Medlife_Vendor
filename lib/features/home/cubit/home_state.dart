abstract class HomeState {}

class HomeInit extends HomeState {}

class UploadMedicalEquipmentsLoading extends HomeState {}

class UploadMedicalEquipmentsSuccess extends HomeState {}

class UploadMedicalEquipmentsError extends HomeState {
  final String message;

  UploadMedicalEquipmentsError(this.message);
}

class UploadMedicalEquipmentImagesLoading extends HomeState {}

class UploadMedicalEquipmentsImagesSuccess extends HomeState {}

class UploadMedicalEquipmentsImagesError extends HomeState {
  final String message;

  UploadMedicalEquipmentsImagesError(this.message);
}
