import JapanTaxLaw.DocumentationPresumptions
import JapanTaxLaw.DocumentationPresumptionsSpec

/-!
# DocumentationPresumptionsTests — 分岐・仕様一致・四群同一性
-/
namespace JapanTaxLaw.DocumentationPresumptionsTests

open JapanTaxLaw.DocumentationPresumptions

theorem spec_agree (p s : Bool) :
    presumedStatus p s = JapanTaxLaw.DocumentationPresumptionsSpec.presumptionSpec p s := by
  cases p <;> rfl

example : presumedStatus false true = false := by decide
example : presumedStatus true true = true := by decide
example : presumedStatus true false = false := by decide
example : G40_7.presumedStatus false true = false := by decide
example : G66_6.presumedStatus true true = true := by decide
example : G66_9_2.presumedStatus false true = false := by decide

example (s : Bool) : presumedStatus false s = false := absent_implies_not_applicable s
example (s : Bool) : presumedStatus true s = s := present_uses_status s
example (p : Bool) : p = true ∨ p = false := branch_exhaustive p
example (a b p : Bool) (h : a = true → b = true)
    (ha : presumedStatus p a = true) : presumedStatus p b = true :=
  monotone_in_status a b p h ha
example (p s : Bool) : G40_4.presumedStatus p s = G66_9_2.presumedStatus p s :=
  cross_group_40_4_66_9_2 p s
example (p s : Bool) :
    G40_4.presumedStatus p s = G40_7.presumedStatus p s ∧
    G40_4.presumedStatus p s = G66_6.presumedStatus p s ∧
    G40_4.presumedStatus p s = G66_9_2.presumedStatus p s := all_four_groups_agree p s

end JapanTaxLaw.DocumentationPresumptionsTests
