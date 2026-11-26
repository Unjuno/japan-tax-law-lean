import JapanTaxLaw.TaxFinance

/-!
# ConsumptionTaxRate10or8 — 消費税法 art.34（標準10%／元年軽減対象8%）
Sources (pinned): law `363AC0000000108` / rev `363AC0000000108_20261101_507AC0000000013`.
原文: 「百分の十（当該課税資産の譲渡等が元年軽減対象資産の譲渡等である場合には、百分の八）」
Computation: rate(reduced) = if reduced then 8 else 10（100分率の分子を選択）。
Scope: 軽減対象資産の認定・課税標準は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ConsumptionTaxRate10or8

def standardNum : Nat := 10
def reducedNum : Nat := 8

def rate (reduced : Bool) : Nat :=
  if reduced then reducedNum else standardNum

example : rate false = 10 := by decide
example : rate true = 8 := by decide

end JapanTaxLaw.ConsumptionTaxRate10or8
