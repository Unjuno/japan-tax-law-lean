import JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading

/-!
# CustomsTariffArt18PrevPara3ReliefReadingSpec — independent spec 関税定率法 第十八条(4)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十八条(4) — READING 「前条第三項の規定は、第一項の規定により関税の軽減を受けた者について準用する。」: 前条第三項 read in for a person
         who received duty relief under 第一項.
Normative unit: NORM|33d7dae28845cef88c65728396c225a449cf3732b9a9e4340988b3c8addb54a9

The implementation is `appliesViaReading : PersonClass -> Provision -> Prop`,
true iff the person is `reliefRecipient` (ignoring the provision). The
independent spec states the same rule as an explicit propositional conjunction
naming both the recipient class and the single source provision:

  SpecApplies p prov := (p = reliefRecipient ∧ prov = prevArticlePara3)

Representationally distinct (explicit conjunction vs ignoring the provision)
yet extensionally equivalent because Provision has one constructor. Kernel
checks axiom-free by exhaustive cases with rfl/cases — no decide/simp/propext.

Not modelled: substantive content of 前条第三項 and 第一項, how relief was
granted, other reading rules, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading

/-- Independent spec: 準用 as an explicit recipient-and-provision conjunction. -/
def SpecApplies (p : PersonClass) (prov : Provision) : Prop :=
  p = PersonClass.reliefRecipient ∧ prov = Provision.prevArticlePara3

/-- Universal agreement between implementation and independent spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_applies_via_reading (p : PersonClass) (prov : Provision) :
    appliesViaReading p prov ↔ SpecApplies p prov := by
  cases p
  · cases prov
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

end JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading
