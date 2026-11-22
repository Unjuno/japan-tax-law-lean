import JapanTaxLaw.LimitationAndInterestNorms
import JapanTaxLaw.LimitationAndInterestNormsSpec

/-!
# LimitationAndInterestNormsTests — 時効・利子
-/
namespace JapanTaxLaw.LimitationAndInterestNormsTests

open JapanTaxLaw.LimitationAndInterestNorms

theorem limitation_spec (e l : Nat) :
    withinLimitation e l = true ↔ JapanTaxLaw.LimitationAndInterestNormsSpec.limitationSpec e l := by
  simp [withinLimitation, JapanTaxLaw.LimitationAndInterestNormsSpec.limitationSpec]

example (l : Nat) : withinLimitation l l = true := within_at_limit l
example (e l : Nat) (h : l < e) : withinLimitation e l = false := expired e l h
example (b : Nat) : extendedLimit b 0 = b := extended_zero b
example : classifyInterest 0 = .interest := interest_kind_0
example : classifyInterest 1 = .deemedInterest := interest_kind_other
example (r : Nat) : interestSplitTax 0 r = 0 := split_zero r
example : limitationDeclared = true := limitation_is_declaration

end JapanTaxLaw.LimitationAndInterestNormsTests
