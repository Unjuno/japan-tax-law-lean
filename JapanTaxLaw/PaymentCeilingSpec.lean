import JapanTaxLaw.PaymentCeiling

/-!
# PaymentCeiling spec — 「こえてはならない」（以下）の独立定式
Sources (pinned): law 329AC0000000036, revision 329AC0000000036_20240101_431AC0000000003.
Independent restatement: Nat.ble（Bool レベルの以下）を Nat 上で直接適用。
-/

namespace JapanTaxLaw.PaymentCeiling

/-- 独立定式: Nat 上の Bool 比較 ble（実装の <= とは別の定式）。 -/
def specWithin (a : Nat) (p : Nat) : Bool := Nat.ble a p

example : specWithin 100 100 = true := by decide
example : specWithin 101 100 = false := by decide
example : specWithin 50 100 = true := by decide

def agreePaymentCeiling : Bool :=
  [(0,0), (0,100), (50,100), (100,100), (101,100), (200,100)].all fun ap => orderWithinPlan ap.1 ap.2 == specWithin ap.1 ap.2

example : agreePaymentCeiling = true := by decide

end JapanTaxLaw.PaymentCeiling
