import JapanTaxLaw.LocalTaxAresRoundingSpec

/-!
# LocalTaxAresRoundingTests — kernel-decided boundary checks for art.180(3)

All checks are `rfl` / `by decide`, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxAresRounding

open JapanTaxLaw.TaxFinance

example : fractionUnitAres = 100 := rfl
example : deemedFraction 0 = 0 := rfl
example : deemedFraction 1 = 100 := by decide
example : deemedFraction 50 = 100 := by decide
example : deemedFraction 99 = 100 := by decide
example : agreeLocalTaxAresRounding = true := by decide

-- ==== 追加の必須境界 (a) 零入力 / (b) 小さい正の入力 (1..13) / (c) saturation ====
-- (a) 零入力: 端数なし → みなし端数 0（結果 0 = 入力 0, saturation も兼ねる）。
example : deemedFraction 0 = 0 := by decide
-- (b) 小さい正の入力 (1..13): 端数 2・13 アールはいずれも百アールとみなされる。
example : deemedFraction 2 = 100 := by decide
example : deemedFraction 13 = 100 := by decide
-- (c) 法定閾値 100 アール（百アール）での saturation: 結果 = 入力 100（恒等）。
example : deemedFraction 100 = 100 := by decide

end JapanTaxLaw.LocalTaxAresRounding
