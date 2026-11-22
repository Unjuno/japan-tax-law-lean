import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate952 — 不当廉売関税率 95.2%（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 507CO0000000095
  Revision: 507CO0000000095_20250703_507CO0000000240
  Raw snapshot: data/raw/507CO0000000095_20250703_507CO0000000240.law.json
  Article Num 2, flat/normalized leaf text 54 chars, U+3000 count 0.

原文逐語:
  「…不当廉売関税の税率は、九十五・二パーセントとする。」

Computation（原文逐語から導出、税率定数のみ、千分率で厳密表現）:
  ratePerMille = 952（95.2% = 952/1000）
  dutyYen(value) = value * 952 / 1000

Scope / NOT MODELLED:
  - 特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate952

open JapanTaxLaw.TaxFinance

/-- 税率 = 95.2% = 952/1000。 -/
def ratePerMille : Nat := 952

/-- 税額 = value * 952 / 1000（自然数除算、切捨て）。 -/
def dutyYen (value : Money) : Money :=
  value * ratePerMille / 1000

example : ratePerMille = 952 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 952 := by decide
example : dutyYen 10000 = 9520 := by decide

end JapanTaxLaw.AntiDumpingRate952
