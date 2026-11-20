import JapanTaxLaw.CustomsInvestigationDeadline

/-!
# CustomsInvestigationDeadlineSpec — independent spec for 関税定率法 art.8(2) para.8

Law id: 143AC0000000054
Revision: 143AC0000000054_20260601_508AC0000000005
Statutory article: art. 8(2) paragraph 8 (前項の調査を第四項の調査終了日までに終了)
Normative unit: NORM|4034ae765e5c94d4bbd4588b6536d08053f9a82d48e12c78330531a3d78aa234

The implementation states the deadline as `endDay ≤ refDay`. The spec uses a
deliberately different formulation: `endDay - refDay = 0` (truncated Nat
substitution). For Nat, `endDay ≤ refDay` iff `endDay - refDay = 0`; the kernel
proves this equivalence for ALL day-index pairs, not a finite sample.

Boundary theorems are universal over their variables.

Not modelled: the investigation procedure, the substantive anti-dumping duty
rules of art.8(2), other paragraphs and 政令 details.
-/

namespace JapanTaxLaw.CustomsInvestigationDeadline

/-- Independent spec: truncated-subtraction formulation (different from ≤). -/
def specWithinInvestigationDeadline (endDay refDay : Nat) : Prop :=
  endDay - refDay = 0

/-- Soundness/correspondence for all day-index pairs. Universal, kernel-checked. -/
theorem agree_investigation_deadline (endDay refDay : Nat) :
    withinInvestigationDeadline endDay refDay ↔
      specWithinInvestigationDeadline endDay refDay := by
  unfold withinInvestigationDeadline specWithinInvestigationDeadline
  exact Nat.sub_eq_zero_iff_le.symm

/-- Boundary: finishing exactly on the reference day satisfies the deadline. -/
theorem deadline_at_reference (refDay : Nat) :
    withinInvestigationDeadline refDay refDay := by
  unfold withinInvestigationDeadline
  omega

/-- Boundary: finishing one day after the reference day fails. -/
theorem deadline_one_day_late (refDay : Nat) :
    ¬ withinInvestigationDeadline (refDay + 1) refDay := by
  unfold withinInvestigationDeadline
  omega

/-- Monotonicity: if endDay ≤ refDay and refDay ≤ later, then endDay ≤ later. -/
theorem deadline_extends_to_later_ref {endDay refDay later : Nat}
    (h1 : withinInvestigationDeadline endDay refDay)
    (h2 : refDay ≤ later) :
    withinInvestigationDeadline endDay later := by
  unfold withinInvestigationDeadline at h1 ⊢
  omega

/-- Finite smoke check only; `agree_investigation_deadline` is the proof. -/
def checkInvestigationDeadline (endDay refDay : Nat) : Bool := endDay <= refDay

example : checkInvestigationDeadline 5 5 = true := by decide
example : checkInvestigationDeadline 3 5 = true := by decide
example : checkInvestigationDeadline 6 5 = false := by decide

example : (withinInvestigationDeadline 5 5 ↔ specWithinInvestigationDeadline 5 5) :=
  agree_investigation_deadline 5 5

end JapanTaxLaw.CustomsInvestigationDeadline
