import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/data/cata_data.dart';
import '../../states/both_states.dart';

class CatImageCubit extends Cubit<PetImageState> {
  final CatImageService _catImageService;

  CatImageCubit(this._catImageService) : super(const PetImageInitial());

  Future<void> fetchCatImage() async {
    emit(const PetImageLoading());
    try {
      final catImageUrl = await _catImageService.getRandomCatImageUrl();
      emit(PetImageLoaded(catImageUrl as String));
    } catch (e) {
      emit(PetImageError(e.toString().replaceFirst("Exception: ", "")));
    }
  }
}
