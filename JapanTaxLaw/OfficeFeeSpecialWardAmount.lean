import JapanTaxLaw.TaxFinance

/-!
# OfficeFeeSpecialWardAmount — 地方税法 art.734（事務所の特別区内外による額）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「百七十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二百二十九万円）」
Computation: 区域外にも所在する場合は 1,750,000 円、それ以外は 2,290,000 円。
Scope: 事務所の所在判定・算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.OfficeFeeSpecialWardAmount

def outsideWardsAmount : Nat := 1_750_000
def otherAmount : Nat := 2_290_000

def amount (alsoOutsideSpecialWards : Bool) : Nat :=
  if alsoOutsideSpecialWards then outsideWardsAmount else otherAmount

example : amount true = 1_750_000 := by decide
example : amount false = 2_290_000 := by decide

end JapanTaxLaw.OfficeFeeSpecialWardAmount
