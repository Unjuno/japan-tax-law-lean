import JapanTaxLaw.RateValueNorms
import JapanTaxLaw.RateValueNormsSpec

/-!
# RateValueNormsTests — 率
-/
namespace JapanTaxLaw.RateValueNormsTests

open JapanTaxLaw.RateValueNorms

theorem percent_spec (b n : Nat) :
    percentRate b n = JapanTaxLaw.RateValueNormsSpec.percentSpec b n := by rfl
theorem permille_spec (b n : Nat) :
    permilleRate b n = JapanTaxLaw.RateValueNormsSpec.permilleSpec b n := by rfl
theorem per_amount_spec (u a : Nat) :
    perAmountRate u a = JapanTaxLaw.RateValueNormsSpec.perAmountSpec u a := by rfl

example (n : Nat) : percentRate 100 n = n := percent_of_100 n
example (n : Nat) : percentRate 0 n = 0 := percent_zero_base n
example (b : Nat) : percentRate b 0 = 0 := percent_zero_num b
example (n : Nat) : permilleRate 1000 n = n := permille_of_1000 n
example (n : Nat) : permilleRate 0 n = 0 := permille_zero_base n
example (a : Nat) : perAmountRate 0 a = 0 := per_amount_zero a
example (a : Nat) : perAmountRate 1 a = a := per_amount_one a
example : rateDeclared = true := rate_is_declaration

end JapanTaxLaw.RateValueNormsTests
