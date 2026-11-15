import JapanTaxLaw.StampDutySpecial91

/-!
# StampDutySpecial91 tests — 租税特別措置法 art. 91 smoke checks

Decidable smoke tests for the special stamp-duty rate tables, pinned to
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each example covers an art. 91(1)/(2) band boundary, an out-of-scope input
(below the 柱書 threshold), or a cross-law domination constraint.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 柱書の下限外: 特例は適用されない（手数料扱いは呼出元。art. 91(1): 十万円超が必要）
example : special91Item1 100_000 = 0 := by decide
-- art. 91(1): 十万円超〜五十万円以下は 200 円
example : special91Item1 100_001 = 200 := by decide
example : special91Item1 500_000 = 200 := by decide
-- art. 91(1): 千万円超〜五千万円以下は 一万円
example : special91Item1 10_000_001 = 10_000 := by decide
example : special91Item1 50_000_000 = 10_000 := by decide
-- art. 91(1): 五十億円を超えるものは 四十八万円
example : special91Item1 5_000_000_001 = 480_000 := by decide

-- art. 91(2): 百万円以下は特例適用外
example : special91Item2 1_000_000 = 0 := by decide
example : special91Item2 1_000_001 = 200 := by decide
example : special91Item2 2_000_000 = 200 := by decide
example : special91Item2 2_000_001 = 500 := by decide

-- art. 91(1)/(2) は ¥5,000,000 超で同一帯
example : special91Item1 6_000_000 = special91Item2 6_000_000 := by decide

-- 適格ゲート（externally established booleans）
example : special91Item1Eligible ⟨true, true, 250_000, true⟩ = true := by decide
example : special91Item1Eligible ⟨true, true, 100_000, true⟩ = false := by decide
example : special91Item1Eligible ⟨true, true, 100_001, false⟩ = false := by decide
example : special91Item2Eligible ⟨true, true, 1_500_000, true⟩ = true := by decide

-- 非適格なら Option で none（呼出元が一般表へ）
example : (special91Item1? ⟨false, true, 250_000, true⟩).isNone := by decide
example : (special91Item1? ⟨true, true, 250_000, true⟩).isSome := by decide
example : (special91Item1? ⟨true, true, 100_000, true⟩).isNone := by decide
example : (special91Item2? ⟨true, true, 1_500_000, true⟩).isSome := by decide

-- 一般表との支配関係（サンプル）：特別 <= 一般（暗転する帯域は存在しないことを含む）
example : special91Item1 250_000 ≤ contractStampDuty 250_000 := by decide
example : special91Item1 750_000 ≤ contractStampDuty 750_000 := by decide
example : special91Item1 2_000_000 ≤ contractStampDuty 2_000_000 := by decide
example : special91Item1 8_000_000 ≤ contractStampDuty 8_000_000 := by decide
example : special91Item1 45_000_000 ≤ contractStampDuty 45_000_000 := by decide
example : special91Item1 90_000_000 ≤ contractStampDuty 90_000_000 := by decide
example : special91Item1 450_000_000 ≤ contractStampDuty 450_000_000 := by decide
example : special91Item1 900_000_000 ≤ contractStampDuty 900_000_000 := by decide
example : special91Item1 4_500_000_000 ≤ contractStampDuty 4_500_000_000 := by decide
example : special91Item1 9_000_000_000 ≤ contractStampDuty 9_000_000_000 := by decide

end JapanTaxLaw
