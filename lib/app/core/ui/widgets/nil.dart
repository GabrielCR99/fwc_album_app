import 'package:flutter/widgets.dart';

final class Nil extends Widget {
  const Nil({super.key});

  @override
  Element createElement() => _NilElement(this);
}

final class _NilElement extends Element {
  _NilElement(Nil super.widget);

  @override
  void mount(Element? parent, Object? newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() => super.performRebuild();
}
