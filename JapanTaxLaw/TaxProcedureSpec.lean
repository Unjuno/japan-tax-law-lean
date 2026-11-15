import JapanTaxLaw.TaxProcedure

/-!
# TaxProcedure specification — independent restatement of 国税通則法 Act art. 2 item 10

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 2 item 10, verbatim from the pinned text:
  強制換価手続 滞納処分（その例による処分を含む。）、強制執行、担保権の実行としての競売、
  企業担保権の実行手続、企業価値担保権の実行手続及び破産手続をいう。

This module restates the enumeration independently of the implementation in
TaxProcedure.lean. The spec fixes WHICH are the compulsory realization
procedures; the implementation provides the closed enum type.

Axiom discipline: all theorems are proved by `cases`/`decide` over
DecidableEq/DecidablePred instances. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace TaxProcedureSpec

/-- Restatement of Act art. 2 item 10's enumeration. -/
inductive CompulsoryRealizationJudgment : CompulsoryRealizationProcedure → Prop where
  | delinquencyDisposition : CompulsoryRealizationJudgment .delinquencyDisposition
  | compulsoryExecution : CompulsoryRealizationJudgment .compulsoryExecution
  | auctionForSecurityExecution : CompulsoryRealizationJudgment .auctionForSecurityExecution
  | executionProcedureCorporateSecurity : CompulsoryRealizationJudgment .executionProcedureCorporateSecurity
  | executionProcedureEnterpriseValueSecurity : CompulsoryRealizationJudgment .executionProcedureEnterpriseValueSecurity
  | bankruptcyProceedings : CompulsoryRealizationJudgment .bankruptcyProceedings

/-- Spec ↔ impl: every constructor is accepted by the judgment. -/
theorem spec_sound (p : CompulsoryRealizationProcedure)
    (h : CompulsoryRealizationJudgment p) : p ∈ CompulsoryRealizationProcedure.all := by
  cases h <;> decide

/-- Spec ↔ impl: every enumerated kind is judged a compulsory realization procedure. -/
theorem spec_complete (p : CompulsoryRealizationProcedure)
    (h : p ∈ CompulsoryRealizationProcedure.all) : CompulsoryRealizationJudgment p := by
  cases p <;> simp [CompulsoryRealizationProcedure.all] at h
  · exact CompulsoryRealizationJudgment.delinquencyDisposition
  · exact CompulsoryRealizationJudgment.compulsoryExecution
  · exact CompulsoryRealizationJudgment.auctionForSecurityExecution
  · exact CompulsoryRealizationJudgment.executionProcedureCorporateSecurity
  · exact CompulsoryRealizationJudgment.executionProcedureEnterpriseValueSecurity
  · exact CompulsoryRealizationJudgment.bankruptcyProceedings

end TaxProcedureSpec

open TaxProcedureSpec

/-- The spec enumeration, judged by the implementation's `all`, matches the statute exactly. -/
theorem spec_count : CompulsoryRealizationProcedure.all.length = 6 := by decide

end JapanTaxLaw
