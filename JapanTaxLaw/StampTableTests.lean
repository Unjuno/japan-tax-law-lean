import JapanTaxLaw.StampTable

/-!
# StampTable tests — 印紙税法 別表第一 第一〜三号 smoke checks

Decidable smoke tests for the stamp rate tables, pinned to
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

Each `example` covers a band boundary (inclusive cap) of each table, the
non-taxable thresholds (¥10,000 / ¥100,000), the unstated-amount branches,
the 第三号２ preferred-note branch, and the cap values.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 第一号文書: every band edge (含まれる側)
example : stampDuty ⟨.contract, some 10_000, false⟩ = 200 := by decide
example : stampDuty ⟨.contract, some 100_000, false⟩ = 200 := by decide
example : stampDuty ⟨.contract, some 100_001, false⟩ = 400 := by decide
example : stampDuty ⟨.contract, some 500_000, false⟩ = 400 := by decide
example : stampDuty ⟨.contract, some 500_001, false⟩ = 1_000 := by decide
example : stampDuty ⟨.contract, some 1_000_000, false⟩ = 1_000 := by decide
example : stampDuty ⟨.contract, some 1_000_001, false⟩ = 2_000 := by decide
example : stampDuty ⟨.contract, some 5_000_000, false⟩ = 2_000 := by decide
example : stampDuty ⟨.contract, some 5_000_001, false⟩ = 10_000 := by decide
example : stampDuty ⟨.contract, some 10_000_000, false⟩ = 10_000 := by decide
example : stampDuty ⟨.contract, some 10_000_001, false⟩ = 20_000 := by decide
example : stampDuty ⟨.contract, some 50_000_000, false⟩ = 20_000 := by decide
example : stampDuty ⟨.contract, some 50_000_001, false⟩ = 60_000 := by decide
example : stampDuty ⟨.contract, some 100_000_000, false⟩ = 60_000 := by decide
example : stampDuty ⟨.contract, some 100_000_001, false⟩ = 100_000 := by decide
example : stampDuty ⟨.contract, some 500_000_000, false⟩ = 100_000 := by decide
example : stampDuty ⟨.contract, some 500_000_001, false⟩ = 200_000 := by decide
example : stampDuty ⟨.contract, some 1_000_000_000, false⟩ = 200_000 := by decide
example : stampDuty ⟨.contract, some 1_000_000_001, false⟩ = 400_000 := by decide
example : stampDuty ⟨.contract, some 5_000_000_000, false⟩ = 400_000 := by decide
example : stampDuty ⟨.contract, some 5_000_000_001, false⟩ = 600_000 := by decide

-- 第一号: 記載金額一万円未満は非課税（art. 5）
example : stampDuty ⟨.contract, some 0, false⟩ = 0 := by decide
example : stampDuty ⟨.contract, some 9_999, false⟩ = 0 := by decide
example : stampDuty ⟨.contract, some 10_000, false⟩ = 200 := by decide

-- 第一号: 記載のない契約書は一通につき 200 円
example : stampDuty ⟨.contract, none, false⟩ = 200 := by decide

-- 第二号文書: every band edge
example : stampDuty ⟨.contractOfWork, some 10_000, false⟩ = 200 := by decide
example : stampDuty ⟨.contractOfWork, some 1_000_000, false⟩ = 200 := by decide
example : stampDuty ⟨.contractOfWork, some 1_000_001, false⟩ = 400 := by decide
example : stampDuty ⟨.contractOfWork, some 2_000_000, false⟩ = 400 := by decide
example : stampDuty ⟨.contractOfWork, some 2_000_001, false⟩ = 1_000 := by decide
example : stampDuty ⟨.contractOfWork, some 3_000_000, false⟩ = 1_000 := by decide
example : stampDuty ⟨.contractOfWork, some 3_000_001, false⟩ = 2_000 := by decide
example : stampDuty ⟨.contractOfWork, some 5_000_000, false⟩ = 2_000 := by decide
example : stampDuty ⟨.contractOfWork, some 5_000_001, false⟩ = 10_000 := by decide
example : stampDuty ⟨.contractOfWork, some 10_000_000, false⟩ = 10_000 := by decide
example : stampDuty ⟨.contractOfWork, some 10_000_001, false⟩ = 20_000 := by decide
example : stampDuty ⟨.contractOfWork, some 50_000_000, false⟩ = 20_000 := by decide
example : stampDuty ⟨.contractOfWork, some 50_000_001, false⟩ = 60_000 := by decide
example : stampDuty ⟨.contractOfWork, some 100_000_000, false⟩ = 60_000 := by decide
example : stampDuty ⟨.contractOfWork, some 100_000_001, false⟩ = 100_000 := by decide
example : stampDuty ⟨.contractOfWork, some 500_000_000, false⟩ = 100_000 := by decide
example : stampDuty ⟨.contractOfWork, some 500_000_001, false⟩ = 200_000 := by decide
example : stampDuty ⟨.contractOfWork, some 1_000_000_000, false⟩ = 200_000 := by decide
example : stampDuty ⟨.contractOfWork, some 1_000_000_001, false⟩ = 400_000 := by decide
example : stampDuty ⟨.contractOfWork, some 5_000_000_000, false⟩ = 400_000 := by decide
example : stampDuty ⟨.contractOfWork, some 5_000_000_001, false⟩ = 600_000 := by decide

