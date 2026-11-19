import JapanTaxLaw.IncomeArt213Withholding

/-!
# IncomeArt213Withholding tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 213 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
Boundaries covered: 0, deduction > amount (saturating), months = 0, floor rounding,
and the 一号/二号 rate contrast.
-/ 

namespace JapanTaxLaw.IncomeArt213Withholding

-- ==== 税率定数 ====

example : art213GeneralRate.num = 20 := by decide
example : art213GeneralRate.den = 100 := by decide
example : art213ReducedRate.num = 10 := by decide
example : art213ReducedRate.den = 100 := by decide

-- ==== 控除額 ====

example : pensionDeduction 0 = 0 := by decide
example : pensionDeduction 1 = 50_000 := by decide
example : pensionDeduction 12 = 600_000 := by decide
example : prizeDeduction = 500_000 := by decide

-- ==== 控除後金額（saturating） ====

example : art213Pension12Base 1_000_000 12 = 400_000 := by decide
example : art213Pension12Base 1_000_000 0 = 1_000_000 := by decide
example : art213Pension12Base 100_000 3 = 0 := by decide   -- 控除 > 金額
example : art213Prize13Base 1_000_000 = 500_000 := by decide
example : art213Prize13Base 400_000 = 0 := by decide        -- 控除 > 金額
example : art213Pension14Base 1_000_000 250_000 = 750_000 := by decide
example : art213Pension14Base 100 200 = 0 := by decide      -- 控除 > 金額
example : art213Pension14Base 0 0 = 0 := by decide

-- ==== 一号イ（年金、月数） ====

example : article213WithholdingTax 1_000_000 12 0 false true false false = 80_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 false true false false = 200_000 := by decide -- 月数 0
example : article213WithholdingTax 100_000 3 0 false true false false = 0 := by decide

-- ==== 一号ロ（賞金、50万円控除） ====

example : article213WithholdingTax 1_000_000 0 0 false false true false = 100_000 := by decide
example : article213WithholdingTax 400_000 0 0 false false true false = 0 := by decide
example : article213WithholdingTax 500_000 0 0 false false true false = 0 := by decide

-- ==== 一号ハ（保険料対応額は caller-established、算定は NOT MODELLED） ====

example : article213WithholdingTax 1_000_000 0 250_000 false false false true = 150_000 := by decide
example : article213WithholdingTax 100 0 200 false false false true = 0 := by decide

-- ==== 一号一般 / 二号（率の対比） ====

example : article213WithholdingTax 1_000_000 0 0 false false false false = 200_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 true false false false = 100_000 := by decide
example : article213WithholdingTax 1_000_000 0 0 false false false false >
          article213WithholdingTax 1_000_000 0 0 true false false false := by decide

-- ==== 境界: 0 と丸め ====

example : article213WithholdingTax 0 0 0 false false false false = 0 := by decide
example : article213WithholdingTax 0 0 0 true false false false = 0 := by decide
example : article213WithholdingTax 0 12 0 false true false false = 0 := by decide
example : article213WithholdingTax 9 0 0 false false false false = 1 := by decide
example : article213WithholdingTax 9 0 0 true false false false = 0 := by decide

end JapanTaxLaw.IncomeArt213Withholding
