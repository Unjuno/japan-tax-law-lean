import JapanTaxLaw.IncomeWithholdingRates

/-!
# IncomeWithholdingRates tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 208 / 175 / 179 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
-/

namespace JapanTaxLaw.IncomeWithholdingRates

open JapanTaxLaw.TaxFinance

-- ==== art. 208: 年金 − 保険料対応額 → 10%（saturating + floor） ====

example : article208WithholdingRate.num = 10 := by decide
example : article208WithholdingRate.den = 100 := by decide
example : article208DeductedAnnuity 1_000_000 250_000 = 750_000 := by decide
example : article208DeductedAnnuity 250_000 250_000 = 0 := by decide
example : article208DeductedAnnuity 100 101 = 0 := by decide
example : article208DeductedAnnuity 0 0 = 0 := by decide
example : article208WithholdingTax 1_000_000 250_000 = 75_000 := by decide
example : article208WithholdingTax 1_000 1_100 = 0 := by decide
example : article208WithholdingTax 25 0 = 2 := by decide
example : article208WithholdingTax 1_000_000 0 > article208WithholdingTax 1_000_000 250_000 := by decide

-- ==== art. 175: 利子等 15% / 配当等 20%（2区分） ====

example : annuityWithholdingRate.num = 15 := by decide
example : dividendWithholdingRate.num = 20 := by decide
example : (article175Rate true).num = 20 := by decide
example : (article175Rate false).num = 15 := by decide
example : article175WithholdingTax false 1_000_000 = 150_000 := by decide
example : article175WithholdingTax true 1_000_000 = 200_000 := by decide
example : article175WithholdingTax false 9 = 1 := by decide
example : article175WithholdingTax true 1 = 0 := by decide
example : article175WithholdingTax true 100 > article175WithholdingTax false 100 := by decide

-- ==== art. 179: 一号 20% / 二号 10% / 三号 15%（3区分） ====

example : foreignCorpGeneralRate.num = 20 := by decide
example : foreignCorpArticle161Item5Rate.num = 10 := by decide
example : foreignCorpArticle161Item8Or15Rate.num = 15 := by decide
example : (article179Rate .general).num = 20 := by decide
example : (article179Rate .item5).num = 10 := by decide
example : (article179Rate .item8Or15).num = 15 := by decide
example : article179WithholdingTax .general 1_000_000 = 200_000 := by decide
example : article179WithholdingTax .item5 1_000_000 = 100_000 := by decide
example : article179WithholdingTax .item8Or15 1_000_000 = 150_000 := by decide
example : article179WithholdingTax .general 1_000_000 > article179WithholdingTax .item8Or15 1_000_000 := by decide
example : article179WithholdingTax .item8Or15 1_000_000 > article179WithholdingTax .item5 1_000_000 := by decide
example : article179WithholdingTax .item5 9 = 0 := by decide

end JapanTaxLaw.IncomeWithholdingRates
