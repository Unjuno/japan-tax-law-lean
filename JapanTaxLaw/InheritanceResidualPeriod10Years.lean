import JapanTaxLaw.TaxFinance

/-
# InheritanceResidualPeriod10Years — 相続税法 第二十三条（残存期間が十年以下のもの）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|d5a66ff1b06fc056fd9ac865c49e901671853629ac2e087f189151171a59dc39

原文逐語（pinned）: 「残存期間が十年以下のもの」

Scope: ONLY the residual-period ceiling (≤ 10 years). The valuation ratios,
other period bands and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceResidualPeriod10Years

open JapanTaxLaw.TaxFinance

/-- 十年 — upper bound, inclusive (以下). -/
def periodCeilingYears : Nat := 10

/-- 残存期間が十年以下. -/
def withinPeriod (years : Nat) : Prop := years ≤ periodCeilingYears

/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def withinPeriodBool (years : Nat) : Bool := decide (years ≤ periodCeilingYears)

end JapanTaxLaw.InheritanceResidualPeriod10Years
