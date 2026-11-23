import JapanTaxLaw.RankedAmountCountTen
import JapanTaxLaw.RankedAmountCountTenSpec

/-
# RankedAmountCountTenTests — kernel-decided checks for 高額適用額 第六条

Pinned source: law 422M60000040022, revision 422M60000040022_20260731_508M60000040041,
  data/raw/422M60000040022_20260731_508M60000040041.law.json,
  sha256 950d67e96e5219efae8f4540695ec98dc7caf97c460fa0812ffe118d90cb4472.
Every closed check below is a Nat/Bool expression discharged by `by decide`
(or `by rfl` for the literal equality). Coverage: counts 0/9/10/11/20,
impl theorem-as-proof checks, spec spot checks, impl/spec agreement at
concrete points and the universal agreement bridges.
-/

namespace JapanTaxLaw.RankedAmountCountTen

-- (a) cutoff value 十 = 10.
example : rankCutoff = 10 := by decide
example : rankCutoff = 10 := by rfl

-- (b) zero count is below the cutoff -> not reached.
example : reachesCutoff 0 = false := by decide

-- (c) boundary of 十 = 10: below (9) / at (10) / above (11) / large above (20).
example : reachesCutoff 9 = false := by decide
example : reachesCutoff 10 = true := by decide
example : reachesCutoff 11 = true := by decide
example : reachesCutoff 20 = true := by decide

-- (d) implementation theorems used as proof (theorem-as-proof form).
example : rankCutoff = 10 := rankCutoff_is_10
example : reachesCutoff 0 = false := reachesCutoff0
example : reachesCutoff 9 = false := reachesCutoff9
example : reachesCutoff 10 = true := reachesCutoff10
example : reachesCutoff 11 = true := reachesCutoff11
example : reachesCutoff 20 = true := reachesCutoff20

-- (e) independent spec spot checks (kernel-decided).
example : specCutoff = 10 := by decide
example : specReaches 0 = false := by decide
example : specReaches 9 = false := by decide
example : specReaches 10 = true := by decide
example : specReaches 11 = true := by decide
example : specReaches 20 = true := by decide

-- (f) impl/spec agreement at concrete points (kernel-decided).
example : rankCutoff = specCutoff := by decide
example : reachesCutoff 0 = specReaches 0 := by decide
example : reachesCutoff 9 = specReaches 9 := by decide
example : reachesCutoff 10 = specReaches 10 := by decide
example : reachesCutoff 11 = specReaches 11 := by decide
example : reachesCutoff 20 = specReaches 20 := by decide

-- (g) universal kernel-checked bridges (theorem used as proof).
example : rankCutoff = specCutoff := agreeCutoff
example (n : Nat) : reachesCutoff n = specReaches n := agreeReaches n

end JapanTaxLaw.RankedAmountCountTen
