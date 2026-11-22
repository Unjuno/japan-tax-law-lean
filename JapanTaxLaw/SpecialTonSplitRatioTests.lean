import JapanTaxLaw.SpecialTonSplitRatio
import JapanTaxLaw.SpecialTonSplitRatioSpec

/-
# SpecialTonSplitRatioTests — 特別とん税法 第五条 の kernel-decided smoke checks

Pinned to:
  Law id: 332AC0000000038
  Revision: 332AC0000000038_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000038_20250601_504AC0000000068.law.json
  sha256: 5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669

按分 (specialShare = amount*20/36, tonShare = amount*16/36)、分割和
(20+16=36)、および impl↔spec 一致をカーネル決定例で確認する。
36 で割り切れる金額での完全性は BY-DESIGN（impl doc-comment 参照）。
端数処理・事実認定・他条文は NOT MODELLED。
-/

namespace JapanTaxLaw.SpecialTonSplitRatio

-- ==== constant values (by rfl) ====

example : splitDenominator = 36 := rfl
example : specialNum = 20 := rfl
example : tonNum = 16 := rfl

-- ==== theorems used as proofs (proposition := theorem-name) ====

example : splitComplete = true := splitComplete_true
example : specialShare 360 = 200 := specialShare360
example : tonShare 360 = 160 := tonShare360
example : specialShare 360 + tonShare 360 = 360 := sharesSum360
example : specialShare 36 = 20 := specialShare36
example : tonShare 36 = 16 := tonShare36

-- ==== kernel-decided: partition sanity ====

example : splitComplete = true := by decide

-- ==== amount 0 (zero, saturation) ====

example : specialShare 0 = 0 := by decide
example : tonShare 0 = 0 := by decide
example : specialShare 0 + tonShare 0 = 0 := by decide

-- ==== amount 36 (threshold_at, exact partition) ====

example : specialShare 36 = 20 := by decide
example : tonShare 36 = 16 := by decide
example : specialShare 36 + tonShare 36 = 36 := by decide

-- ==== amount 360 (scaled exact partition) ====

example : specialShare 360 = 200 := by decide
example : tonShare 360 = 160 := by decide
example : specialShare 360 + tonShare 360 = 360 := by decide

-- ==== amount 720 ====

example : specialShare 720 = 400 := by decide
example : tonShare 720 = 320 := by decide
example : specialShare 720 + tonShare 720 = 720 := by decide

-- ==== small positive inputs (total Nat division still defined) ====

example : specialShare 1 = 0 := by decide
example : tonShare 5 = 2 := by decide

-- ==== threshold_below (L-1 for L in {16, 20, 36}) ====

example : specialShare 15 = 8 := by decide
example : tonShare 19 = 8 := by decide
example : specialShare 35 = 19 := by decide

-- ==== threshold_at for 16 and 20 ====

example : tonShare 16 = 7 := by decide
example : specialShare 20 = 11 := by decide

-- ==== threshold_above (L+1 for L in {16, 20, 36}) ====

example : tonShare 17 = 7 := by decide
example : specialShare 21 = 11 := by decide
example : tonShare 37 = 16 := by decide

-- ==== impl/spec agreement (bridge theorems as proofs) ====

example : splitDenominator = specDenom := agreeDenom
example : specialNum = specSpecialNum := agreeSpecialNum
example : tonNum = specTonNum := agreeTonNum
example : specialShare 36 = specSpecialShare 36 := agreeSpecialShare 36
example : tonShare 360 = specTonShare 360 := agreeTonShare 360

end JapanTaxLaw.SpecialTonSplitRatio
