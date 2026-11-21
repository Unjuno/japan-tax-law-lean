import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate — 不当廉売関税率（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 428CO0000000196
  Revision: 428CO0000000196_20210814_503CO0000000231
  Raw snapshot: data/raw/428CO0000000196_20210814_503CO0000000231.law.json
  Article Num 2, flat/normalized leaf text 99 chars, U+3000 count 0.

原文逐語:
  「大韓民国を原産地とするものにあっては四十九・五パーセント、中国を原産地とする
   ものにあっては七十三・七パーセントとする。」

Computation（原文逐語から導出、税率定数のみ、千分率で厳密表現）:
  koreaRatePerMille  = 495（49.5% = 495/1000）
  chinaRatePerMille  = 737（73.7% = 737/1000）
  dutyYen(rate, value) = value * rate / 1000

Scope / NOT MODELLED:
  - 原産地の認定、別表の上欄/下欄の生産者別税率、課税価格の算定は NOT MODELLED。
  - 本スライスは本文に明記された 2 つの税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate

open JapanTaxLaw.TaxFinance

/-- 大韓民国の税率 = 49.5% = 495/1000。 -/
def koreaRatePerMille : Nat := 495
/-- 中国の税率 = 73.7% = 737/1000。 -/
def chinaRatePerMille : Nat := 737

/-- n/1000 の税率を課税価格に適用（自然数除算、切捨て）。 -/
def dutyYen (ratePerMille : Nat) (value : Money) : Money :=
  value * ratePerMille / 1000

example : koreaRatePerMille = 495 := by decide
example : chinaRatePerMille = 737 := by decide
example : dutyYen koreaRatePerMille 1000 = 495 := by decide
example : dutyYen chinaRatePerMille 1000 = 737 := by decide
example : dutyYen koreaRatePerMille 10000 = 4950 := by decide

end JapanTaxLaw.AntiDumpingRate
