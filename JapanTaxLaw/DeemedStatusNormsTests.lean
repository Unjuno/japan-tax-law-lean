import JapanTaxLaw.DeemedStatusNorms
import JapanTaxLaw.DeemedStatusNormsSpec

/-!
# DeemedStatusNormsTests — みなし
-/
namespace JapanTaxLaw.DeemedStatusNormsTests
open JapanTaxLaw.DeemedStatusNorms

theorem deem_spec (x y : Subject) : deemedAs x y = JapanTaxLaw.DeemedStatusNormsSpec.deemedAsSpec x y := by rfl
example (x : Subject) : deemedAs x x = true := deem_refl x
example (x y : Subject) (h : deemedAs x y = true) : deemedAs y x = true := deem_symm x y h
example (x y z : Subject) (hxy : deemedAs x y = true) (hyz : deemedAs y z = true) : deemedAs x z = true := deem_trans x y z hxy hyz
example (f : Treatment) (x y : Subject) (h : deemedAs x y = true) : inheritTreatment f x y h = f y := deemed_inherits f x y h
example : deemedStatusDeclared = true := deemed_status_is_declaration

end JapanTaxLaw.DeemedStatusNormsTests
