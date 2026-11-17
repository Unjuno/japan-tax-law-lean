import JapanTaxLaw.RefundInterest

/-!
# RefundInterest spec — 国税通則法 art. 58（還付加算金）

Sources (pinned; identical to RefundInterest.lean):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of:
  * 利率 年7.3% = (73, 1000) — 整数の組で独立定式。
  * art. 60 低率と同一値。
  * 2項一の差押控除期間 = 7日。

日割り計算・還付加算金の金額は NOT MODELLED（pinned 条文に分母の明示なし）。
Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 還付加算金の利率（独立定式）。 -/
def specRefundInterestRate : Nat × Nat := (73, 1000)

/-- Spec: 差押控除期間（独立定式）。 -/
def specAttachmentExclusionDays : Nat := 7

-- ==== points (kernel-decided) ====

example : specRefundInterestRate = (73, 1000) := by decide
example : specAttachmentExclusionDays = 7 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRefundInterest : Bool :=
  refundInterestRate.numDen == specRefundInterestRate
    && (attachmentExclusionDays == specAttachmentExclusionDays)

example : agreeRefundInterest = true := by decide

end JapanTaxLaw
