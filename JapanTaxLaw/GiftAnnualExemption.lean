import JapanTaxLaw.TaxFinance

/-!
# GiftAnnualExemption — 相続税法 art. 21の11の二(1)（相続時精算課税に係る贈与税の基礎控除）L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

Models the computable core of art. 21の11の二(1) — pinned bytes 逐語:

  「相続時精算課税適用者がその年中において特定贈与者からの贈与により取得した
    財産に係るその年分の贈与税については、贈与税の課税価格から六十万円を控除する。」

Computation (Money = Nat, no coercion):

  giftAnnualExemptionLimit = 600_000            -- 六十万円
  giftAnnualExemptionBase price = price − 600_000   -- saturating: below the base, result is 0

Scope & honest boundaries:

* 「相続時精算課税適用者」「特定贈与者からの贈与」「その年中」は適用要件 —
  caller-established Bool / Money。本モジュールは金額計算のみをモデル化する。
* 第2項（特定贈与者が二人以上の場合の控除額の計算は政令で定める）は
  DELEGATION — 政令の内容は本スナップショットに数式がなく NOT MODELLED。
* 端数・丸めの規定は本条になし（金額は円単位の Nat）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 21の11の二(1) — 基礎控除額 六十万円。 -/
def giftAnnualExemptionLimit : Money := 600_000

/-- art. 21の11の二(1) — 六十万円控除後の課税価格（Nat saturating subtraction）。 -/
def giftAnnualExemptionBase (taxablePrice : Money) : Money :=
  taxablePrice - giftAnnualExemptionLimit

-- ==== verified facts ====

theorem giftAnnualExemptionLimit_eq : giftAnnualExemptionLimit = 600_000 := rfl

/-- 控除後課税価格は控除前以下。 -/
theorem giftAnnualExemptionBase_le (price : Money) :
    giftAnnualExemptionBase price ≤ price := by
  unfold giftAnnualExemptionBase
  exact Nat.sub_le _ _

/-- 課税価格が基礎控除以下なら控除後は零。 -/
theorem giftAnnualExemptionBase_zero_below (price : Money) (h : price ≤ giftAnnualExemptionLimit) :
    giftAnnualExemptionBase price = 0 := by
  unfold giftAnnualExemptionBase
  exact Nat.sub_eq_zero_of_le h

/-- 課税価格が基礎控除額ちょうどなら控除後は零（境界値）。 -/
theorem giftAnnualExemptionBase_at_limit :
    giftAnnualExemptionBase giftAnnualExemptionLimit = 0 := by
  unfold giftAnnualExemptionBase
  exact Nat.sub_self _

end JapanTaxLaw
