import JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths
import JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonthsSpec

/-
# OpinionApplicantDocumentWindowThreeMonthsTests — 関税法意見申請手続規則 2(3)(1) の kernel-decided 検証

Pinned: law 418M60000400006 / revision 418M60000400006_20201228_502M60000400092.
Coverage: zero/small inputs, 3-month inclusive boundary (L-1/L/L+1),
future documents, corporation shortcut, shifted months and impl/spec agreement.
-/

namespace JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths

example : windowMonths = 3 := by decide

-- 零入力・小さい入力（個人）
example : timelyIndividualDoc true 0 0 = true := by decide
example : timelyIndividualDoc true 0 1 = true := by decide
example : timelyIndividualDoc true 0 2 = true := by decide

-- 境界: 三月 (L-1 / L / L+1)
example : timelyIndividualDoc true 0 2 = true := by decide
example : timelyIndividualDoc true 0 3 = true := by decide
example : timelyIndividualDoc true 0 4 = false := by decide

-- 未来の書類
example : timelyIndividualDoc true 5 4 = false := by decide

-- 法人側はこの号の対象外
example : timelyIndividualDoc false 0 100 = true := by decide

-- シフトした申請月
example : timelyIndividualDoc true 5 8 = true := by decide
example : timelyIndividualDoc true 5 9 = false := by decide

-- impl / 独立仕様の一致
example : windowMonths = specWindow := by decide
example : timelyIndividualDoc true 0 0 = specTimely true 0 0 := by decide
example : timelyIndividualDoc true 0 2 = specTimely true 0 2 := by decide
example : timelyIndividualDoc true 0 3 = specTimely true 0 3 := by decide
example : timelyIndividualDoc true 0 4 = specTimely true 0 4 := by decide
example : timelyIndividualDoc true 5 4 = specTimely true 5 4 := by decide
example : timelyIndividualDoc false 0 100 = specTimely false 0 100 := by decide
example : timelyIndividualDoc true 5 9 = specTimely true 5 9 := by decide

end JapanTaxLaw.OpinionApplicantDocumentWindowThreeMonths
