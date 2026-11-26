import JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming

/-!
# InheritanceTaxArt15ActualChildDeemingSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY.
Art.15(3) DEEMING 「前項の規定の適用については、次に掲げる者は実子とみなす。」.
Normative unit: NORM|3a29e9541c61aee3230a076944570965f9b95a0617d2d8dd3a8975ee05f475df

The implementation uses a transformation and a resulting equality; the spec
states the rule as an implication from being a listed person to the actual-child
classification, representationally distinct. Equivalence is proved by cases in
the kernel. Axiom-free; no decide/simp/propext.

Not modelled: identity of enumerated persons, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming

/-- Independent spec: a listed person is treated as an actual child. -/
def SpecDeeming (p q : PersonClass) : Prop :=
  p = PersonClass.listedPerson -> q = PersonClass.actualChild

/-- The transformation satisfies the spec. -/
theorem deeming_spec_agreement (p : PersonClass) :
    SpecDeeming p (deemAsActualChild p) := by
  cases p with
  | listedPerson =>
      intro h
      rfl
  | actualChild =>
      intro h
      cases h
  | other =>
      intro h
      cases h

/-- The classification agrees with the spec for a listed person. -/
theorem listed_spec_agreement :
    SpecDeeming PersonClass.listedPerson (deemAsActualChild PersonClass.listedPerson) :=
  deeming_spec_agreement PersonClass.listedPerson

end JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming
