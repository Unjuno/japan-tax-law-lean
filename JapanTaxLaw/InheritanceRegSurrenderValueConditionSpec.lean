import JapanTaxLaw.InheritanceRegSurrenderValueCondition

/-!
# InheritanceRegSurrenderValueConditionSpec — independent spec for 相続税法施行規則 第三十条(6)第一号

Law id: 325M50000040017 (相続税法施行規則, Ministerial Ordinance)
Revision: 325M50000040017_20260901_506M60000040016
Article: 第三十条(6)第一号 — 解約返戻金相当額百万円以下の生命保険契約又は損害保険契約
Normative unit: NORM|3daed7032fbd5a44d506ecc932b48bce17af305cb0e6dbb9d5645a184086d483

The implementation uses the non-strict predicate `surrenderValue ≤ thresholdYen`.
The independent spec reformulates it via strict-successor membership:
`surrenderValue < Nat.succ thresholdYen` (equivalent via `Nat.lt_succ_iff`, but a
distinct formulation). The kernel proves equivalence for ALL surrender values.

Boundary theorems: ¥1,000,000 qualifies (以下 = inclusive); ¥1,000,001 fails.

Not modelled: the surrounding definition this Item contributes to, other items,
other paragraphs, computation of 解約返戻金相当額, and other articles.
-/

namespace JapanTaxLaw.InheritanceRegSurrenderValueCondition

open JapanTaxLaw.TaxFinance

/-- Independent spec: strict-successor form of the inclusive upper bound. -/
def specInScope (surrenderValue : Money) : Prop :=
  surrenderValue < Nat.succ thresholdYen

/-- Correspondence for all surrender values. Universal, kernel-checked. -/
theorem agree_scope (surrenderValue : Money) :
    inScope surrenderValue ↔ specInScope surrenderValue := by
  unfold inScope specInScope
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- 百万円 (1,000,000) itself qualifies (以下 is inclusive). -/
theorem at_limit : inScope 1_000_000 := by
  unfold inScope thresholdYen
  decide

/-- 1,000,001 does NOT qualify. -/
theorem above_limit : ¬ inScope 1_000_001 := by
  unfold inScope thresholdYen
  decide

/-- Threshold decoded correctly: 百万円 = 1,000,000. -/
theorem threshold_decoded : thresholdYen = 1_000_000 := rfl

end JapanTaxLaw.InheritanceRegSurrenderValueCondition
