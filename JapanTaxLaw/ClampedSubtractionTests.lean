import JapanTaxLaw.ClampedSubtraction
import JapanTaxLaw.ClampedSubtractionSpec

/-
# ClampedSubtraction tests — 登録免許税法施行規則 第十二条 の kernel-decided 検証

Pinned: law 342M50000040037 / revision 342M50000040037_20260401_508M60000040008.
All checks are closed Nat/Bool expressions discharged by `by decide`.
Coverage: zero inputs, small positives, exact equality (10-10=0),
underflow (5-10=0, 0-1=0), normal (10-3=7), saturation with large numbers,
isZero flags, and impl/spec agreement at several points.
This is a finite smoke suite, not a claim of universal correctness by example;
universality is established by `agreeClampedSubtract` in the spec module.
-/

namespace JapanTaxLaw.ClampedSubtraction

-- zero inputs
example : clampedSubtract 0 0 = 0 := by decide
example : clampedSubtract 0 1 = 0 := by decide
example : clampedSubtract 0 1_000_000 = 0 := by decide

-- small positive inputs
example : clampedSubtract 3 1 = 2 := by decide
example : clampedSubtract 10 3 = 7 := by decide

-- exact equality -> zero
example : clampedSubtract 10 10 = 0 := by decide

-- underflow (零を下回る) -> zero
example : clampedSubtract 5 10 = 0 := by decide
example : clampedSubtract 1 2 = 0 := by decide

-- normal case and identity (ロ = 0)
example : clampedSubtract 10 0 = 10 := by decide

-- saturation with large numbers
example : clampedSubtract 1_000_000 2_000_000 = 0 := by decide
example : clampedSubtract 2_000_000 1_000_000 = 1_000_000 := by decide

-- isZero (Bool)
example : isZero 5 10 = true := by decide
example : isZero 10 3 = false := by decide
example : isZero 0 0 = true := by decide

-- impl / independent-spec agreement at several points
example : clampedSubtract 0 1 = specClampedSubtract 0 1 := by decide
example : clampedSubtract 5 10 = specClampedSubtract 5 10 := by decide
example : clampedSubtract 10 3 = specClampedSubtract 10 3 := by decide
example : clampedSubtract 10 10 = specClampedSubtract 10 10 := by decide
example : clampedSubtract 1_000_000 2_000_000 = specClampedSubtract 1_000_000 2_000_000 := by decide

end JapanTaxLaw.ClampedSubtraction
