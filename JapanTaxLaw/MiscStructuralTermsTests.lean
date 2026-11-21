import JapanTaxLaw.MiscStructuralTerms
import JapanTaxLaw.MiscStructuralTermsSpec

/-!
# MiscStructuralTermsTests — 参照・時間・面積割合
-/
namespace JapanTaxLaw.MiscStructuralTermsTests

open JapanTaxLaw.MiscStructuralTerms

theorem ref_spec (t : Nat) :
    resolveTerm t = JapanTaxLaw.MiscStructuralTermsSpec.refSpec t := by rfl

theorem temporal_spec (d e : Nat) :
    appliesOnOrAfter d e = true ↔ JapanTaxLaw.MiscStructuralTermsSpec.temporalSpec d e := by
  simp [appliesOnOrAfter, JapanTaxLaw.MiscStructuralTermsSpec.temporalSpec]

theorem ratio_spec (p w : Nat) :
    areaRatio p w = JapanTaxLaw.MiscStructuralTermsSpec.ratioSpec p w := by rfl

example (t : Nat) : resolveTerm t = t := resolve_term_identity t
example (e : Nat) : appliesOnOrAfter e e = true := applies_at_enforcement e
example (d e : Nat) (h : e <= d) : appliesOnOrAfter d e = true := applies_after d e h
example (d e : Nat) (h : d < e) : appliesOnOrAfter d e = false := applies_before d e h
example : areaRatio 0 0 = none := area_zero_whole
example : areaRatio 5 5 = some 100 := area_full
example : structuralTermDeclared = true := term_is_declaration

end JapanTaxLaw.MiscStructuralTermsTests
