import JapanTaxLaw.TaxFinance

/-!
# LocalTaxDependentIncomeCeiling1350k — 地方税法 art.24の5 合計所得金額 135万円（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が
百三十五万円を超える場合を除く。）」
Computation（金額要件のみ、入力は円）:
  withinCeiling(income) = income <= 1350000  （「超える場合を除く」なので境界値を含む）
Scope / NOT MODELLED: 障害者・未成年者・寡婦・ひとり親の他の要件・所得金額の算定・税額計算は NOT MODELLED。
本モデルは 135万円の上限判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k

open JapanTaxLaw.TaxFinance

def incomeCeiling : Money := 1350000

def withinCeiling (income : Money) : Bool :=
  income <= incomeCeiling

example : withinCeiling 1350000 = true := by decide
example : withinCeiling 1350001 = false := by decide

end JapanTaxLaw.LocalTaxDependentIncomeCeiling1350k
