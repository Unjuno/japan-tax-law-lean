import JapanTaxLaw.TaxFinance

/-
# PermitValidity7Days — 酒税法施行規則 第五十条（許可状の有効期間七日超）

Pinned source:
  Law id: 337CO0000000135
  Official title: 酒税法施行規則
  Law type: MinisterialOrdinance (省令)
  Revision: 337CO0000000135_20260401_507CO0000000126
  Raw snapshot: data/raw/337CO0000000135_20260401_507CO0000000126.law.json
  SHA-256: d43732150ecbf2b0e12426c5a3b0289921be919480ddda742a9650cbd13986af
  Statutory article: 第五十条 (art. 50)

原文逐語（pinned, 一字一句改変なし, CONDITION; scoped Article 50）:
  「許可状が七日を超える有効期間を必要とするときは、その旨及び事由」

Variable contract:
  `validityFloorDays : Nat := 7` = 七日 (7 days).
  `needsSpecialPermit (days : Nat) : Bool := decide (validityFloorDays < days)`.
  Unit: 日 (days); domain Nat. `days` = 許可状の有効期間.
  「七日を超える」 = strict `>` (超える), NOT inclusive 以上:
  days > 7 STRICT; a permit of exactly 七日 does NOT satisfy the condition.

Scope: ONLY the explicit time-duration threshold is modelled — a 許可状
requiring a validity period strictly exceeding 七日. This is a duration
threshold (distinct from a money or count threshold). The rest of art. 50,
the statement of reasons (事由), the permit procedure, other articles and all
enforcement/operational rules are NOT MODELLED.
-/

namespace JapanTaxLaw.PermitValidity7Days

/-- 七日 — strict lower bound (超える). Unit 日; domain Nat. -/
def validityFloorDays : Nat := 7

/-- 「七日を超える有効期間」: days > 7, strict. -/
def needsSpecialPermit (days : Nat) : Bool :=
  decide (validityFloorDays < days)

/-- 超える is exclusive: exactly 七日 does not qualify. -/
theorem needsSpecialPermit_0 : needsSpecialPermit 0 = false := by decide

/-- At the floor (七日) the strict condition is still false. -/
theorem needsSpecialPermit_7 : needsSpecialPermit 7 = false := by decide

/-- One day above the floor qualifies. -/
theorem needsSpecialPermit_8 : needsSpecialPermit 8 = true := by decide

/-- A much longer validity period also qualifies. -/
theorem needsSpecialPermit_30 : needsSpecialPermit 30 = true := by decide

/-- The pinned statutory value is 七日 = 7. -/
theorem validityFloorDays_value : validityFloorDays = 7 := rfl

end JapanTaxLaw.PermitValidity7Days
