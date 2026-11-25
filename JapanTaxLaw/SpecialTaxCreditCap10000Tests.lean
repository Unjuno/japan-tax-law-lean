import JapanTaxLaw.SpecialTaxCreditCap10000
import JapanTaxLaw.SpecialTaxCreditCap10000Spec

/-
# SpecialTaxCreditCap10000Tests — 附則5の12(4) の kernel-decided 検証

Pinned: law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
All checks are closed expressions discharged by `by decide`.
Coverage: zero, the strict ¥10,000 threshold (below / at / above), signed
over-credit, zero-credit, finite smoke grid and impl/spec agreement.
-/

namespace JapanTaxLaw.SpecialTaxCreditCap10000

-- 原文の数値
example : ceilingYen = 10000 := by decide

-- 零入力
example : specialCredit 0 0 0 = 0 := by decide

-- 小さい入力（分岐は fallback）
example : specialCredit 1 0 7 = 7 := by decide
example : specialCredit 2 0 7 = 7 := by decide
example : specialCredit 3 0 7 = 7 := by decide

-- threshold_below / threshold_at / threshold_above (原文「超える」strict)
example : specialCredit 9999 100 7 = 7 := by decide
example : specialCredit 10000 100 7 = 7 := by decide
example : specialCredit 10001 100 7 = 9900 := by decide

-- 控除額が上限を超える場合: 負を保持（架空のゼロ下限なし）
example : specialCredit 10001 12000 7 = -2000 := by decide
example : specialCredit 20000 10000 7 = 0 := by decide

-- 零控除
example : specialCredit 10001 0 7 = 10000 := by decide

-- impl / 独立仕様の一致
example : ceilingYen = specCeiling := by decide
example : specialCredit 0 0 0 = specCredit 0 0 0 := by decide
example : specialCredit 9999 100 7 = specCredit 9999 100 7 := by decide
example : specialCredit 10000 100 7 = specCredit 10000 100 7 := by decide
example : specialCredit 10001 100 7 = specCredit 10001 100 7 := by decide
example : specialCredit 10001 12000 7 = specCredit 10001 12000 7 := by decide
example : specialCredit 20000 10000 7 = specCredit 20000 10000 7 := by decide

end JapanTaxLaw.SpecialTaxCreditCap10000
