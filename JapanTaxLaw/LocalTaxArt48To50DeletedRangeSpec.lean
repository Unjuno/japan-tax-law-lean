import JapanTaxLaw.LocalTaxArt48To50DeletedRange

/-!
# LocalTaxArt48To50DeletedRangeSpec — independent spec

Law id: 325AC0000000226 (地方税法), revision from INVENTORY. Article 48:50 ArticleTitle — STRUCTURE
「第四十八条から第五十条まで」. Normative unit: NORM|76351db6bc4ddafec1d36f9bb70e5fe0fa5aa6eafa4db90ea65f76e66c3050ee

The implementation is a Bool if-chain; the spec is a Prop disjunction,
representationally distinct. Axiom-free by rfl / left/right construction.

Not modelled: legal effect of the repeal, cross-law propagation, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxArt48To50DeletedRange

/-- Independent spec: the article number is one of the three in the range. -/
def SpecDeletedRange (n : Nat) : Prop := n = 48 ∨ n = 49 ∨ n = 50

/-- The lower bound satisfies the spec. -/
theorem spec_lo : SpecDeletedRange 48 := by left; rfl

/-- The middle satisfies the spec. -/
theorem spec_mid : SpecDeletedRange 49 := by right; left; rfl

/-- The upper bound satisfies the spec. -/
theorem spec_hi : SpecDeletedRange 50 := by right; right; rfl

/-- Agreement at the lower bound: Bool implementation equals the Prop spec. -/
theorem agree_lo : (inDeletedRange 48 = true) ↔ SpecDeletedRange 48 := by
  constructor
  · intro _h
    exact spec_lo
  · intro _h
    rfl

/-- Agreement at the upper bound. -/
theorem agree_hi : (inDeletedRange 50 = true) ↔ SpecDeletedRange 50 := by
  constructor
  · intro _h
    exact spec_hi
  · intro _h
    rfl

end JapanTaxLaw.LocalTaxArt48To50DeletedRange
