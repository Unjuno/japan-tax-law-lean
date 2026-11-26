import JapanTaxLaw.TaxFinance

/-!
# GeneralTariffLowerRate — 不当廉売関税一般税率（別表税率と条約税率の低い方）bounded slice

Sources (pinned):
  Law id: 414CO0000000262
  Revision: 414CO0000000262_20110401_423CO0000000088
  Raw snapshot: data/raw/414CO0000000262_20110401_423CO0000000088.law.json
  Normative id: NORM|2716d0b794ffcbd5453a423cf8d85e04c8e471b2fa1ace304f72d74b1490004d
  Article Num 4, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「特定貨物に課する不当廉売関税及び一般税率（法の別表の税率及び条約に規定する税率のうちいずれか低いものをいう。）による関悦については、それぞれ別個の関税として関税法（昭和二十九年法律第六十一号）第二章の規定を適用する。」

Computation（入力は提供された税率。単位は同一の整数目盛り）:
  generalRate(statutoryRate, treatyRate) =
    if treatyRate < statutoryRate then treatyRate else statutoryRate

Scope / NOT MODELLED:
  - 特定貨物の認定、別表・条約の税率の検索、不当廉売の認定、
    関税法第二章の適用手続は NOT MODELLED。
  - 本モデルは二つの提供税率の低い方を選ぶ計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.GeneralTariffLowerRate

/-- 別表税率と条約税率のうち低い方を一般税率とする。 -/
def generalRate (statutoryRate : Nat) (treatyRate : Nat) : Nat :=
  if treatyRate < statutoryRate then treatyRate else statutoryRate

example : generalRate 0 0 = 0 := by decide
example : generalRate 100 50 = 50 := by decide
example : generalRate 50 100 = 50 := by decide
example : generalRate 100 100 = 100 := by decide

end JapanTaxLaw.GeneralTariffLowerRate
