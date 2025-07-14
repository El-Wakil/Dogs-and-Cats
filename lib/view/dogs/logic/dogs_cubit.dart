import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/data/dogs_data.dart';
import '../../states/both_states.dart';

class DogImageCubit extends Cubit<PetImageState> {
  final DogImageService _dogImageService;

  DogImageCubit(this._dogImageService) : super(const PetImageInitial());

  Future<void> fetchDogImage() async {
    emit(const PetImageLoading());
    try {
      final dogImageModel = await _dogImageService.getRandomDogImage();
      if (dogImageModel.status == 'success') {
        emit(PetImageLoaded(dogImageModel.imageUrl));
      } else {
        emit(const PetImageError('Dog API did not return success status.'));
      }
    } catch (e) {
      emit(PetImageError(e.toString().replaceFirst("Exception: ", "")));
    }
  }
}
