import JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand

/-
# PenaltyCeilingsSixMonthsFiveHundredThousandSpec — independent spec for 租税条約等特例法 art.13(4)

Pinned source:
  Law id: 344AC0000000046
  Revision: 344AC0000000046_20260521_508AC0000000012
  Statutory article: 第十三条(4)
  原文逐語: 「次の各号のいずれかに該当する場合には、その違反行為をした者は、六月以下の拘禁刑又は五十万円以下の罰金に処する。」
  Normative unit: NORM|06ce1bd2e2b43bb2fb31d77ec0beca6f0da0b72a0704e63fc9126cbf83722dc9

This module carries its OWN statutory constants. For the six-month ceiling it
uses a different operator from the impl: 以下 as `¬ cap < months` rather than
`months <= cap`, and the kernel checks agreement for every Nat by structural
recursion (axiom-free). For the 500,000-yen ceiling it carries its own decimal
constant and the same relational operator; agreement is a definitional rfl,
also axiom-free. No `spec*` definition references an implementation name.

Not modelled: the 各号 conditions, offence elements, sentencing rules and other
paragraphs.
-/

namespace JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand

/-- Spec-local, independently stated imprisonment ceiling: 六月 = 6. -/
def specImprisonmentMonthsCap : Nat := 6

/-- Spec-local, independently stated fine ceiling: 五十万円 = 500000. -/
def specFineYenCap : Nat := 500000

/-- 以下 as negated strict order — a distinct formulation from `months <= cap`. -/
def specWithinImprisonment (months : Nat) : Bool :=
  decide (¬ specImprisonmentMonthsCap < months)

/-- 以下 for the fine, using the spec-local constant. -/
def specWithinFine (yen : Nat) : Bool :=
  decide (yen <= specFineYenCap)

-- Spec-local sanity examples (test scaffolding; excluded from statutory literals).
example : specImprisonmentMonthsCap = 6 := rfl
example : specFineYenCap = 500000 := rfl

/-- Finite spec-local grid (Bool scaffolding); universal theorems are the proofs. -/
def specPenaltyGrid : Bool :=
  [0, 6, 7].all fun m =>
      specWithinImprisonment m == decide (m <= 6) &&
  [0, 500000, 500001].all fun y =>
      specWithinFine y == decide (y <= 500000)

example : specPenaltyGrid = true := by decide

/-- Universal, kernel-checked, axiom-free agreement for every month count. -/
theorem agree_imprisonment_months : ∀ months : Nat,
    withinImprisonmentCeiling months = specWithinImprisonment months
  | 0 => by decide
  | 1 => by decide
  | 2 => by decide
  | 3 => by decide
  | 4 => by decide
  | 5 => by decide
  | 6 => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ k)))))) => by
      unfold withinImprisonmentCeiling imprisonmentMonthsCap
      unfold specWithinImprisonment specImprisonmentMonthsCap
      rfl

/-- Definitional, axiom-free agreement for the fine ceiling. -/
theorem agree_fine_yen (yen : Nat) :
    withinFineCeiling yen = specWithinFine yen := by
  unfold withinFineCeiling fineYenCap specWithinFine specFineYenCap
  rfl

end JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand
