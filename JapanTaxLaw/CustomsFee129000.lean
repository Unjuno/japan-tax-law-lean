import JapanTaxLaw.TaxFinance

/-!
# CustomsFee129000 — 税関関係手数料令 art.4（12.9万円／指定者12.8万円）
Sources (pinned): law `329CO0000000164` / rev `329CO0000000164_20250401_507CO0000000141`.
原文: 「十二万九千円（当該許可を受ける者が指定者である場合にあつては、十二万八千円）」
Computation: fee(designated) = if designated then 128_000 else 129_000。
Scope: 許可の要件・指定者の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsFee129000

def standardFee : Nat := 129_000
def designatedFee : Nat := 128_000

def fee (designated : Bool) : Nat :=
  if designated then designatedFee else standardFee

example : fee false = 129_000 := by decide
example : fee true = 128_000 := by decide

end JapanTaxLaw.CustomsFee129000
