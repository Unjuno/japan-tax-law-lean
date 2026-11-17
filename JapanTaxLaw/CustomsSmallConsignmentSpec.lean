import JapanTaxLaw.CustomsSmallConsignment

/-!
# CustomsSmallConsignment spec — 関税定率法 art. 3の3

Sources (pinned; identical to CustomsSmallConsignment.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 閾値 200,000（二十万円以下 → ≤）
  * 適用可否 = (price ≤ 200,000) かつ 除外でない かつ 申出でない
  impl が Bool の && と ! を使うのに対し、spec は Nat の比較を
  命題として decide した独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 閾値（独立定式）。 -/
def specSmallThreshold : Money := 200_000

/-- Spec: 適用可否（独立定式 — 命題を decide）。 -/
def specSmallApplies (price : Money) (excluded optedOut : Bool) : Bool :=
  decide (price ≤ specSmallThreshold ∧ excluded = false ∧ optedOut = false)

-- ==== points (kernel-decided) ====

example : specSmallApplies 200_000 false false = true := by decide
example : specSmallApplies 200_001 false false = false := by decide
example : specSmallApplies 100_000 true false = false := by decide
example : specSmallApplies 100_000 false true = false := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsSmallConsignment : Bool :=
  [ (0, false, false), (199_999, false, false), (200_000, false, false),
    (200_001, false, false), (100_000, true, false), (100_000, false, true),
    (300_000, true, true) ].all fun (p, e, o) =>
    smallConsignmentApplies p e o == specSmallApplies p e o

example : agreeCustomsSmallConsignment = true := by decide

end JapanTaxLaw
