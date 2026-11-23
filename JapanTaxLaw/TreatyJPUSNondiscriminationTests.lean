import JapanTaxLaw.TreatyJPUSNondiscrimination
import JapanTaxLaw.TreatyJPUSNondiscriminationSpec

/-!
# TreatyJPUSNondiscriminationTests — 第二十四条（無差別待遇）
-/
namespace JapanTaxLaw.TreatyJPUSNondiscriminationTests
open JapanTaxLaw.TreatyJPUSNondiscrimination

theorem burden_spec (f d : Nat) : notMoreBurdensome f d = JapanTaxLaw.TreatyJPUSNondiscriminationSpec.notMoreBurdensomeSpec f d := by
  unfold notMoreBurdensome JapanTaxLaw.TreatyJPUSNondiscriminationSpec.notMoreBurdensomeSpec
  by_cases h : f <= d <;> simp [h]
theorem covered_spec (n p : Bool) : coveredByNondiscrimination n p = JapanTaxLaw.TreatyJPUSNondiscriminationSpec.coveredByNondiscriminationSpec n p := by rfl
example (b : Nat) : notMoreBurdensome b b = true := equal_burden_ok b
example (f d : Nat) (h : d < f) : notMoreBurdensome f d = false := heavier_burden_rejected f d h
example (f d : Nat) (h : notMoreBurdensome f d = true) : f <= d := nondiscrimination_implies_cap f d h
example : coveredByNondiscrimination true false = true := national_covered
example : coveredByNondiscrimination false true = true := pe_covered
example : nondiscriminationDeclared = true := nondiscrimination_is_declaration

end JapanTaxLaw.TreatyJPUSNondiscriminationTests
