import JapanTaxLaw.CustomsTariffArt18PrevPara5Reading

/-!
# CustomsTariffArt18PrevPara5ReadingSpec — independent spec 関税定率法 第十八条(3)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十八条(3) — READING 「この場合においては、前条第五項の規定を準用する。」: 前条第五項 read in for この場合.
Normative unit: NORM|7c7c72010fb03b1074a0a2d4b307a2077af62f784e1a64424b59c5ee7dbf1101

The implementation is `appliesViaReading : Case -> Provision -> Prop`, true iff
the case is `thisCase` (ignoring the provision). The independent spec states the
same rule as an explicit propositional conjunction enumerating both the case
and the single source provision:

  SpecApplies c p := (c = thisCase ∧ p = prevArticlePara5)

This is representationally distinct (explicit conjunction naming the provision
vs ignoring it) yet extensionally equivalent because Provision has one
constructor. Kernel checks are axiom-free by exhaustive cases with rfl/cases —
no `decide`, no `simp`, no `propext`.

Not modelled: substantive content of 前条第五項, establishment of この場合,
other reading rules, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara5Reading

/-- Independent spec: 準用 as an explicit case-and-provision conjunction. -/
def SpecApplies (c : Case) (p : Provision) : Prop :=
  c = Case.thisCase ∧ p = Provision.prevArticlePara5

/-- Universal agreement between implementation and independent spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_applies_via_reading (c : Case) (p : Provision) :
    appliesViaReading c p ↔ SpecApplies c p := by
  cases c
  · cases p
    · constructor
      · intro _h
        exact ⟨rfl, rfl⟩
      · intro _h
        rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h.1

end JapanTaxLaw.CustomsTariffArt18PrevPara5Reading
