import JapanTaxLaw.TaxFinance

/-!
# DisasterReliefSupplArt1DelegatedEnforcementDate — DELEGATION

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|ad36635987ca63b79c1be8d9f004dd6314ab9fd2925d6c43aa6de45e2c3169fb
  Source path: LawBody[45]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。」

Norm kind: DELEGATION (with REFERENCE and CONDITION aspects) — the Act takes
effect on a date fixed by Cabinet Order, within a period not exceeding one year
from promulgation. The computable slice models exactly the delegation-target
selection and the inclusive one-year delay cap. The statutory quote above is
byte-verbatim from the pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder, statute, other.
  delegationTarget : DelegationTarget — the selected delegating authority.
  maxDelayYears : Nat — 1 year, derived from the source numeral.
  withinCap : Nat -> Prop — delayYears <= maxDelayYears.
  The actual promulgation date, the fixed date, and legal correctness are
  caller-established / NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate

/-- Possible targets of the delegation. -/
inductive DelegationTarget : Type
  | cabinetOrder : DelegationTarget
  | statute : DelegationTarget
  | other : DelegationTarget

/-- The enforcement date is delegated to Cabinet Order. -/
def delegationTarget : DelegationTarget := DelegationTarget.cabinetOrder

/-- Inclusive cap on the delay from promulgation, in years. -/
def maxDelayYears : Nat := 1

/-- The delay is within the source cap. -/
def withinCap (delayYears : Nat) : Prop :=
  delayYears <= maxDelayYears

/-- The selected target is Cabinet Order. -/
theorem target_is_cabinet_order : delegationTarget = DelegationTarget.cabinetOrder := rfl

/-- Statute is not the selected target. -/
theorem statute_not_selected : delegationTarget ≠ DelegationTarget.statute := by
  unfold delegationTarget
  intro h
  cases h

/-- The cap equals the source period. -/
theorem cap_is_source_value : maxDelayYears = 1 := rfl

/-- A delay exactly at the cap is allowed. -/
theorem cap_boundary_allowed : withinCap 1 := Nat.le_refl 1

/-- A zero delay is allowed. -/
theorem zero_delay_allowed : withinCap 0 := Nat.zero_le maxDelayYears

/-- A delay beyond the cap is rejected. -/
theorem above_cap_rejected (n : Nat) (h : 1 < n) : ¬ withinCap n := by
  unfold withinCap maxDelayYears
  exact Nat.not_le_of_gt h

end JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate
