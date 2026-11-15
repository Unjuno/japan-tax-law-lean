import JapanTaxLaw.GiftAddBack

/-!
# GiftAddBack spec — independent statement of art. 19(1)

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of 相続税法 art. 19(1) (相続開始前七年以内に贈与があつた場合の
相続税額) from the statutory text itself. Where the implementation uses saturating
`Nat` subtraction, this spec decides the 100万円控除 the other way:

  3〜7年の贈与合計 ≤ 1,000,000 → 加算 0
  3〜7年の贈与合計 > 1,000,000 → 合計 − 1,000,000

Scope boundaries are identical to the implementation (see GiftAddBack.lean):
特定贈与財産の判定・加算対象財産の選別・贈与税の税額の政令計算は呼出元責任。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 加算価額 — direct case analysis on the 3〜7年合計 vs 100万円. -/
def specGiftAddBack (f : GiftAddBackFacts) : Money :=
  f.giftsWithin3Years +
    (if f.giftsOver3Within7Years ≤ 1_000_000
     then 0
     else f.giftsOver3Within7Years - 1_000_000)

/-- Spec: 加算後の課税価格とみなす価額. -/
def specAugmentedTaxableValue (f : GiftAddBackFacts) : Money :=
  f.baseTaxableValue + specGiftAddBack f

/-- Spec: 納付すべき相続税額 — 算出した金額から贈与税の税額を控除. -/
def specTaxDueAfterGiftCredit (taxComputedOnAugmentedBase giftTaxPaid : Money) : Money :=
  if giftTaxPaid ≥ taxComputedOnAugmentedBase then 0 else taxComputedOnAugmentedBase - giftTaxPaid

-- ==== points, all kernel-decided ====

-- Case A — 3年以内 5,000,000 + (8,000,000 − 1,000,000) = 12,000,000
example : specGiftAddBack ⟨5_000_000, 8_000_000, 100_000_000, 2_000_000⟩ = 12_000_000 := by decide
-- Case A′ — augmented value
example : specAugmentedTaxableValue ⟨5_000_000, 8_000_000, 100_000_000, 2_000_000⟩ = 112_000_000 := by decide
-- Case B — 3〜7年分が100万円ちょうど → 加算 0
example : specGiftAddBack ⟨7_000_000, 1_000_000, 0, 0⟩ = 7_000_000 := by decide
-- Case C — 3〜7年分が100万円未満 → 加算 0
example : specGiftAddBack ⟨0, 900_000, 50_000_000, 0⟩ = 0 := by decide
-- Case D — 贈与税の税額 ≤ 算出額 → 控除後の納付額
example : specTaxDueAfterGiftCredit 15_800_000 2_000_000 = 13_800_000 := by decide
-- Case E — 贈与税の税額 ≥ 算出額 → 納付額 0
example : specTaxDueAfterGiftCredit 3_000_000 5_000_000 = 0 := by decide
-- Case F — 贈与なし → 加算なし・課税価格そのまま
example : specAugmentedTaxableValue ⟨0, 0, 100_000_000, 0⟩ = 100_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering both branches of the 100万円控除 and both sides of the gift-tax credit.
    Points are sample points, not a proof of universal equivalence. -/
def agreeGiftAddBackPoints : Bool :=
  let a := GiftAddBackFacts.mk 5_000_000 8_000_000 100_000_000 2_000_000
  let b := GiftAddBackFacts.mk 7_000_000 1_000_000 0 0
  let c := GiftAddBackFacts.mk 0 900_000 50_000_000 0
  let d := GiftAddBackFacts.mk 0 0 100_000_000 0
  let e := GiftAddBackFacts.mk 30_000_000 20_000_000 400_000_000 50_000_000
  let f := GiftAddBackFacts.mk 1_000_000 1_000_001 0 0
  (giftAddBack a == specGiftAddBack a) &&
  (giftAddBack b == specGiftAddBack b) &&
  (giftAddBack c == specGiftAddBack c) &&
  (giftAddBack d == specGiftAddBack d) &&
  (giftAddBack e == specGiftAddBack e) &&
  (giftAddBack f == specGiftAddBack f) &&
  (augmentedTaxableValue a == specAugmentedTaxableValue a) &&
  (augmentedTaxableValue e == specAugmentedTaxableValue e) &&
  (augmentedTaxableValue f == specAugmentedTaxableValue f) &&
  (taxDueAfterGiftCredit 15_800_000 2_000_000 == specTaxDueAfterGiftCredit 15_800_000 2_000_000) &&
  (taxDueAfterGiftCredit 3_000_000 5_000_000 == specTaxDueAfterGiftCredit 3_000_000 5_000_000)

example : agreeGiftAddBackPoints = true := by decide

end JapanTaxLaw
