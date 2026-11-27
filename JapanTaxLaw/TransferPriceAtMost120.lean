import JapanTaxLaw.TaxFinance

/-!
# TransferPriceAtMost120 — 租税特別措置法施行令 art.25の18の3（120%以下）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「当該独立企業間価格とみなされる金額が当該対価の額とした額に百分の百二十を乗じて計算した金額を超えない場合」
Computation: threshold(base) = base * 120 / 100; within(price,base) = price <= threshold(base)。
Scope: 独立企業間価格の算定・調整は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.TransferPriceAtMost120

def percentNum : Nat := 120
def rateDen : Nat := 100

def threshold (base : Nat) : Nat := base * percentNum / rateDen

def within (price base : Nat) : Bool := price <= threshold base

example : within 120 100 = true := by decide
example : within 121 100 = false := by decide

end JapanTaxLaw.TransferPriceAtMost120
