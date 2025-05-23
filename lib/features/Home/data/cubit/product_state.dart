part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductsLoading extends ProductState {}

final class GetProductsSuccess extends ProductState {}

final class GetProductsError extends ProductState {}

final class UploadImageLoading extends ProductState {}

final class UploadImageSuccess extends ProductState {}

final class UploadImageError extends ProductState {}

final class EditProductLoading extends ProductState {}

final class EditProductSuccess extends ProductState {}

final class EditProductError extends ProductState {}

final class DeleteProductLoading extends ProductState {}

final class DeleteProductSuccess extends ProductState {}

final class DeleteProductError extends ProductState {}

final class AddProductLoading extends ProductState {}

final class AddProductSuccess extends ProductState {}

final class AddProductError extends ProductState {}