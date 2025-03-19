class QueryParameters {
  static Map<String, dynamic> brandsQueryParameters({required int limitNum}) {
    return {
      "limit": limitNum,
    };
  }

  static Map<String, dynamic> allProductsQueryParameters({
    required int limitNum,
    String? sort,
  }) {
    return {
      "limit": limitNum,
      "sort": sort,
    };
  }

  static Map<String, dynamic> allProductsForSpecificSubCategoryQueryParameters(
      {required String subCategoryId}) {
    return {
      "subcategory": subCategoryId,
    };
  }

  static Map<String, dynamic> allProductsByCategory(
      {required String categoryId}) {
    return {"category": categoryId};
  }

  static Map<String, dynamic> allProductsByBrand({required String brandId}) {
    return {"brand": brandId};
  }
}
