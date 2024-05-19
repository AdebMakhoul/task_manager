class GetMyOccasionParams {
  int? status;
  int? skip;
  int? limit;

  GetMyOccasionParams({
    this.skip,
    this.status,
    this.limit,
  });

  GetMyOccasionParams.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    limit = json['limit'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (skip != null) data['skip'] = skip;
    if (limit != null) data['limit'] = limit;
    if (status != null) data['Status'] = status;

    return data;
  }
}
