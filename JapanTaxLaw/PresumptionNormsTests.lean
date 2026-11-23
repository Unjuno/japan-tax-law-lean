import JapanTaxLaw.PresumptionNorms
import JapanTaxLaw.PresumptionNormsSpec

/-!
# PresumptionNormsTests — 推定規定
-/
namespace JapanTaxLaw.PresumptionNormsTests
open JapanTaxLaw.PresumptionNorms

theorem presumed_spec (b p : Prop) : presumed b p ↔ JapanTaxLaw.PresumptionNormsSpec.presumedSpec b p := by rfl
example {b p : Prop} (h : presumed b p) (hb : b) : p := presume_apply h hb
example (p : Prop) : presumed False p := presume_no_base p
example (p : Prop) : presumed p p := presume_self p
example {b p q : Prop} (h1 : presumed b p) (h2 : presumed p q) : presumed b q := presume_trans h1 h2
example : presumptionDeclared = true := presumption_is_declaration

end JapanTaxLaw.PresumptionNormsTests
