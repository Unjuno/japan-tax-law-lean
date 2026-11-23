import JapanTaxLaw.ProvisoRemainderNorms
import JapanTaxLaw.ProvisoRemainderNormsSpec

/-!
# ProvisoRemainderNormsTests — ただし書演算子
-/
namespace JapanTaxLaw.ProvisoRemainderNormsTests

open JapanTaxLaw.ProvisoRemainderNorms

theorem proviso_spec (c : Bool) (b e : Nat) :
    applyProviso c b e = JapanTaxLaw.ProvisoRemainderNormsSpec.provisoSpec c b e := by rfl
example (b e : Nat) : applyProviso true b e = e := proviso_true b e
example (b e : Nat) : applyProviso false b e = b := proviso_false b e
example (c : Bool) (b : Nat) : applyProviso c b b = b := proviso_same c b
example (c : Bool) (b e : Nat) : applyProviso c b e = (if c then e else b) := proviso_refl c b e
example : provisoDeclared = true := proviso_is_declaration

end JapanTaxLaw.ProvisoRemainderNormsTests
