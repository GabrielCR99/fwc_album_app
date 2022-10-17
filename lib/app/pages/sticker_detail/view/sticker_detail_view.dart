abstract class StickerDetailView {
  void screenLoaded(
    String countryCode,
    String stickerNumber,
    String countryName,
    int amount, {
    required bool hasSticker,
  });

  void updateAmount(int amount);
  void showLoader();

  void saveSuccess();

  void error(String error);
}
