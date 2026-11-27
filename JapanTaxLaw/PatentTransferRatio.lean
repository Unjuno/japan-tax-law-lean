import JapanTaxLaw.TaxFinance

/-!
# PatentTransferRatio — 租税特別措置法施行令 art.21の17の2(2) 取引数割合（bounded slice）

Sources (pinned):
  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json
  Normative id: NORM|4eac22eb12ef2a7a84f5379a5e149609fa458fcb98279c2c09fc0f7a9a53e4ed
  Article Num 21_17_2, paragraph 2.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「当該金額に取引数（当該特許権譲渡等取引及び当該特定特許権等に係る他の特許権譲渡等取引の数をいう。以下この号において同じ。）から一を控除した数が取引数のうちに占める割合を乗じて計算した金額」

Computation（入力: 金額・取引数。割合 = (取引数 - 1) / 取引数）:
  ratioAdjusted(amount, count) =
    if count = 0 then 0 else amount * (count - 1) / count

Scope / NOT MODELLED:
  - 特許権譲渡等取引の認定、特定特許権等の判定、当該金額の算定、
    端数処理の詳細は NOT MODELLED。
  - 本モデルは一つ少ない取引数の割合計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.PatentTransferRatio

/-- 取引数から一を控除した数の割合を金額に乗じた額（下限 0）。 -/
def ratioAdjusted (amount : Nat) (count : Nat) : Nat :=
  if count = 0 then 0 else amount * (count - 1) / count

example : ratioAdjusted 100 0 = 0 := by decide
example : ratioAdjusted 100 1 = 0 := by decide
example : ratioAdjusted 100 2 = 50 := by decide
example : ratioAdjusted 100 4 = 75 := by decide

end JapanTaxLaw.PatentTransferRatio
