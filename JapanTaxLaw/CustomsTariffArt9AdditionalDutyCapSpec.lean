import JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap

/-!
# CustomsTariffArt9AdditionalDutyCapSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.9(4) item1 CONDITION 「当該貨物につき、別表の税率による関税のほか、当該輸入される貨物の課税価格と同額以下の関税を課すること。」.
Normative unit: NORM|7cfb458918c95cb9c89dfc9e3f230612412a98de1f8426918de7269131260be4

The implementation states the cap as a direct <= inequality; the spec states it
as the absence of a strict reverse inequality, a representationally distinct
formulation over the same Nat domain. Equivalence is proved in the kernel, not
assumed. The additive relation is independently specified as two boundary
component inequalities (not the full arithmetic equality). All proofs use
Nat-specific core lemmas and are axiom-free; no decide/simp/propext/omega.

Not modelled: rate table, valuation rules, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap

/-- Independent spec of the cap: the taxable value is not less than the duty. -/
def SpecWithinCap (additionalDuty taxableValue : Nat) : Prop :=
  ¬ taxableValue < additionalDuty

/-- Independent spec of the additive relation: each component is bounded by
    the total. This is a boundary consequence of `in addition to`, not the
    full arithmetic equality, which is deliberately not claimed here. -/
def SpecTotal (tableDuty additionalDuty total : Nat) : Prop :=
  tableDuty <= total /\ additionalDuty <= total

/-- The implementation cap and the independent spec agree. -/
theorem cap_spec_agreement (d v : Nat) : withinCap d v ↔ SpecWithinCap d v := by
  constructor
  · intro h
    exact Nat.not_lt_of_ge h
  · intro h
    exact Nat.le_of_not_gt h

/-- The implementation total satisfies the independent additive spec. -/
theorem total_spec_agreement (t a : Nat) : SpecTotal t a (totalDuty t a) := by
  unfold SpecTotal totalDuty
  constructor
  · exact Nat.le_add_right t a
  · exact Nat.le_add_left a t

end JapanTaxLaw.CustomsTariffArt9AdditionalDutyCap
