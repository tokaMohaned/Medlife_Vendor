abstract class HomeState {}

class HomeInit extends HomeState {}

class UploadMedicalEquipmentsLoading extends HomeState {}

class UploadMedicalEquipmentsSuccess extends HomeState {}

class UploadMedicalEquipmentsError extends HomeState {
  final String message;

  UploadMedicalEquipmentsError(this.message);
}
