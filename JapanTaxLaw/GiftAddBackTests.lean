import JapanTaxLaw.GiftAddBack

/-!
# GiftAddBack tests — 相続税法 art. 19 smoke checks

Decidable smoke tests for the pre-death gift add-back model (art. 19), pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Each `example` covers an art. 19(1) boundary: the three-tier split of the
7-year window, the 100万円 deduction for the over-3-year portion, the
autmented taxable value, the art. 15-17 composed path for a single heir,
and the gift-tax credit saturation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- Example A — 3年以内 5,000,000 + (8,000,000 − 1,000,000) = 12,000,000; augmented 112,000,000
def fA : GiftAddBackFacts := ⟨5_000_000, 8_000_000, 100_000_000, 2_000_000⟩
example : giftAddBack fA = 12_000_000 := by decide
example : augmentedTaxableValue fA = 112_000_000 := by decide
-- single heir: 112,000,000 − 36,000,000 = 76,000,000 → art. 16: 15,800,000; credit 2,000,000 → 13,800,000
example : singleHeirTaxComputedOnAugmentedBase fA = 15_800_000 := by decide
example : singleHeirTaxDueAfterGiftCredit fA = 13_800_000 := by decide

-- Example B — large base: 3年以内 30,000,000 + (20,000,000 − 1,000,000) = 49,000,000
def fB : GiftAddBackFacts := ⟨30_000_000, 20_000_000, 400_000_000, 50_000_000⟩
example : giftAddBack fB = 49_000_000 := by decide
example : augmentedTaxableValue fB = 449_000_000 := by decide
example : singleHeirTaxComputedOnAugmentedBase fB = 164_500_000 := by decide
example : singleHeirTaxDueAfterGiftCredit fB = 114_500_000 := by decide

-- Example C — 3〜7年分が100万円以下 → その部分は加算なし
def fC : GiftAddBackFacts := ⟨0, 900_000, 100_000_000, 0⟩
example : giftAddBack fC = 0 := by decide
example : augmentedTaxableValue fC = 100_000_000 := by decide
def fC' : GiftAddBackFacts := ⟨0, 1_000_000, 100_000_000, 0⟩
example : giftAddBack fC' = 0 := by decide

-- Example D — ちょうど100万円を1円超えると、その1円だけが加算される
def fD : GiftAddBackFacts := ⟨0, 1_000_001, 0, 0⟩
example : giftAddBack fD = 1 := by decide

-- Example E — 加算対象贈与なし: 課税価格そのまま
def fE : GiftAddBackFacts := ⟨0, 0, 100_000_000, 0⟩
example : augmentedTaxableValue fE = 100_000_000 := by decide
example : singleHeirTaxDueAfterGiftCredit fE = 12_200_000 := by decide

-- Example F — 贈与税の税額が算出額を超える場合は飽和減算で 0
def fF : GiftAddBackFacts := ⟨0, 0, 30_000_000, 99_000_000⟩
example : singleHeirTaxDueAfterGiftCredit fF = 0 := by decide

-- Example G — 3年以内分だけの場合
def fG : GiftAddBackFacts := ⟨25_000_000, 0, 200_000_000, 0⟩
example : giftAddBack fG = 25_000_000 := by decide
example : augmentedTaxableValue fG = 225_000_000 := by decide

-- gift-tax credit function standalone checks
example : taxDueAfterGiftCredit 15_800_000 2_000_000 = 13_800_000 := by decide
example : taxDueAfterGiftCredit 3_000_000 5_000_000 = 0 := by decide
example : taxDueAfterGiftCredit 15_800_000 15_800_000 = 0 := by decide

end JapanTaxLaw
