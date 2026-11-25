import JapanTaxLaw.SecrecyBreachPenaltyCeilings

/-
# SecrecyBreachPenaltyCeilingsSpec — independent spec for 租税特別措置透明化法 art.12（二年以下 / 百万円以下）

Pinned source:
  Law id: 422AC0000000008
  Revision: 422AC0000000008_20260401_507AC0000000013
  Statutory article: 第十二条
  原文逐語: 「第九条の規定に違反して、その業務に関して知り得た個人又は法人その他の団体の秘密を漏らした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」
  Normative unit: NORM|aa899a2aff6a364b1a8e0838170134762b03cd0a9655819f9a51aca918a2f697

This module carries its OWN statutory constants. For the imprisonment ceiling
it uses a distinct operator: 以下 as `¬ cap < months` rather than `months <= cap`,
with universal kernel-checked agreement by structural recursion (axiom-free).
For the fine ceiling it carries its own decimal constant; agreement is a
definitional rfl, also axiom-free. No `spec*` definition references an impl name.

Not modelled: 第九条's duty, offence elements, sentencing rules and other
articles.
-/

namespace JapanTaxLaw.SecrecyBreachPenaltyCeilings

/-- Spec-local imprisonment ceiling: 二年 = 2. -/
def specImprisonmentMonthsCap : Nat := 2

/-- Spec-local fine ceiling: 百万円 = 1000000. -/
def specFineYenCap : Nat := 1000000

/-- 以下 as negated strict order — distinct from `months <= cap`. -/
def specWithinImprisonment (months : Nat) : Bool :=
  decide (¬ specImprisonmentMonthsCap < months)

/-- 以下 for the fine, using the spec-local constant. -/
def specWithinFine (yen : Nat) : Bool :=
  decide (yen <= specFineYenCap)

-- Spec-local sanity examples (test scaffolding; excluded from statutory literals).
example : specImprisonmentMonthsCap = 2 := rfl
example : specFineYenCap = 1000000 := rfl

/-- Universal, kernel-checked, axiom-free agreement for every month count. -/
theorem agree_imprisonment_months : ∀ months : Nat,
    withinImprisonmentCeiling months = specWithinImprisonment months
  | 0 => by decide
  | 1 => by decide
  | 2 => by decide
  | Nat.succ (Nat.succ (Nat.succ (k))) => by
      unfold withinImprisonmentCeiling imprisonmentMonthsCap
      unfold specWithinImprisonment specImprisonmentMonthsCap
      rfl

/-- Definitional, axiom-free agreement for the fine ceiling. -/
theorem agree_fine_yen (yen : Nat) :
    withinFineCeiling yen = specWithinFine yen := by
  unfold withinFineCeiling fineYenCap specWithinFine specFineYenCap
  rfl

/-- Finite spec-local grid (Bool scaffolding); universal theorems are the proofs. -/
def specPenaltyGrid : Bool :=
  [0, 2, 3].all fun m =>
      specWithinImprisonment m == decide (m <= 2) &&
  [0, 1000000, 1000001].all fun y =>
      specWithinFine y == decide (y <= 1000000)

example : specPenaltyGrid = true := by decide

end JapanTaxLaw.SecrecyBreachPenaltyCeilings
