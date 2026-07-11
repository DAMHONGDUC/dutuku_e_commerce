class ReviewCommentModel {
  final String? id;
  final String? userName;
  final String? comment;
  final double? rating;
  final String? createdAt;
  final List<ReviewAssetModel>? assets;

  const ReviewCommentModel({
    this.id,
    this.userName,
    this.comment,
    this.rating,
    this.createdAt,
    this.assets,
  });
}

class ReviewAssetModel {
  final String? url;
  final String? type;

  const ReviewAssetModel({this.url, this.type});
}
