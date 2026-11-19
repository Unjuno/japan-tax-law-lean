import JapanTaxLaw.InheritedPropertyTransferGain

/-!
# InheritedPropertyTransferGainSpec — 租税特別措置法施行令 art. 25の16 の独立定式

Sources (pinned; identical to InheritedPropertyTransferGain.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatements of the three modelled computations:

  * 一号税額 × 二号割合
      impl: `inheritedTransferBase m r = m * r.num / r.den`   (`TaxRate.applyFloor`)
      spec: `specInheritedTransferBase m num den = num * m / den`
    — 被乗数の順序を入れ替えた独立整数定式（同じ切り捨て）。
  * ただし書の残額
      impl: `inheritedResidualGain p c = max (p - c) 0`        (Nat 減算)
      spec: `specInheritedResidualGain p c = if p ≤ c then 0 else p - c`
    — 条件分岐による独立定式。
  * 特例金額
      impl: `inheritedTransferGain m r p c = min (base m r) (residual p c)`
      spec: `specInheritedTransferGain m num den p c = min (specBase ·) (specResidual ·)`

各 `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではありません。
各サンプルは「計算額 < 残額 / 計算額 > 残額 / 収入金額 < 合計額 / 端数切り捨て」を
含みます。

Scope boundaries identical to the implementation. 相続税額・二号の割合・収入金額・
取得費・譲渡費用・該当性はすべて caller-established で NOT MODELLED
（impl の doc-comment 参照）。二号の割合の具体的算定（他条文参照）も NOT MODELLED。
丸めは切り捨て（Nat 除算）。
-/

namespace JapanTaxLaw.InheritedPropertyTransferGain

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: 一号税額 × 二号割合（被乗数を入れ替えた独立整数定式）。 -/
def specInheritedTransferBase (inheritanceTax num den : Money) : Money :=
  num * inheritanceTax / den

/-- Spec: ただし書の残額（条件分岐による独立定式）。 -/
def specInheritedResidualGain (proceeds cost : Money) : Money :=
  if proceeds ≤ cost then 0 else proceeds - cost

/-- Spec: 特例金額 = min(計算額, 残額)。 -/
def specInheritedTransferGain (inheritanceTax num den proceeds cost : Money) : Money :=
  min (specInheritedTransferBase inheritanceTax num den)
      (specInheritedResidualGain proceeds cost)

-- ==== points (kernel-decided) ====

example : specInheritedTransferBase 1_000_000 1 10 = 100_000 := by decide
example : specInheritedTransferBase 1_000 1 3 = 333 := by decide
example : specInheritedTransferBase 100 0 1 = 0 := by decide

example : specInheritedResidualGain 500_000 300_000 = 200_000 := by decide
example : specInheritedResidualGain 300_000 500_000 = 0 := by decide
example : specInheritedResidualGain 300_000 300_000 = 0 := by decide

example : specInheritedTransferGain 1_000_000 1 10 500_000 300_000 = 100_000 := by decide
example : specInheritedTransferGain 5_000_000 1 10 400_000 100_000 = 300_000 := by decide
example : specInheritedTransferGain 1_000_000 1 2 100_000 300_000 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 計算額: impl ≡ spec（有限サンプル上の `==` 一致、端数切り捨てを含む）。 -/
def agreeInheritedTransferBase : Bool :=
  [ (0, (⟨1, 10, by decide⟩ : TaxRate)),
    (1_000, ⟨1, 3, by decide⟩),
    (100, ⟨0, 1, by decide⟩),
    (1_000_000, ⟨1, 10, by decide⟩),
    (7, ⟨2, 7, by decide⟩)
  ].all fun (m, r) =>
    inheritedTransferBase m r == specInheritedTransferBase m r.num r.den

/-- 残額: impl ≡ spec（有限サンプル上の `==` 一致、収入金額 ≤ 合計額を含む）。 -/
def agreeInheritedResidualGain : Bool :=
  [ (500_000, 300_000), (300_000, 500_000), (300_000, 300_000),
    (0, 0), (1, 0), (10, 7)
  ].all fun (p, c) =>
    inheritedResidualGain p c == specInheritedResidualGain p c

/-- 特例金額: impl ≡ spec（有限サンプル上の `==` 一致、3 境界 + 端数を含む）。 -/
def agreeInheritedTransferGain : Bool :=
  [ (1_000_000, (⟨1, 10, by decide⟩ : TaxRate), 500_000, 300_000),
    (5_000_000, ⟨1, 10, by decide⟩, 400_000, 100_000),
    (1_000_000, ⟨1, 10, by decide⟩, 400_000, 300_000),
    (1_000_000, ⟨1, 2, by decide⟩, 100_000, 300_000),
    (1_000, ⟨1, 3, by decide⟩, 2_000, 1_000),
    (1_000, ⟨1, 3, by decide⟩, 1_000, 800),
    (100, ⟨0, 1, by decide⟩, 900_000, 5),
    (0, ⟨1, 2, by decide⟩, 0, 0)
  ].all fun (m, r, p, c) =>
    inheritedTransferGain m r p c == specInheritedTransferGain m r.num r.den p c

example : agreeInheritedTransferBase = true := by decide
example : agreeInheritedResidualGain = true := by decide
example : agreeInheritedTransferGain = true := by decide

end JapanTaxLaw.InheritedPropertyTransferGain
