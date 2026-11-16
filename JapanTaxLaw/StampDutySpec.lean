import JapanTaxLaw.StampDuty

/-!
# StampDuty spec — independent statement of art. 20

Source (pinned):
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F

Independent restatement of 印紙税法 art. 20 （過怠税）:

  Art. 20(1): discovered non-payment  →
                penalty = unpaid + 2 × unpaid = 3 × unpaid
  Art. 20(2): anticipated self-declared (before investigation) →
                penalty = unpaid + 10% = 110%
  Art. 20(3): un-cancelled stamps → penalty = face value of unused stamps
  Art. 20(4): aggregate penalty < ¥1,000 → ¥1,000 minimum (except when only
              art. 20(2) penalties are aggregated, art. 20(5) exempts it)
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: penalty for art. 20(1) (discovered) unpaid duty. -/
def specAuditPenalty (unpaid : Money) : Money := unpaid * 3

/-- Spec: penalty for art. 20(2) (self-declared before investigation). -/
def specDeclaredPenalty (unpaid : Money) : Money := unpaid + (unpaid * 10) / 100

/-- Spec: art. 20(4) floor — ¥1,000 minimum unless solely (art. 20(2)). -/
def specFloor (amount : Money) (only20_2 : Bool) : Money :=
  if only20_2 then amount
  else if amount < 1_000 then 1_000 else amount

/-- Boundary cases, all kernel-decided. -/
example : specAuditPenalty 0 = 0 := by decide
example : specAuditPenalty 100 = 300 := by decide
example : specAuditPenalty 334 = 1_002 := by decide
example : specAuditPenalty 999 = 2_997 := by decide

example : specDeclaredPenalty 0 = 0 := by decide
example : specDeclaredPenalty 100 = 110 := by decide
example : specDeclaredPenalty 200 = 220 := by decide

example : specFloor 0 false = 1_000 := by decide
example : specFloor 999 false = 1_000 := by decide
example : specFloor 1_000 false = 1_000 := by decide
example : specFloor 0 true = 0 := by decide
example : specFloor 999 true = 999 := by decide

/-- Impl ≡ spec on a coarse grid of small values, kernel-decided. -/
def stampCheckGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 =>
        (specAuditPenalty 0 == stampAuditPenalty 0) &&
        (specDeclaredPenalty 0 == stampDeclaredPenalty 0) &&
        (specFloor 0 false) == stampDutyFloor 0 &&
        (specFloor 0 true) == 0
    | k + 1 =>
        let a := (k + 1) * 333
        go k &&
          (specAuditPenalty a == stampAuditPenalty a) &&
          (specDeclaredPenalty a == stampDeclaredPenalty a) &&
          (specFloor a false) == stampDutyFloor a
  go 30

set_option maxRecDepth 2048

example : stampCheckGrid = true := by decide

/-- Art. 20 aggregate self-consistency: audit-only aggregates at the floor
    match ¥1,000 exactly when underpaid by ¥333 or less. -/
example : 333 * 3 = 999 := by decide
example : 334 * 3 = 1_002 := by decide



-- ==== §20(4)/(5) aggregate penalty (spec, independent restatement) ====

/-- Spec: §20(5) — floor exempt iff no non-declared components exist. -/
def specStampFloorExempt (auditPenalty uncancelledPenalty : Money) : Bool :=
  auditPenalty == 0 && uncancelledPenalty == 0

/-- Spec: §20(4)/(5) — aggregate with floor exemption rule. -/
def specStampAggregatePenalty (auditPenalty uncancelledPenalty declaredPenalty : Money) : Money :=
  let rawSum := auditPenalty + uncancelledPenalty + declaredPenalty
  if specStampFloorExempt auditPenalty uncancelledPenalty then rawSum
  else if rawSum < 1_000 then 1_000 else rawSum

example : specStampAggregatePenalty 0 0 0 = 0 := by decide
example : specStampAggregatePenalty 0 0 500 = 500 := by decide
example : specStampAggregatePenalty 0 0 999 = 999 := by decide
example : specStampAggregatePenalty 0 0 1_000 = 1_000 := by decide
example : specStampAggregatePenalty 0 0 2_500 = 2_500 := by decide
example : specStampAggregatePenalty 0 100 0 = 1_000 := by decide
example : specStampAggregatePenalty 0 999 0 = 1_000 := by decide
example : specStampAggregatePenalty 0 1_000 0 = 1_000 := by decide
example : specStampAggregatePenalty 0 5_000 0 = 5_000 := by decide
example : specStampAggregatePenalty 100 0 0 = 1_000 := by decide
example : specStampAggregatePenalty 2_500 0 0 = 2_500 := by decide
example : specStampAggregatePenalty 300 0 100 = 1_000 := by decide
example : specStampAggregatePenalty 0 100 200 = 1_000 := by decide
example : specStampAggregatePenalty 300 300 300 = 1_000 := by decide
example : specStampAggregatePenalty 2_000 100 500 = 2_600 := by decide
example : specStampAggregatePenalty 0 400 400 = 1_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeStampPenaltyPoints : Bool :=
  [ (0, 0, 0), (0, 0, 500), (0, 0, 999), (0, 0, 1_000), (0, 0, 2_500),
    (0, 100, 0), (0, 999, 0), (0, 1_000, 0), (0, 5_000, 0),
    (100, 0, 0), (2_500, 0, 0),
    (300, 0, 100), (0, 100, 200), (300, 300, 300), (2_000, 100, 500), (0, 400, 400) ].all fun (a, u, d) =>
    stampAggregatePenalty ⟨a, u, d⟩ == specStampAggregatePenalty a u d

example : agreeStampPenaltyPoints = true := by decide

end JapanTaxLaw
