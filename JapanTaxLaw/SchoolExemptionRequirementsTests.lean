import JapanTaxLaw.SchoolExemptionRequirements

/-!
# SchoolExemptionRequirements tests — 学校等要件 smoke checks
Decidable smoke tests, pinned to law 403M50000040031 / revision 403M50000040031_20260401_508M60000040010.
修業期間12ヶ月以上 かつ 授業時間680時間以上。
-/

namespace JapanTaxLaw.SchoolExemptionRequirements

example : meetsSchoolRequirements 12 680 = true := by decide
example : meetsSchoolRequirements 11 680 = false := by decide
example : meetsSchoolRequirements 12 679 = false := by decide

end JapanTaxLaw.SchoolExemptionRequirements
