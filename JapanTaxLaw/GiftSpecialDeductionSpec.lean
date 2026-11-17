import JapanTaxLaw.GiftSpecialDeduction

/-!
# GiftSpecialDeduction spec — 相続税法 art. 21の12

Sources (pinned; identical to GiftSpecialDeduction.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Independent restatement of:
  * 控除額 = min(2500万 − 既控除合計, 控除後課税価格)
  impl が Nat.min と giftSpecialDeductionLimit を使うのに対し、spec は
  整数リテラルと入れ子 if による独立定式で定式化。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 控除額（独立定式）。 -/
def specGiftSpecialDeduction (price prev : Money) : Money :=
  let remaining := if 25_000_000 ≤ prev then 0 else 25_000_000 - prev
  if price ≤ remaining then price else remaining

-- ==== points (kernel-decided) ====

example : specGiftSpecialDeduction 10_000_000 0 = 10_000_000 := by decide
example : specGiftSpecialDeduction 30_000_000 0 = 25_000_000 := by decide
example : specGiftSpecialDeduction 20_000_000 10_000_000 = 15_000_000 := by decide
example : specGiftSpecialDeduction 20_000_000 30_000_000 = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeGiftSpecialDeduction : Bool :=
  [ (0, 0), (10_000_000, 0), (30_000_000, 0), (20_000_000, 10_000_000),
    (20_000_000, 25_000_000), (20_000_000, 30_000_000), (1, 24_999_999) ].all fun (p, prev) =>
    giftSpecialDeduction p prev == specGiftSpecialDeduction p prev

example : agreeGiftSpecialDeduction = true := by decide

end JapanTaxLaw
