import JapanTaxLaw.TrustPensionReserve

/-!
# TrustPensionReserve specification — 法人税法施行令 art.157 第1項の独立整数定式

Source (pinned):
  Law id: 340CO0000000097 (法人税法施行令)
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01

This module restates the art.157(1) arithmetic independently of
`TrustPensionReserve.lean`:

  * the implementation uses Nat's *saturating* subtraction
    `(first + second) - (third + fourth)`; the spec instead uses an explicit
    guard `if third + fourth ≤ first + second then … else 0`;
  * the implementation calls `TaxRate.applyFloor`; the spec multiplies raw
    `num`/`den` literals directly (`base * num / den`), without the `TaxRate`
    structure or its helper.

These are extensionally equal on `Nat`, but written differently so that
agreement is a genuine cross-check rather than a syntactic restatement.

Scope: art.157(1)（第一号〜第四号の合計額控除 + 調整割合適用）のみ。
各号の具体的算定・調整割合の算定・該当性は NOT MODELLED（caller-established）。
`agree*` は有限サンプル上の一致確認であり、全入力域での等価証明ではない。
-/

namespace JapanTaxLaw.TrustPensionReserveSpec

/-- 独立定式: 基準額。saturating 減算の代わりに明示ガードを用いる。 -/
def specBase (first second third fourth : Nat) : Nat :=
  if third + fourth ≤ first + second then (first + second) - (third + fourth) else 0

/-- 独立定式: 調整割合の適用。`TaxRate` を使わず raw な num/den で掛け算。 -/
def specApply (num den base : Nat) : Nat := base * num / den

/-- 独立定式: 積立金額 = 基準額 × 調整割合（切り捨て）。 -/
def specTrustPensionReserve (first second third fourth num den : Nat) : Nat :=
  specApply num den (specBase first second third fourth)

/-- 基準額の 1 点対応（impl ≡ spec）。 -/
def agreeBasePoint (first second third fourth : Nat) : Bool :=
  decide (JapanTaxLaw.TrustPensionReserve.trustPensionBase first second third fourth =
    specBase first second third fourth)

/-- 積立金額の 1 点対応。`hden` は呼出側が与える正の分母の証明。 -/
def agreeReservePoint (first second third fourth num den : Nat) (hden : 0 < den) : Bool :=
  decide (
    JapanTaxLaw.TrustPensionReserve.trustPensionReserve first second third fourth
      (⟨num, den, hden⟩ : JapanTaxLaw.TaxFinance.TaxRate) =
    specTrustPensionReserve first second third fourth num den)

/-- 基準額の有限サンプル一致。加算=控除の境界・控除>加算・通常値を含む。 -/
def agreeBase : Bool :=
  agreeBasePoint 0 0 0 0 &&
  agreeBasePoint 10 5 3 2 &&
  agreeBasePoint 10 5 7 8 &&
  agreeBasePoint 10 5 8 9 &&
  agreeBasePoint 1 2 3 4 &&
  agreeBasePoint 100 200 50 20 &&
  agreeBasePoint 100 200 150 150 &&
  agreeBasePoint 999 1 500 400

/-- 積立金額の有限サンプル一致。調整割合 0 / 1 / 端数 / 異なり率を含む。 -/
def agreeReserve : Bool :=
  agreeReservePoint 10 5 3 2 0 100 (by decide) &&
  agreeReservePoint 10 5 3 2 100 100 (by decide) &&
  agreeReservePoint 10 5 3 2 107 100 (by decide) &&
  agreeReservePoint 10 5 3 2 1 3 (by decide) &&
  agreeReservePoint 100 200 50 20 107 100 (by decide) &&
  agreeReservePoint 100 200 50 20 3 7 (by decide) &&
  agreeReservePoint 10 5 8 9 107 100 (by decide) &&
  agreeReservePoint 1 2 0 0 1 2 (by decide) &&
  agreeReservePoint 0 0 0 0 107 100 (by decide) &&
  agreeReservePoint 999 1 500 400 100 100 (by decide)

/-- 有限グリッド上で impl と spec が一致する（kernel-decide）。 -/
example : agreeBase = true := by decide
example : agreeReserve = true := by decide

end JapanTaxLaw.TrustPensionReserveSpec
