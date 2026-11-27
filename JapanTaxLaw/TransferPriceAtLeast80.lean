import JapanTaxLaw.TaxFinance

/-!
# TransferPriceAtLeast80 — 租税特別措置法施行令 art.25の18の3（80%以上）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「当該独立企業間価格とみなされる金額が当該対価の額とした額に百分の八十を乗じて計算した金額を下回らない場合」
Computation: threshold(base) = base * 80 / 100; atLeast(price,base) = price >= threshold(base)。
Scope: 独立企業間価格の算定・調整は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.TransferPriceAtLeast80

def percentNum : Nat := 80
def rateDen : Nat := 100

def threshold (base : Nat) : Nat := base * percentNum / rateDen

def atLeast (price base : Nat) : Bool := price >= threshold base

example : atLeast 80 100 = true := by decide
example : atLeast 79 100 = false := by decide

end JapanTaxLaw.TransferPriceAtLeast80
