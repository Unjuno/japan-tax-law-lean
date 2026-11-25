import JapanTaxLaw.SecrecyBreachPenaltyCeilingsSpec

/-
# SecrecyBreachPenaltyCeilingsTests — kernel-decided checks for 租税特別措置透明化法 art.12

Closed Nat/Bool expressions discharged by `rfl` / `by decide`, or theorem
applications. Coverage: both ceilings, inclusive boundaries, one-over cases,
zero, Nat identities, and impl/spec agreement.
-/

namespace JapanTaxLaw.SecrecyBreachPenaltyCeilings

-- (a) pinned statutory values.
example : imprisonmentMonthsCap = 2 := rfl
example : fineYenCap = 1000000 := rfl

-- (b) imprisonment ceiling.
example : withinImprisonmentCeiling 0 = true := by decide
example : withinImprisonmentCeiling 2 = true := by decide
example : withinImprisonmentCeiling 3 = false := by decide

-- (c) fine ceiling.
example : withinFineCeiling 0 = true := by decide
example : withinFineCeiling 1000000 = true := by decide
example : withinFineCeiling 1000001 = false := by decide

-- (d) Nat identities.
example : 2 + 0 = 2 := by decide
example : 1000000 + 0 = 1000000 := by decide

-- (e) kernel-decided impl/spec agreement.
example : withinImprisonmentCeiling 2 = specWithinImprisonment 2 := by decide
example : withinImprisonmentCeiling 3 = specWithinImprisonment 3 := by decide
example : withinFineCeiling 1000000 = specWithinFine 1000000 := by decide
example : withinFineCeiling 1000001 = specWithinFine 1000001 := by decide

-- (f) universal theorems applied to arbitrary amounts.
example (m : Nat) : withinImprisonmentCeiling m = specWithinImprisonment m := agree_imprisonment_months m
example (y : Nat) : withinFineCeiling y = specWithinFine y := agree_fine_yen y

-- (g) independent spec constants.
example : specImprisonmentMonthsCap = 2 := rfl
example : specFineYenCap = 1000000 := rfl

end JapanTaxLaw.SecrecyBreachPenaltyCeilings
