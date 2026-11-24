import JapanTaxLaw.MachineryCostFloor400k

/-!
# MachineryCostFloor400kSpec — independent typed specification

Pinned source identical to the implementation module (租税特別措置法施行令
art. 27の12の4). The threshold is restated as a plain `Nat` literal read
independently from 「四十万円」 and the comparison is expressed in the
complementary (strict-less-than negation) form so the spec does not reuse the
implementation's predicate.
-/

namespace JapanTaxLaw.MachineryCostFloor400k

/-- Independent restatement of 「四十万円」 (yen). -/
def specFloor : Nat := 400000

/-- Independent formulation: not (cost < 400,000). -/
def specQualifies (cost : Nat) : Bool :=
  if cost < 400000 then false else true

example : specFloor = 400000 := by decide
example : specQualifies 0 = false := by decide
example : specQualifies 399_999 = false := by decide
example : specQualifies 400_000 = true := by decide
example : specQualifies 400_001 = true := by decide
example : specQualifies 1_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeMachineryCostFloor : Bool :=
  let costs := [0, 1, 399_999, 400_000, 400_001, 1_000_000]
  (acquisitionCostFloor == specFloor) &&
    costs.all fun c => qualifies c == specQualifies c

example : agreeMachineryCostFloor = true := by decide

end JapanTaxLaw.MachineryCostFloor400k
