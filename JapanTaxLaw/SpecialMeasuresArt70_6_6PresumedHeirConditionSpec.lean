import JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition

/-!
# SpecialMeasuresArt70_6_6PresumedHeirConditionSpec — independent spec

Law id: 332AC0000000026 (租税特別措置法), revision from INVENTORY.
Art.70の6の6(2) PRESUMPTION 「当該個人が、当該相続の開始の直前において、当該被相続人の推定相続人であること。」.
Normative unit: NORM|293a349f6f7d21dda09ef6ffecee55039fbaab8d4060af0cf337703a58b76a3a

The implementation states the condition as a Bool equality; the spec states it
as a Prop negation of the complementary case, representationally distinct.
Equivalence is proved by cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: heir-status determination, legal correctness.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition

/-- Independent spec: the flag is not false. -/
def SpecQualifies (wasPresumedHeir : Bool) : Prop :=
  ¬ wasPresumedHeir = false

/-- The implementation and spec agree. -/
theorem qualifies_spec_agreement (b : Bool) : qualifies b ↔ SpecQualifies b := by
  cases b with
  | false =>
      constructor
      · intro h
        cases h
      · intro h
        exact (h rfl).elim
  | true =>
      constructor
      · intro h
        intro hf
        cases hf
      · intro h
        rfl

end JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition
