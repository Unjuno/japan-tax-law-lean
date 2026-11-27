import JapanTaxLaw.TaxFinance

/-!
# CustomsFee76000 — 税関関係手数料令 art.2（7.6万円／指定者7.54万円）
Sources (pinned): law `329CO0000000164` / rev `329CO0000000164_20250401_507CO0000000141`.
原文: 「七万六千円（当該許可を受ける者が指定者である場合にあつては、七万五千四百円）」
Computation: fee(designated) = if designated then 75_400 else 76_000。
Scope: 許可の要件・指定者の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsFee76000

def standardFee : Nat := 76_000
def designatedFee : Nat := 75_400

def fee (designated : Bool) : Nat :=
  if designated then designatedFee else standardFee

example : fee false = 76_000 := by decide
example : fee true = 75_400 := by decide

end JapanTaxLaw.CustomsFee76000