-- 第二号: 記載金額一万円未満は非課税
example : stampDuty ⟨.contractOfWork, some 0, false⟩ = 0 := by decide
example : stampDuty ⟨.contractOfWork, some 9_999, false⟩ = 0 := by decide
example : stampDuty ⟨.contractOfWork, none, false⟩ = 200 := by decide

-- 第三号文書: every band edge
example : stampDuty ⟨.note, some 100_000, false⟩ = 200 := by decide
example : stampDuty ⟨.note, some 1_000_000, false⟩ = 200 := by decide
example : stampDuty ⟨.note, some 1_000_001, false⟩ = 400 := by decide
example : stampDuty ⟨.note, some 2_000_000, false⟩ = 400 := by decide
example : stampDuty ⟨.note, some 2_000_001, false⟩ = 600 := by decide
example : stampDuty ⟨.note, some 3_000_000, false⟩ = 600 := by decide
example : stampDuty ⟨.note, some 3_000_001, false⟩ = 1_000 := by decide
example : stampDuty ⟨.note, some 5_000_000, false⟩ = 1_000 := by decide
example : stampDuty ⟨.note, some 5_000_001, false⟩ = 2_000 := by decide
example : stampDuty ⟨.note, some 10_000_000, false⟩ = 2_000 := by decide
example : stampDuty ⟨.note, some 10_000_001, false⟩ = 4_000 := by decide
example : stampDuty ⟨.note, some 20_000_000, false⟩ = 4_000 := by decide
example : stampDuty ⟨.note, some 20_000_001, false⟩ = 6_000 := by decide
example : stampDuty ⟨.note, some 30_000_000, false⟩ = 6_000 := by decide
example : stampDuty ⟨.note, some 30_000_001, false⟩ = 10_000 := by decide
example : stampDuty ⟨.note, some 50_000_000, false⟩ = 10_000 := by decide
example : stampDuty ⟨.note, some 50_000_001, false⟩ = 20_000 := by decide
example : stampDuty ⟨.note, some 100_000_000, false⟩ = 20_000 := by decide
example : stampDuty ⟨.note, some 100_000_001, false⟩ = 40_000 := by decide
example : stampDuty ⟨.note, some 200_000_000, false⟩ = 40_000 := by decide
example : stampDuty ⟨.note, some 200_000_001, false⟩ = 60_000 := by decide
example : stampDuty ⟨.note, some 300_000_000, false⟩ = 60_000 := by decide
example : stampDuty ⟨.note, some 300_000_001, false⟩ = 100_000 := by decide
example : stampDuty ⟨.note, some 500_000_000, false⟩ = 100_000 := by decide
example : stampDuty ⟨.note, some 500_000_001, false⟩ = 150_000 := by decide
example : stampDuty ⟨.note, some 1_000_000_000, false⟩ = 150_000 := by decide
example : stampDuty ⟨.note, some 1_000_000_001, false⟩ = 200_000 := by decide

-- 第三号: 手形金額十万円未満は非課税
example : stampDuty ⟨.note, some 0, false⟩ = 0 := by decide
example : stampDuty ⟨.note, some 99_999, false⟩ = 0 := by decide
example : stampDuty ⟨.note, some 100_000, false⟩ = 200 := by decide

-- 第三号: 手形金額の記載のない手形は非課税
example : stampDuty ⟨.note, none, false⟩ = 0 := by decide

-- 第三号２: 一覧払いの手形等は一通につき 200 円
example : stampDuty ⟨.note, some 100_000_000, true⟩ = 200 := by decide
example : stampDuty ⟨.note, none, true⟩ = 200 := by decide
example : stampDuty ⟨.note, some 5_000_000, true⟩ = 200 := by decide

-- isTaxableDocument smoke checks
example : isTaxableDocument ⟨.contract, some 10_000, false⟩ = true := by decide
example : isTaxableDocument ⟨.contract, some 9_999, false⟩ = false := by decide
example : isTaxableDocument ⟨.contract, none, false⟩ = true := by decide
example : isTaxableDocument ⟨.contractOfWork, some 10_000, false⟩ = true := by decide
example : isTaxableDocument ⟨.note, some 100_000, false⟩ = true := by decide
example : isTaxableDocument ⟨.note, some 99_999, false⟩ = false := by decide
example : isTaxableDocument ⟨.note, none, false⟩ = false := by decide
example : isTaxableDocument ⟨.note, none, true⟩ = true := by decide
example : isTaxableDocument ⟨.note, some 50_000_000, true⟩ = true := by decide

-- Taxable-document interplay: 非課税文書は課税しない ⇒ duty 0 と一致
example : isTaxableDocument ⟨.note, some 50_000, false⟩ = false := by decide
example : stampDuty ⟨.note, some 50_000, false⟩ = 0 := by decide

end JapanTaxLaw
