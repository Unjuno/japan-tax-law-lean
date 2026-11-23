import JapanTaxLaw.ForeignAssetPenaltyCap
import JapanTaxLaw.ForeignAssetPenaltyCapSpec

/-
# ForeignAssetPenaltyCapTests — kernel-decided boundary checks for 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律 第十条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 一年 (= 1) and 五十万円 (= 50) threshold neighbourhoods (below/at/above on
BOTH axes), the DUAL conjunction, named impl theorems, and impl/spec agreement.

Pinned source: law 409AC0000000110, revision 409AC0000000110_20260812_508AC0000000064,
sha256 b4440b62d96b6d2f0962a72c815ce075705da13530f625f1204d534313fc24ab,
Article Num 10, needle「正当な理由がなくて国外財産調書をその提出期限までに税務署長に提出しなかったときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」.
-/

namespace JapanTaxLaw.ForeignAssetPenaltyCap

-- (a) zero / small inputs on the imprisonment axis (一年 = 1, inclusive).
example : withinImprisonmentCap 0 = true := by decide
example : withinImprisonmentCap 1 = true := by decide
example : withinImprisonmentCap 2 = false := by decide

-- (b) the 五十万円 = 50 万円 threshold neighbourhood on the fine axis (inclusive).
example : withinFineCap 49 = true := by decide
example : withinFineCap 50 = true := by decide
example : withinFineCap 51 = false := by decide

-- (c) the DUAL cap: both axes must be within their caps simultaneously.
example : penaltyWithinCaps 1 50 = true := by decide
example : penaltyWithinCaps 0 0 = true := by decide
example : penaltyWithinCaps 2 50 = false := by decide
example : penaltyWithinCaps 1 51 = false := by decide
example : penaltyWithinCaps 2 51 = false := by decide

-- (d) named impl theorems (theorem-as-proof: example : PROPOSITION := theorem-name).
example : imprisonmentCapYears = 1 := cap_years_eq_one
example : fineCapManYen = 50 := cap_fine_eq_fifty
example : withinImprisonmentCap 0 = true := imp_zero_true
example : withinImprisonmentCap 1 = true := imp_one_true
example : withinImprisonmentCap 2 = false := imp_two_false
example : withinFineCap 49 = true := fine_fortynine_true
example : withinFineCap 50 = true := fine_fifty_true
example : withinFineCap 51 = false := fine_fiftyone_false
example : penaltyWithinCaps 1 50 = true := penalty_at_both_caps
example : penaltyWithinCaps 2 50 = false := penalty_years_over
example : penaltyWithinCaps 1 51 = false := penalty_fine_over

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinImprisonmentCap 0 = specImp 0 := by decide
example : withinImprisonmentCap 1 = specImp 1 := by decide
example : withinImprisonmentCap 2 = specImp 2 := by decide
example : withinFineCap 49 = specFine 49 := by decide
example : withinFineCap 50 = specFine 50 := by decide
example : withinFineCap 51 = specFine 51 := by decide
example : penaltyWithinCaps 1 50 = specPenalty 1 50 := by decide
example : penaltyWithinCaps 2 50 = specPenalty 2 50 := by decide
example : penaltyWithinCaps 1 51 = specPenalty 1 51 := by decide

-- (f) universal impl/spec agreement bridges (theorem-as-proof).
example (years : Nat) : withinImprisonmentCap years = specImp years := agreeImp years
example (manYen : Nat) : withinFineCap manYen = specFine manYen := agreeFine manYen
example (years : Nat) (manYen : Nat) : penaltyWithinCaps years manYen = specPenalty years manYen := agreePenalty years manYen
example : imprisonmentCapYears = specImpCap := agreeImpCap
example : fineCapManYen = specFineCap := agreeFineCap

end JapanTaxLaw.ForeignAssetPenaltyCap
