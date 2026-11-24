import JapanTaxLaw.TaxFinance

/-!
# BusinessTaxCollectionCostRate5 — 地方税法施行規則 art.24の28 事業所税徴収費 5%（bounded L4 モデル）

Sources (pinned): law 329M50000002023, revision 329M50000002023_20261101_508M60000008045,
raw data/raw/329M50000002023_20261101_508M60000008045.law.json.
原文逐語: 「法第七百一条の七十三の事業所税の徴収に要する費用は、当該年度の歳入に所属する
事業所税の額の百分の五に相当する額とする。」
Computation（金額算定のみ、Nat の下限切り捨て）:
  collectionCost(taxAmount) = taxAmount * 5 / 100
Scope / NOT MODELLED: 徴収費用の実際の支出・歳入の算定・端数処理・他の税目は NOT MODELLED。
本モデルは 5/100 の割合のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.BusinessTaxCollectionCostRate5

open JapanTaxLaw.TaxFinance

def costNum : Nat := 5
def costDen : Nat := 100

def collectionCost (taxAmount : Money) : Money :=
  taxAmount * costNum / costDen

example : collectionCost 0 = 0 := by decide
example : collectionCost 1 = 0 := by decide
example : collectionCost 100 = 5 := by decide
example : collectionCost 1_000 = 50 := by decide

end JapanTaxLaw.BusinessTaxCollectionCostRate5
