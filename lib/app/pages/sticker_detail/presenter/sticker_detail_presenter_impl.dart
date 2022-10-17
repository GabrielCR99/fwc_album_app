import '../../../models/sticker_model.dart';
import '../../../models/user_sticker_model.dart';
import '../../../repositories/stickers/stickers_repository.dart';
import '../../../services/sticker/find_sticer_service.dart';
import '../view/sticker_detail_view.dart';
import 'sticker_detail_presenter.dart';

class StickerDetailPresenterImpl implements StickerDetailPresenter {
  late final StickerDetailView _view;
  final FindSticerService _findSticerService;
  final StickersRepository _stickersRepository;
  UserStickerModel? _stickerUser;
  late final StickerModel _sticker;
  int amount = 0;

  StickerDetailPresenterImpl({
    required FindSticerService findSticerService,
    required StickersRepository stickersRepository,
  })  : _findSticerService = findSticerService,
        _stickersRepository = stickersRepository;

  @override
  set view(StickerDetailView view) => _view = view;

  @override
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  }) async {
    _stickerUser = stickerUser;

    if (_stickerUser == null) {
      _sticker = await _findSticerService.execute(countryCode, stickerNumber);
    }

    final hasSticker = _stickerUser != null;

    if (hasSticker) {
      amount = (_stickerUser?.duplicate ?? 0) + 1;
    }

    _view.screenLoaded(
      hasSticker: hasSticker,
      countryCode,
      stickerNumber,
      countryName,
      amount,
    );
  }

  @override
  void decrementAmount() {
    if (amount > 1) {
      amount--;
      _view.updateAmount(amount);
    }
  }

  @override
  void incrementAmount() => _view.updateAmount(++amount);

  @override
  Future<void> saveSticker() async {
    try {
      _view.showLoader();
      if (_stickerUser == null) {
        await _stickersRepository.registerUserSticker(_sticker.id, amount);
      } else {
        await _stickersRepository.updateUserSticker(
          _stickerUser!.idSticker,
          amount,
        );
      }
      _view.saveSuccess();
    } catch (e) {
      _view.error('Erro ao cadastrar ou atualizar a figurinha');
    }
  }

  @override
  Future<void> deleteSticker() async {
    _view.showLoader();
    if (_stickerUser != null) {
      await _stickersRepository.updateUserSticker(_stickerUser!.idSticker, 0);
    }
    _view.saveSuccess();
  }
}
