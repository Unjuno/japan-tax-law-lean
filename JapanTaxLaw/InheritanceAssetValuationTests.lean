import JapanTaxLaw.InheritanceAssetValuation

/-!
# InheritanceAssetValuation tests — 相続税法 art. 23 / 25 の kernel-decide スモーク

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

割合表の全区分・全境界値（ちょうど 10 年は 5%、10 年超は 10%、…、50 年超は 90%）
と存続期間不定の地上権（40%）、および評価額・art. 25 の 90% 適用を
カーネルが `decide` する退行テスト。
-/

namespace JapanTaxLaw.InheritanceAssetValuation

open JapanTaxLaw.TaxFinance

-- 割合表: 各区分の下端・上端（全 10 区分の境界を網羅）
example : (superficiesRate 1 false).num = 5 := by decide
example : (superficiesRate 10 false).num = 5 := by decide
example : (superficiesRate 11 false).num = 10 := by decide
example : (superficiesRate 15 false).num = 10 := by decide
example : (superficiesRate 16 false).num = 20 := by decide
example : (superficiesRate 20 false).num = 20 := by decide
example : (superficiesRate 21 false).num = 30 := by decide
example : (superficiesRate 25 false).num = 30 := by decide
example : (superficiesRate 26 false).num = 40 := by decide
example : (superficiesRate 30 false).num = 40 := by decide
example : (superficiesRate 31 false).num = 50 := by decide
example : (superficiesRate 35 false).num = 50 := by decide
example : (superficiesRate 36 false).num = 60 := by decide
example : (superficiesRate 40 false).num = 60 := by decide
example : (superficiesRate 41 false).num = 70 := by decide
example : (superficiesRate 45 false).num = 70 := by decide
example : (superficiesRate 46 false).num = 80 := by decide
example : (superficiesRate 50 false).num = 80 := by decide
example : (superficiesRate 51 false).num = 90 := by decide
example : (superficiesRate 1_000 false).num = 90 := by decide

-- 存続期間の定めのない地上権 → 40%（残存期間の値に依存しない）
example : (superficiesRate 1 true).num = 40 := by decide
example : (superficiesRate 25 true).num = 40 := by decide
example : (superficiesRate 40 true).num = 40 := by decide
example : (superficiesRate 999 true).num = 40 := by decide

-- 評価額 = 土地時価 × 割合（切り捨て）
example : superficiesValue 0 10 false = 0 := by decide
example : superficiesValue 200_000 10 false = 10_000 := by decide
example : superficiesValue 200_000 11 false = 20_000 := by decide
example : superficiesValue 200_000 30 false = 80_000 := by decide
example : superficiesValue 200_000 31 false = 100_000 := by decide
example : superficiesValue 200_000 51 false = 180_000 := by decide
example : superficiesValue 200_000 30 true = 80_000 := by decide
example : superficiesValue 101 10 false = 5 := by decide

-- 単調性の具体的確認
example : superficiesValue 100 10 false ≤ superficiesValue 101 10 false := by decide
example : art25NoSurrenderValue 100 ≤ art25NoSurrenderValue 101 := by decide

-- 第25条（明確な部分のみ）: × 90%、切り捨て
example : art25NoSurrenderValue 1_000 = 900 := by decide
example : art25NoSurrenderValue 1_001 = 900 := by decide
example : art25NoSurrenderValue 9_999 = 8_999 := by decide

end JapanTaxLaw.InheritanceAssetValuation
