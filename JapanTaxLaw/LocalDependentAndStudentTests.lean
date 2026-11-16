import JapanTaxLaw.LocalIncomeTax

/-!
# LocalDependentAndStudent tests — art. 34(1）九号・第十一号・art. 34(4） smoke checks

Decidable smoke tests for the working-student deduction, the dependent deduction
(with the young/elderly/fixed amounts), and the art. 34(4） override.

pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 34(1）九号: 勤労学生である所得割の納税義務者 — 二十六万円
example : workingStudentDeduction = 260_000 := by decide

-- art. 34(1）第十一号: 控除対象扶養親族の金額（一控除対象扶養親族あたり）
example : dependentDeduction DependentKind.regular = 330_000 := by decide
-- 特定扶養親族（年齢十九歳以上二十三歳未満）
example : dependentDeduction DependentKind.specifiedAllocated = 450_000 := by decide
-- 老人扶養親族（年齢七十歳以上）
example : dependentDeduction DependentKind.elderly = 380_000 := by decide

-- art. 34(4）: 同居直系尊属であって老人扶養親族である場合は四十五万円
example : elderlyDependentDeductionWithCoHabitation true = 450_000 := by decide
example : elderlyDependentDeductionWithCoHabitation false = 380_000 := by decide

end JapanTaxLaw
