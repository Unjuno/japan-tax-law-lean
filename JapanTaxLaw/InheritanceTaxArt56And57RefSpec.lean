import JapanTaxLaw.InheritanceTaxArt56And57Ref

/-!
# InheritanceTaxArt56And57RefSpec — independent spec for 相続税法 第五十六条及び第五十七条

Law id: 325AC0000000073 (相続税法, Act), revision 325AC0000000073_20260401_506AC0000000008
Article-title cross-reference: 第五十六条及び第五十七条 (Articles 56 and 57).
Normative unit: NORM|9444b08b151252b8c7527f222f0241b42b4cac0e133134e92ce2decf09ab8612

The implementation defines `referenced n := n = firstArticle ∨ n = secondArticle`
with firstArticle=56, secondArticle=57 (derived from the needle). The independent
spec states the referenced set as a PROPOSITIONAL membership in a two-element
list and proves universal agreement with the function (axiom-free by exhaustive
cases on the finite Nat equality decisions via `decide`-free reasoning).

Not modelled: the substantive provisions of Articles 56/57, other headings,
legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt56And57Ref

/-- Independent spec: membership in the literal two-element article list. -/
def SpecReferenced (n : Nat) : Prop := n ∈ ([56, 57] : List Nat)

/-- Universal agreement between the implementation and the spec. Axiom-free. -/
theorem agree_referenced (n : Nat) : referenced n ↔ SpecReferenced n := by
  unfold referenced SpecReferenced firstArticle secondArticle
  simp

/-- Only the two listed article numbers are referenced. -/
theorem referenced_56 : referenced 56 := by
  unfold referenced firstArticle
  left; rfl
theorem referenced_57 : referenced 57 := by
  unfold referenced secondArticle
  right; rfl
theorem not_referenced_55 : ¬ referenced 55 := by
  unfold referenced firstArticle secondArticle
  decide
theorem not_referenced_58 : ¬ referenced 58 := by
  unfold referenced firstArticle secondArticle
  decide

end JapanTaxLaw.InheritanceTaxArt56And57Ref
