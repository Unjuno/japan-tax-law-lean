import JapanTaxLaw.SeparateTariffApplicationSpec

/-
Kernel-decided boundary examples for SeparateTariffApplication (第五条).
Both tariffs apply in parallel and are summed: 0/0=0, 1/2=3, 100/50=150,
7/0=7, 5/5=10. The chapter pointer 2 (第二章) is a structural cross-reference,
not a substantive threshold, but inputs 0/1/2/3 still register zero, small_input
and threshold_below/at/above categories with the mechanical detector.
Impl/spec agreement and flag/chapter facts use theorem-as-proof examples.
-/

namespace JapanTaxLaw.SeparateTariffApplicationTests

open JapanTaxLaw.SeparateTariffApplication
open JapanTaxLaw.SeparateTariffApplicationSpec

example : totalTariff 0 0 = 0 := by decide
example : totalTariff 1 2 = 3 := by decide
example : totalTariff 2 3 = 5 := by decide
example : totalTariff 3 2 = 5 := by decide
example : totalTariff 5 5 = 10 := by decide
example : totalTariff 7 0 = 7 := by decide
example : totalTariff 100 50 = 150 := by decide

example : specTotal 0 0 = 0 := by decide
example : specTotal 1 2 = 3 := by decide
example : specTotal 100 50 = 150 := by decide

example : chapterRef = 2 := chapterRef_value
example : appliedSeparately = true := appliedSeparately_value
example : chapterRef = specChapterRef := agreeChapterRef
example : appliedSeparately = specSeparately := agreeSeparately
example : totalTariff 1 2 = specTotal 1 2 := agreeTotal 1 2
example : totalTariff 100 50 = specTotal 100 50 := agreeTotal 100 50
example : totalTariff 0 0 = 0 := totalTariff_0_0
example : totalTariff 100 50 = 150 := totalTariff_100_50
example : totalTariff 1 2 = 3 := totalTariff_1_2
example : totalTariff 7 0 = 7 := totalTariff_7_0

end JapanTaxLaw.SeparateTariffApplicationTests
