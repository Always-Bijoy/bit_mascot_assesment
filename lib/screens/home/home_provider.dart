import 'package:erp/data/repository/repository.dart';
import 'package:erp/data/model/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeProvider extends ChangeNotifier {
  List<PhotosModel> photosList = <PhotosModel>[];
  PhotosModel? albums;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  int page = 1;
  bool isError = false;

  HomeProvider(){
    loadItems();
  }

  loadItems() {
    page = 1;
    fetchAlbum();
  }

  loadMoreItems() {
    page = page + 1;
    fetchAlbum();
    refreshController.loadComplete();
  }

  void setItems(List<PhotosModel> item) {
    photosList.clear();
    photosList = item;
    refreshController.refreshCompleted();
    isError = false;
    notifyListeners();
  }

  void setMoreItems(List<PhotosModel> item) {
    photosList.addAll(item);
    refreshController.loadComplete();
    notifyListeners();
  }

  Future fetchAlbum() async {
    var data = {"_page": page.toString()};

    final response = await Repository.getPhotos(data);
    if (response.isNotEmpty == true) {
      if (page == 1) {
        setItems(response);
      } else {
        setMoreItems(response);
      }
    } else {
      setFetchError();
    }
    debugPrint(photosList.length.toString());
    notifyListeners();
    return;
  }

  setFetchError() {
    if (page == 1) {
      isError = true;
      refreshController.refreshFailed();
      notifyListeners();
    } else {
      refreshController.loadFailed();
      notifyListeners();
    }
  }
}
