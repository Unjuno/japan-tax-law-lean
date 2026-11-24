import JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds

/-!
# InheritanceTaxArt13SecurityRightKindsSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 13(2) item 2 EFFECT
「その財産を目的とする留置権、特別の先取特権、質権又は抵当権で担保される債務」。 Normative unit: NORM|4db9b05db4964c68d07dea49463fe1dd72302abd50067a924db0ecd6d0e054fb

The implementation uses a Bool function; the spec states the enumerated set as
a Prop disjunction, representationally distinct. Axiom-free by rfl/left/right.

Not modelled: substantive legal effect, rest of Article 13, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds

/-- Independent spec: membership in the enumerated right set. -/
def SpecListedRight (r : SecurityRight) : Prop :=
  r = SecurityRight.retention ∨ r = SecurityRight.specialPriority ∨
  r = SecurityRight.pledge ∨ r = SecurityRight.mortgage

/-- 留置権 satisfies the spec. -/
theorem spec_retention : SpecListedRight SecurityRight.retention := by left; rfl

/-- 抵当権 satisfies the spec. -/
theorem spec_mortgage : SpecListedRight SecurityRight.mortgage := by
  right; right; right; rfl

/-- Agreement at 留置権. -/
theorem agree_retention :
    (isListedRight SecurityRight.retention = true) ↔ SpecListedRight SecurityRight.retention := by
  constructor
  · intro _h
    exact spec_retention
  · intro _h
    rfl

/-- Agreement at the 'other' right (not listed). -/
theorem agree_other :
    (isListedRight SecurityRight.other = false) ↔ ¬ SpecListedRight SecurityRight.other := by
  constructor
  · intro _h hs
    rcases hs with hs | hs | hs | hs <;> cases hs
  · intro _h
    rfl

end JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds
