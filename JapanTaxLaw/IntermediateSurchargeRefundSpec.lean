import JapanTaxLaw.IntermediateSurchargeRefund

/-!
# IntermediateSurchargeRefundSpec — 地方税法施行令 art. 26 の独立定式

Sources (pinned; identical to IntermediateSurchargeRefund.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatements of the modelled computations:

  * 本則
      impl: `surchargeRefund surchargePaid refundAmount intermediateTotal
               = surchargePaid * refundAmount / intermediateTotal`
      spec: `specSurchargeRefund surchargePaid refundAmount intermediateTotal
               = (refundAmount * surchargePaid) / intermediateTotal`
    — 被乗数の順序を入れ替えた独立整数定式。Nat 除算の切り捨てと分母零 → 0 は同じ規約。

  * ただし書（分割納付）
      impl: `splitRefund amount1 amount2 = amount1 - amount2`（saturating Nat）
      spec: `specSplitRefund amount1 amount2
               = if amount2 ≤ amount1 then amount1 - amount2 else 0`
    — saturating を条件式で明示的に書き直した独立定式。

各 `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
分母零・第二号 > 第一号・端数切り捨てをサンプルに含める。

Scope boundaries identical to the implementation. 延滞金額・還付額・中間納付額・
充当額・区分はすべて caller-established。第二号の「法の規定により計算される
延滞金額の合計額」の算定は NOT MODELLED（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.IntermediateSurchargeRefund

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: 本則の按分（被乗数を入れ替えた独立整数定式）。 -/
def specSurchargeRefund (surchargePaid refundAmount intermediateTotal : Money) : Money :=
  (refundAmount * surchargePaid) / intermediateTotal

/-- Spec: ただし書の控除（saturating を条件式で明示）。 -/
def specSplitRefund (amount1 amount2 : Money) : Money :=
  if amount2 ≤ amount1 then amount1 - amount2 else 0

-- ==== points (kernel-decided) ====

example : specSurchargeRefund 1_000 1_000 1_000 = 1_000 := by decide
example : specSurchargeRefund 1_000 300 0 = 0 := by decide
example : specSurchargeRefund 1_000 0 1_000 = 0 := by decide
example : specSurchargeRefund 1_000 1 3 = 333 := by decide
example : specSurchargeRefund 12_345 3_000 10_000 = 3_703 := by decide

example : specSplitRefund 5_000 2_000 = 3_000 := by decide
example : specSplitRefund 2_000 5_000 = 0 := by decide
example : specSplitRefund 5_000 5_000 = 0 := by decide
example : specSplitRefund 5_000 0 = 5_000 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 本則: impl ≡ spec（有限サンプル上の `==` 一致、分母零・端数切り捨てを含む）。 -/
def agreeSurchargeRefund : Bool :=
  [ (0, 0, 0), (1_000, 300, 0), (1_000, 0, 1_000), (0, 300, 1_000),
    (1_000, 1, 3), (1_000, 1_000, 1_000), (1_000, 300, 1_000),
    (12_345, 3_000, 10_000), (123_456, 7, 9) ].all fun (s, r, t) =>
      surchargeRefund s r t == specSurchargeRefund s r t

/-- ただし書: impl ≡ spec（有限サンプル上の `==` 一致、amount2 > amount1 を含む）。 -/
def agreeSplitRefund : Bool :=
  [ (0, 0), (0, 1), (5_000, 0), (5_000, 2_000), (5_000, 5_000),
    (2_000, 5_000), (1, 2) ].all fun (a, b) =>
      splitRefund a b == specSplitRefund a b

example : agreeSurchargeRefund = true := by decide
example : agreeSplitRefund = true := by decide

end JapanTaxLaw.IntermediateSurchargeRefund
