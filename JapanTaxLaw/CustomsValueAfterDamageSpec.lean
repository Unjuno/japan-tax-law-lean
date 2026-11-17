import JapanTaxLaw.CustomsValueAfterDamage

/-!
# CustomsValueAfterDamage spec — 関税定率法 art. 4の5

Sources (pinned; identical to CustomsValueAfterDamage.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 変質・損傷後課税価格 = 仮想課税価格 − 減価額（saturating Nat 減算）
  impl が Nat.sub を直接使うのに対し、spec は不等式 case split 付きの
  独立定式 `if depreciation ≤ hypothetical then hypothetical - depreciation else 0`
  で定式化（意味は同じだが定式化を独立に保つ）。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 4の5 変質後課税価格（独立定式）。 -/
def specCustomsValueAfterDamage (hypothetical depreciation : Money) : Money :=
  if depreciation ≤ hypothetical then hypothetical - depreciation else 0

-- ==== points (kernel-decided) ====

example : specCustomsValueAfterDamage 100_000 20_000 = 80_000 := by decide
example : specCustomsValueAfterDamage 100_000 0 = 100_000 := by decide
example : specCustomsValueAfterDamage 10_000 20_000 = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsValueAfterDamage : Bool :=
  [ (100_000, 20_000), (100_000, 0), (100_000, 100_000),
    (10_000, 20_000), (0, 5_000), (1, 1), (999, 1) ].all fun (h, d) =>
    customsValueAfterDamage h d == specCustomsValueAfterDamage h d

example : agreeCustomsValueAfterDamage = true := by decide

end JapanTaxLaw
