import JapanTaxLaw.InsurancePremiumExceptions
import JapanTaxLaw.InsurancePremiumExceptionsSpec

/-!
# InsurancePremiumExceptionsTests — 区分・除外・条文横断同一性
-/
namespace JapanTaxLaw.InsurancePremiumExceptionsTests

open JapanTaxLaw.InsurancePremiumExceptions

theorem spec_agree (c : Nat) (ex : Bool) :
    applies c ex = true ↔ JapanTaxLaw.InsurancePremiumExceptionsSpec.appliesSpec c ex := by
  cases ex <;> simp [applies, validCategory, JapanTaxLaw.InsurancePremiumExceptionsSpec.appliesSpec]

example : applies 0 false = true := by decide
example : applies 3 false = true := by decide
example : applies 4 false = false := by decide
example : applies 0 true = false := by decide

example : applies 0 false = true ∧ applies 1 false = true ∧
          applies 2 false = true ∧ applies 3 false = true := applies_four_categories
example (ex : Bool) : applies 4 ex = false := out_of_range ex
example (c : Nat) : applies c true = false := exclusion_overrides_all c
example (c : Nat) (hc : c < 4) : (c = 0 ∨ c = 1) ∨ (c = 2 ∨ c = 3) :=
  category_decomposition c hc
example (c : Nat) (ex : Bool) : Art34.applies c ex = Art314_2.applies c ex :=
  cross_article_applies c ex

end JapanTaxLaw.InsurancePremiumExceptionsTests
