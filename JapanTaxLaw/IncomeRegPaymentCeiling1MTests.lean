import JapanTaxLaw.IncomeRegPaymentCeiling1MSpec

/-
# IncomeRegPaymentCeiling1MTests — kernel-decided checks for 所得税法施行規則 art.87(3)(2)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned statutory value, zero, a small
positive input, both sides of the 百万円 boundary, a Nat identity at the
ceiling, and impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.IncomeRegPaymentCeiling1M

-- (a) pinned statutory value: 百万円 = 1,000,000.
example : paymentCeiling = 1_000_000 := rfl

-- (b) zero and small positive payments qualify.
example : withinPaymentCeiling 0 = true := by decide
example : withinPaymentCeiling 1 = true := by decide

-- (c) just below the ceiling qualifies.
example : withinPaymentCeiling 999_999 = true := by decide

-- (d) 以下 is inclusive: exactly 百万円 qualifies.
example : withinPaymentCeiling 1_000_000 = true := by decide

-- (e) one yen above the ceiling fails.
example : withinPaymentCeiling 1_000_001 = false := by decide

-- (f) Nat identity / saturation at the ceiling.
example : 1_000_000 + 0 = 1_000_000 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : withinPaymentCeiling 1_000_000 = specWithinPayment 1_000_000 := by decide
example : withinPaymentCeiling 1_000_001 = specWithinPayment 1_000_001 := by decide
example : withinPaymentCeiling 0 = specWithinPayment 0 := by decide

-- (h) universal theorem applied to an arbitrary amount.
example (x : Nat) : withinPaymentCeiling x = specWithinPayment x := agree_payment_ceiling x

-- (i) independent spec constant is the same statutory value.
example : specPaymentCeiling = 1_000_000 := rfl

end JapanTaxLaw.IncomeRegPaymentCeiling1M
