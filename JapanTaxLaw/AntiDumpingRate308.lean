import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate308 — 不当廉売関税率 30.8%（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 503CO0000000065
  Revision: 503CO0000000065_20260709_508CO0000000223
  Raw snapshot: data/raw/503CO0000000065_20260709_508CO0000000223.law.json
  Article Num 2, flat/normalized leaf text 53 chars, U+3000 count 0.

原文逐語:
  「…不当廉売関税の税率は、三十・八パーセントとする。」

Computation（原文逐語から導出、税率定数のみ、千分率で厳密表現）:
  ratePerMille = 308（30.8% = 308/1000）
  dutyYen(value) = value * 308 / 1000

Scope / NOT MODELLED:
  - 特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate308

open JapanTaxLaw.TaxFinance

/-- 税率 = 30.8% = 308/1000。 -/
def ratePerMille : Nat := 308

/-- 税額 = value * 308 / 1000（自然数除算、切捨て）。 -/
def dutyYen (value : Money) : Money :=
  value * ratePerMille / 1000

example : ratePerMille = 308 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 308 := by decide
example : dutyYen 10000 = 3080 := by decide

end JapanTaxLaw.AntiDumpingRate308
