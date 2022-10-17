import '../../../models/group_stickers.dart';
import '../../../repositories/stickers/stickers_repository.dart';
import '../view/my_stickers_view.dart';
import 'my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository _stickersRepository;
  late final MyStickersView _view;

  var album = <GroupStickers>[];
  var selectedStatus = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({
    required StickersRepository stickersRepository,
  }) : _stickersRepository = stickersRepository;

  @override
  Future<void> getMyAlbum() async {
    album = await _stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  void statusFilter(String status) {
    selectedStatus = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;

    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final filteredAlbum = [
        ...album.where((group) => countries.contains(group.countryCode)),
      ];
      _view.updateAlbum(filteredAlbum);
    }
  }

  @override
  Future<void> refresh() async {
    _view.showLoader();
    await getMyAlbum();
    countryFilter(countries);
    statusFilter(selectedStatus);
  }
}
