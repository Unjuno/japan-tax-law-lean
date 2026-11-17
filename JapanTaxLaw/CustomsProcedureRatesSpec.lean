import JapanTaxLaw.CustomsProcedureRates

/-!
# CustomsProcedureRates spec — 関税法 art. 14の5

Sources (pinned; identical to CustomsProcedureRates.lean):

  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of the modeled computation (art. 14の5):

  * 控除後代金 = 代金 − 費用
    （impl が Nat.sub を直接使うに対し、spec は
      `if priorCosts ≤ gross then gross - priorCosts else 0` の独立定式）
  * 上限に収まる充当額 = min(関税額, 控除後代金)
    （spec は `if duty ≤ cap then duty else cap` の独立定式）
  * within-cap = 関税額 ≤ 控除後代金

第七条の十七・第十一条は計算式がないため NOT MODELLED（impl と同じ）。
Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

namespace CustomsProcedureSpec

open JapanTaxLaw.TaxFinance

/-- Spec: 控除後代金 = 代金 − 費用（独立定式、if-case-split）。 -/
def specNetProceeds (grossProceeds priorCosts : Money) : Money :=
  if priorCosts ≤ grossProceeds then grossProceeds - priorCosts else 0

/-- Spec: 上限に収まる充当額（独立定式、if-case-split）。 -/
def specCappedDuty (grossProceeds priorCosts duty : Money) : Money :=
  let cap := specNetProceeds grossProceeds priorCosts
  if duty ≤ cap then duty else cap

/-- Spec: within-cap 判定（独立定式）。 -/
def specWithinCap (grossProceeds priorCosts duty : Money) : Bool :=
  decide (duty ≤ specNetProceeds grossProceeds priorCosts)

-- ==== points (kernel-decided) ====

example : specNetProceeds 1_000_000 200_000 = 800_000 := by decide
example : specNetProceeds 1_000_000 1_200_000 = 0 := by decide
example : specCappedDuty 1_000_000 200_000 900_000 = 800_000 := by decide
example : specCappedDuty 1_000_000 200_000 500_000 = 500_000 := by decide
example : specWithinCap 1_000_000 200_000 800_000 = true := by decide
example : specWithinCap 1_000_000 200_000 800_001 = false := by decide

/-- Agreement checks between implementation and Spec (finite sample points). -/
def agreeCustomsProcedureRates : Bool :=
  [ (1_000_000, 200_000, 900_000), (1_000_000, 200_000, 500_000),
    (1_000_000, 0, 1_000_000), (1_000_000, 1_000_000, 100),
    (1_000_000, 1_200_000, 100), (500, 20, 480), (500, 20, 600)
  ].all fun (g, c, d) =>
    JapanTaxLaw.replacementNetProceeds g c == specNetProceeds g c &&
    JapanTaxLaw.cappedReplacementDuty g c d == specCappedDuty g c d &&
    JapanTaxLaw.replacementDutyWithinCap g c d == specWithinCap g c d

example : agreeCustomsProcedureRates = true := by decide

end CustomsProcedureSpec

end JapanTaxLaw
