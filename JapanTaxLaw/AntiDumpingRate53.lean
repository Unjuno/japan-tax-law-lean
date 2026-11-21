import JapanTaxLaw.TaxFinance

/-!
# AntiDumpingRate53 — 不当廉売関税率 53.0%（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 429CO0000000234
  Revision: 429CO0000000234_20230204_505CO0000000028
  Raw snapshot: data/raw/429CO0000000234_20230204_505CO0000000028.law.json
  Article Num 2, flat/normalized leaf text 101 chars, U+3000 count 0.

原文逐語:
  「不当廉売関税の税率は、五十三・〇パーセント（別表の上欄に掲げる生産者により
   生産された特定貨物にあっては、それぞれ同表の下欄に定める税率）とする。」

Computation（原文逐語から導出、本文税率定数のみ、千分率で厳密表現）:
  ratePerMille = 530（53.0% = 530/1000）
  dutyYen(value) = value * 530 / 1000

Scope / NOT MODELLED:
  - 別表の生産者別税率（下欄）は NOT MODELLED（本スライスは本文の 53.0% のみ）。
  - 原産地認定、課税価格算定、暫定不当廉売関税の適用条件は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AntiDumpingRate53

open JapanTaxLaw.TaxFinance

/-- 税率 = 53.0% = 530/1000。 -/
def ratePerMille : Nat := 530

/-- 税額 = value * 530 / 1000（自然数除算、切捨て）。 -/
def dutyYen (value : Money) : Money :=
  value * ratePerMille / 1000

example : ratePerMille = 530 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 530 := by decide
example : dutyYen 10000 = 5300 := by decide

end JapanTaxLaw.AntiDumpingRate53
