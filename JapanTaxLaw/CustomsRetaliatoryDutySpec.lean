import JapanTaxLaw.CustomsRetaliatoryDuty

/-!
# CustomsRetaliatoryDuty spec — 関税定率法 art. 6

Sources (pinned; identical to CustomsRetaliatoryDuty.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 追加関税の上限 = 課税価格と同額
  * 追加関税が上限以内かの判定
  impl が retaliatoryDutyCap を経由するのに対し、spec は直接比較で独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 追加関税の上限判定（独立定式）。 -/
def specRetaliatoryWithin (customsValue additional : Money) : Bool :=
  decide (additional ≤ customsValue)

-- ==== points (kernel-decided) ====

example : specRetaliatoryWithin 1_000_000 1_000_000 = true := by decide
example : specRetaliatoryWithin 1_000_000 1_000_001 = false := by decide
example : specRetaliatoryWithin 0 0 = true := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsRetaliatoryDuty : Bool :=
  [ (0, 0), (100, 50), (100, 100), (100, 101), (1_000_000, 999_999) ].all fun (v, a) =>
    retaliatoryDutyWithinCap v a == specRetaliatoryWithin v a

example : agreeCustomsRetaliatoryDuty = true := by decide

end JapanTaxLaw
