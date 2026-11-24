import JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication

/-!
# InheritanceTaxArt19_4QuasiApplicationSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 19-4(3) READING
「前条第二項及び第三項の規定は、第一項の規定を適用する場合について準用する。」. Normative unit: NORM|e29e4e105e5b1ef84a82b9e35f096ec01045e79c65186e86f1a2fe08fedcd722

The implementation uses a Bool function; the spec states the quasi-applied set
as a Prop disjunction, representationally distinct. Axiom-free by rfl/left/right.

Not modelled: quasi-applied provision content, reading substitution, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication

/-- Independent spec: the quasi-applied source paragraphs as a Prop. -/
def SpecQuasiApplied (p : Paragraph) : Prop :=
  p = Paragraph.para2 ∨ p = Paragraph.para3

/-- 前条第二項 satisfies the spec. -/
theorem spec_para2 : SpecQuasiApplied Paragraph.para2 := by left; rfl

/-- 前条第三項 satisfies the spec. -/
theorem spec_para3 : SpecQuasiApplied Paragraph.para3 := by right; rfl

/-- Agreement at 前条第二項. -/
theorem agree_para2 : (quasiAppliedFromPreceding Paragraph.para2 = true) ↔ SpecQuasiApplied Paragraph.para2 := by
  constructor
  · intro _h
    exact spec_para2
  · intro _h
    rfl

/-- Agreement at the trigger (no quasi-application). -/
theorem agree_para1 : (quasiAppliedFromPreceding Paragraph.para1 = false) ↔ ¬ SpecQuasiApplied Paragraph.para1 := by
  constructor
  · intro _h hspec
    rcases hspec with h | h <;> cases h
  · intro _h
    rfl

end JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication
