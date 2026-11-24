import JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousandSpec

/-
# PenaltyCeilingsSixMonthsFiveHundredThousandTests — kernel-decided checks for 租税条約等特例法 art.13(4)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: both ceilings, their inclusive boundaries,
one-over cases, zero, Nat identities, and impl/spec agreement.
-/

namespace JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand

-- (a) pinned statutory values.
example : imprisonmentMonthsCap = 6 := rfl
example : fineYenCap = 500000 := rfl

-- (b) imprisonment ceiling: inclusive at 6, rejects 7.
example : withinImprisonmentCeiling 6 = true := by decide
example : withinImprisonmentCeiling 7 = false := by decide
example : withinImprisonmentCeiling 0 = true := by decide

-- (c) fine ceiling: inclusive at 500000, rejects 500001.
example : withinFineCeiling 500000 = true := by decide
example : withinFineCeiling 500001 = false := by decide
example : withinFineCeiling 0 = true := by decide

-- (d) Nat identities at the ceilings.
example : 6 + 0 = 6 := by decide
example : 500000 + 0 = 500000 := by decide

-- (e) kernel-decided impl/spec agreement at boundaries.
example : withinImprisonmentCeiling 6 = specWithinImprisonment 6 := by decide
example : withinImprisonmentCeiling 7 = specWithinImprisonment 7 := by decide
example : withinFineCeiling 500000 = specWithinFine 500000 := by decide
example : withinFineCeiling 500001 = specWithinFine 500001 := by decide

-- (f) universal theorems applied to arbitrary amounts.
example (m : Nat) : withinImprisonmentCeiling m = specWithinImprisonment m := agree_imprisonment_months m
example (y : Nat) : withinFineCeiling y = specWithinFine y := agree_fine_yen y

-- (g) independent spec constants.
example : specImprisonmentMonthsCap = 6 := rfl
example : specFineYenCap = 500000 := rfl

end JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand
