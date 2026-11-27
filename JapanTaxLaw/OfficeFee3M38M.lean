import JapanTaxLaw.TaxFinance

/-!
# OfficeFee3M38M — 地方税法 art.734（特別区外にも所在する場合 300万/380万円）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「三百万円（事務所等が特別区の区域外にも所在する場合以外の場合には、三百八十万円）」
Computation: 区域外にも所在する場合は 3,000,000 円、それ以外は 3,800,000 円。
Scope: 事務所の所在判定・算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.OfficeFee3M38M

def outsideWardsAmount : Nat := 3_000_000
def otherAmount : Nat := 3_800_000

def amount (alsoOutsideSpecialWards : Bool) : Nat :=
  if alsoOutsideSpecialWards then outsideWardsAmount else otherAmount

example : amount true = 3_000_000 := by decide
example : amount false = 3_800_000 := by decide

end JapanTaxLaw.OfficeFee3M38M
