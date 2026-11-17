import JapanTaxLaw.TaxFinance

/-!
# GiftSpecialDeduction — 相続税法 art. 21の12（相続時精算課税に係る贈与税の特別控除）L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Models the computable core of art. 21の12(1) — pinned bytes 逐語:

  「相続時精算課税適用者がその年中において特定贈与者からの贈与により取得した財産に係る
    その年分の贈与税については、特定贈与者ごとの前条第一項の規定による控除後の贈与税の
    課税価格からそれぞれ次に掲げる金額のうちいずれか低い金額を控除する。
    一 二千五百万円（既にこの条の規定の適用を受けて控除した金額がある場合には、
       その金額の合計額を控除した残額）
    二 特定贈与者ごとの前条第一項の規定による控除後の贈与税の課税価格」

Computation (Money = Nat):

  specialDeductionLimit = 25_000_000   -- 二千五百万円
  giftSpecialDeduction taxablePrice previouslyDeducted =
    min (25_000_000 − previouslyDeducted) taxablePrice   -- saturating subtraction on the cap

Scope & honest boundaries:

* `taxablePrice` は art. 21の11の二(1) の基礎控除後課税価格 — caller-established Money。
* `previouslyDeducted` は既に本条の適用を受けて控除した金額の合計額 — caller-established Money。
  「二千五百万円からその合計額を控除した残額」を Nat saturating subtraction で表現
  （合計が 2500万を超える場合は残額 0）。
* 第2項（期限内申告書への記載等）・第3項（やむを得ない事情）は適用要件 —
  caller-established、本モデルは金額計算のみ。
* 端数・丸めは本条に記載なし（金額は円単位の Nat）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 21の12(1)一 — 特別控除の限度額 二千五百万円。 -/
def giftSpecialDeductionLimit : Money := 25_000_000

/-- art. 21の12(1) — 控除額 = min(2500万 − 既控除合計, 控除後課税価格)。 -/
def giftSpecialDeduction (taxablePrice previouslyDeducted : Money) : Money :=
  min (giftSpecialDeductionLimit - previouslyDeducted) taxablePrice

-- ==== verified facts ====

theorem giftSpecialDeductionLimit_eq : giftSpecialDeductionLimit = 25_000_000 := rfl

/-- 控除額は課税価格以下。 -/
theorem giftSpecialDeduction_le_taxable (price prev : Money) :
    giftSpecialDeduction price prev ≤ price := by
  unfold giftSpecialDeduction
  exact Nat.min_le_right _ _

/-- 控除額は残額（2500万−既控除）以下。 -/
theorem giftSpecialDeduction_le_remaining (price prev : Money) :
    giftSpecialDeduction price prev ≤ giftSpecialDeductionLimit - prev := by
  unfold giftSpecialDeduction
  exact Nat.min_le_left _ _

/-- 既控除が上限以上なら残額 0 → 控除額 0。 -/
theorem giftSpecialDeduction_zero_when_exhausted (price prev : Money) (h : giftSpecialDeductionLimit ≤ prev) :
    giftSpecialDeduction price prev = 0 := by
  unfold giftSpecialDeduction
  have hz : giftSpecialDeductionLimit - prev = 0 := Nat.sub_eq_zero_of_le h
  rw [hz]
  exact Nat.zero_min price

/-- 課税価格が残額以下なら控除額 = 課税価格（控除後 0）。 -/
theorem giftSpecialDeduction_caps_taxable (price prev : Money) (h : price ≤ giftSpecialDeductionLimit - prev) :
    giftSpecialDeduction price prev = price := by
  unfold giftSpecialDeduction
  exact Nat.min_eq_right h

-- ==== kernel-decided smoke checks ====

-- 残額 2500万、課税価格 1000万 → 控除 1000万（価格が低い）
example : giftSpecialDeduction 10_000_000 0 = 10_000_000 := by decide
-- 残額 2500万、課税価格 3000万 → 控除 2500万（残額が低い）
example : giftSpecialDeduction 30_000_000 0 = 25_000_000 := by decide
-- 既控除 1000万 → 残額 1500万、課税価格 2000万 → 控除 1500万
example : giftSpecialDeduction 20_000_000 10_000_000 = 15_000_000 := by decide
-- 既控除 2500万 → 残額 0
example : giftSpecialDeduction 20_000_000 25_000_000 = 0 := by decide
-- 既控除 3000万（超過）→ 残額 0
example : giftSpecialDeduction 20_000_000 30_000_000 = 0 := by decide
example : giftSpecialDeduction 0 0 = 0 := by decide

end JapanTaxLaw
