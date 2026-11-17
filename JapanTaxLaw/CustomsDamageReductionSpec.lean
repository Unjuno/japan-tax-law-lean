import JapanTaxLaw.CustomsDamageReduction

/-!
# CustomsDamageReduction spec — 関税定率法 art. 10(1)

Sources (pinned; identical to CustomsDamageReduction.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 低下率基準の軽減額 = 関税額 × 低下率（整数式 num/den）
  * 差額上限 = 元の関税額 − 損傷後課税額
  * 差額以内かの判定
  impl が TaxRate.applyFloor を使うのに対し、spec は整数式で独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 低下率基準の軽減額（独立定式）。 -/
def specDepReduction (tax num den : Money) : Money := tax * num / den

/-- Spec: 差額上限（独立定式）。 -/
def specReductionCap (original after : Money) : Money := original - after

/-- Spec: 差額以内判定（独立定式）。 -/
def specWithinCap (original after num den : Money) : Bool :=
  decide (specDepReduction original num den ≤ specReductionCap original after)

-- ==== points (kernel-decided) ====

example : specDepReduction 1_000_000 10 100 = 100_000 := by decide
example : specReductionCap 1_000_000 850_000 = 150_000 := by decide
example : specWithinCap 1_000_000 850_000 10 100 = true := by decide
example : specWithinCap 1_000_000 950_000 10 100 = false := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsDamageReduction : Bool :=
  let r : TaxRate := ⟨10, 100, by decide⟩
  depreciationReduction 1_000_000 r == specDepReduction 1_000_000 10 100
    && reductionCap 1_000_000 850_000 == specReductionCap 1_000_000 850_000
    && reductionWithinCap 1_000_000 850_000 r == specWithinCap 1_000_000 850_000 10 100
    && reductionWithinCap 1_000_000 950_000 r == specWithinCap 1_000_000 950_000 10 100
    && reductionCap 800_000 900_000 == specReductionCap 800_000 900_000

example : agreeCustomsDamageReduction = true := by decide

end JapanTaxLaw
