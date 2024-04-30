
class AddToCartModel {
  int? id;
  String? productName;
  String? sizeId;
  String? colorId;
  String? purchaseRate;
  double? mainPrice;
  double? salePrice;
  int? quantity;
  String? cashBackPercent;
  String? cashBackAmount;
  String? image;
  String? slug;
  String? entimate_time;
  String? description;
  String? flash_sell;
  AddToCartModel(
      {
        required this.id,
        required this.productName,
        required this.sizeId,
        required this.colorId,
        required this.purchaseRate,
        required this.mainPrice,
        required this.cashBackPercent,
        required this.cashBackAmount,
        required this.image,
        required this.quantity,
        required this.salePrice,
        required this.slug,
        this.entimate_time,
        this.description,
        this.flash_sell,
      }
      );
}
