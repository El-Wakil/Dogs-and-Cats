import 'package:equatable/equatable.dart';

abstract class PetImageState extends Equatable {
  const PetImageState();
  @override
  List<Object?> get props => [];
}

class PetImageInitial extends PetImageState {
  const PetImageInitial();
}

class PetImageLoading extends PetImageState {
  const PetImageLoading();
}

class PetImageLoaded extends PetImageState {
  final String imageUrl;
  const PetImageLoaded(this.imageUrl);
  @override
  List<Object?> get props => [imageUrl];
}

class PetImageError extends PetImageState {
  final String message;
  const PetImageError(this.message);
  @override
  List<Object?> get props => [message];
}
