import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_schulte_tablosu/oyun_schulte_tablosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sayiTablosuConfig.title.length, 33);
    expect(sayiTablosuConfig.tagline.length, 33);
    for (final s in sayiTablosuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sayiTablosuConfig.gameId, sayiTablosuId);
    expect(sayiTablosuRules.gameId, sayiTablosuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sayiTablosuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sayiTablosuId, optionalMechanics: sayiTablosuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sayiTablosuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
