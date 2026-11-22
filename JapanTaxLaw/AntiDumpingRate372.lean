import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate372 — 不当廉売関税率 37.2%（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 502CO0000000208
  Revision: 502CO0000000208_20200917_502CO0000000279
  Raw snapshot: data/raw/502CO0000000208_20200917_502CO0000000279.law.json
  Article Num 2, flat/normalized leaf text 54 chars, U+3000 count 0.

原文逐語:
  「…不当廉売関税の税率は、三十七・二パーセントとする。」

Computation（原文逐語から導出、税率定数のみ、千分率で厳密表現）:
  ratePerMille = 372（37.2% = 372/1000）
  dutyYen(value) = value * 372 / 1000

Scope / NOT MODELLED:
  - 特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate372

open JapanTaxLaw.TaxFinance

/-- 税率 = 37.2% = 372/1000。 -/
def ratePerMille : Nat := 372

/-- 税額 = value * 372 / 1000（自然数除算、切捨て）。 -/
def dutyYen (value : Money) : Money :=
  value * ratePerMille / 1000

example : ratePerMille = 372 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 372 := by decide
example : dutyYen 10000 = 3720 := by decide

end JapanTaxLaw.AntiDumpingRate372
