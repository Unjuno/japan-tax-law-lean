import JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading

/-!
# CustomsTariffArt19Art13Para7ProvisoReadingSpec — independent spec 関税定率法 第十九条(4)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十九条(4) — READING 「この場合においては、第十三条第七項但書の規定を準用する。」: 第十三条第七項但書 read in for この場合.
Normative unit: NORM|662ecdbb3874ed176834a6def2924dbe0518892f9339905e6ab3b3e442775462

The implementation is `appliesViaReading : TriggerCase -> Provision -> Prop`,
true iff the case is `thisCase` (ignoring the provision). The independent spec
states the same rule as an explicit propositional conjunction naming both the
case and the single source provision:

  SpecApplies c p := (c = thisCase ∧ p = art13Para7Proviso)

Representationally distinct (explicit conjunction vs ignoring the provision)
yet extensionally equivalent because Provision has one constructor. Kernel
checks axiom-free by exhaustive cases with rfl/cases — no decide/simp/propext.

Not modelled: substantive content of 第十三条第七項但書, establishment of この場合,
other reading rules, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading

/-- Independent spec: 準用 as an explicit case-and-provision conjunction. -/
def SpecApplies (c : TriggerCase) (p : Provision) : Prop :=
  c = TriggerCase.thisCase ∧ p = Provision.art13Para7Proviso

/-- Universal agreement between implementation and independent spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_applies_via_reading (c : TriggerCase) (p : Provision) :
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

end JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading
