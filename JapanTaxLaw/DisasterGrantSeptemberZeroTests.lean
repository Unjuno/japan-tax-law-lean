import JapanTaxLaw.DisasterGrantSeptemberZeroSpec

/-
# DisasterGrantSeptemberZeroTests — kernel-decided checks for 震災復興特別交付税額算定等省令 art.3(3)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the zero amount, one and two yen, a Nat
identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.DisasterGrantSeptemberZero

-- (a) pinned statutory value: 零 = 0.
example : septemberGrantYen = 0 := rfl

-- (b) zero qualifies; nonzero amounts do not.
example : isZeroSeptemberGrant 0 = true := by decide
example : isZeroSeptemberGrant 1 = false := by decide
example : isZeroSeptemberGrant 2 = false := by decide

-- (c) Nat identity at zero.
example : 0 + 0 = 0 := by decide

-- (d) kernel-decided impl/spec agreement at boundary points.
example : isZeroSeptemberGrant 0 = specIsZeroAmount 0 := by decide
example : isZeroSeptemberGrant 1 = specIsZeroAmount 1 := by decide
example : isZeroSeptemberGrant 2 = specIsZeroAmount 2 := by decide

-- (e) universal theorem applied to an arbitrary amount.
example (x : Nat) : isZeroSeptemberGrant x = specIsZeroAmount x := agree_zero_amount x

-- (f) independent spec value.
example : specZeroAmount = 0 := rfl

end JapanTaxLaw.DisasterGrantSeptemberZero
