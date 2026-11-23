import JapanTaxLaw.LocalTaxCollectionStay
import JapanTaxLaw.LocalTaxCollectionStaySpec

/-!
# LocalTaxCollectionStayTests — 地方税法 第十五条の七（実質的証明）
-/
namespace JapanTaxLaw.LocalTaxCollectionStayTests
open JapanTaxLaw.LocalTaxCollectionStay

theorem hardship_spec (h : Bool) : hardshipStayGround h = JapanTaxLaw.LocalTaxCollectionStaySpec.hardshipStayGroundSpec h := by rfl
theorem three_spec (y : Nat) : threeYearsContinued y = JapanTaxLaw.LocalTaxCollectionStaySpec.threeYearsContinuedSpec y := by
  unfold threeYearsContinued JapanTaxLaw.LocalTaxCollectionStaySpec.threeYearsContinuedSpec
  by_cases h : 3 <= y <;> simp [h]
theorem extinct_spec (y : Nat) : obligationExtinguished y = JapanTaxLaw.LocalTaxCollectionStaySpec.obligationExtinguishedSpec y := by
  unfold obligationExtinguished threeYearsContinued JapanTaxLaw.LocalTaxCollectionStaySpec.obligationExtinguishedSpec
  by_cases h : 3 <= y <;> simp [h]
example : hardshipStayGround true = true := hardship_enables_stay
example : hardshipStayGround false = false := no_hardship_no_ground
example : threeYearsContinued 3 = true := at_3_years_extinguishes
example : threeYearsContinued 2 = false := before_3_years_no_extinction
example : obligationExtinguished 3 = true := extinction_at_3
example : obligationExtinguished 2 = false := no_extinction_before_3
example : localTaxCollectionStayDeclared = true := local_tax_collection_stay_is_declaration

end JapanTaxLaw.LocalTaxCollectionStayTests
