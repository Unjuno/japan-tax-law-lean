import JapanTaxLaw.CommitteeTermTwoYears

/-
# CommitteeTermTwoYearsSpec — independent spec for 国税審議会令 art.4（二年）

Pinned source:
  Law id: 412CO0000000278
  Revision: 412CO0000000278_20260401_507CO0000000412
  Snapshot: data/raw/412CO0000000278_20260401_507CO0000000412.law.json
  Statutory article: 第四条 — 委員の任期は二年
  原文逐語: 「委員の任期は、二年とする。」
  Normative unit: NORM|5adb98f94dfcc1816db82d141229cfd8c175fbebd2c2a3ad22d59aafbc2a2032

The implementation expresses "exactly two" with a pair of non-strict bounds,
`2 <= years && years <= 2`. This module is an INDEPENDENT formulation: it
carries its own statutory constant and expresses exact equality as the
conjunction of the negated strict orders, `¬ years < 2 && ¬ 2 < years` —
different operators from the implementation. It reuses NO implementation
definition inside its own `spec*` defs; the universal `agree_committee_term`
theorem is the only bridge, and the kernel checks it for every Nat term.

Not modelled: 委員 identity, appointment/renewal rules, committee powers,
other articles and operational rules.
-/

namespace JapanTaxLaw.CommitteeTermTwoYears

/-- Spec-local statutory value: 二年 = 2 years. Independent of impl. -/
def specCommitteeTermYears : Nat := 2

/-- Independent formula: exact term via negated strict orders. -/
def specIsCommitteeTerm (years : Nat) : Bool :=
  decide (¬ years < specCommitteeTermYears && ¬ specCommitteeTermYears < years)

/-- Universal, kernel-checked correspondence for every natural term. -/
theorem agree_committee_term (years : Nat) :
    isCommitteeTerm years = specIsCommitteeTerm years := by
  unfold isCommitteeTerm committeeTermYears specIsCommitteeTerm specCommitteeTermYears
  by_cases hlo : 2 <= years
  · by_cases hhi : years <= 2
    · have h1 : ¬ years < 2 := by omega
      have h2 : ¬ 2 < years := by omega
      simp [hlo, hhi, h1, h2]
    · have h1 : ¬ years < 2 := by omega
      have h2 : 2 < years := by omega
      simp [hlo, hhi, h1, h2]
  · have h1 : years < 2 := by omega
    simp [hlo, h1]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specTermGrid : Bool :=
  let t := specCommitteeTermYears
  [0, 1, t - 1, t, t + 1].all fun years =>
    specIsCommitteeTerm years == decide (t <= years && years <= t)

example : specTermGrid = true := by decide

end JapanTaxLaw.CommitteeTermTwoYears
