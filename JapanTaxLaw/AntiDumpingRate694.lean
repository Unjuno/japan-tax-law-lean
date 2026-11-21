import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate694 — 不当廉売関税率 69.4%（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 426CO0000000415
  Revision: 426CO0000000415_20150425_427CO0000000215
  Raw snapshot: data/raw/426CO0000000415_20150425_427CO0000000215.law.json
  Article Num 2, flat/normalized leaf text 54 chars, U+3000 count 0.

原文逐語:
  「…不当廉売関税の税率は、六十九・四パーセントとする。」

Computation（原文逐語から導出、税率定数のみ、千分率で厳密表現）:
  ratePerMille = 694（69.4% = 694/1000）
  dutyYen(value) = value * 694 / 1000

Scope / NOT MODELLED:
  - 特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate694

open JapanTaxLaw.TaxFinance

/-- 税率 = 69.4% = 694/1000。 -/
def ratePerMille : Nat := 694

/-- 税額 = value * 694 / 1000（自然数除算、切捨て）。 -/
def dutyYen (value : Money) : Money :=
  value * ratePerMille / 1000

example : ratePerMille = 694 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 694 := by decide
example : dutyYen 10000 = 6940 := by decide

end JapanTaxLaw.AntiDumpingRate694
