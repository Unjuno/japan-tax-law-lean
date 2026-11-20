import JapanTaxLaw.TaxFinance

/-
# CombinedRegistrationRequest — 昭和二十二年政令第百九号 第三条

Pinned source:
  Law id: 322CO0000000109
  Revision: 322CO0000000109_19470627_000000000000000
  Raw snapshot: data/raw/322CO0000000109_19470627_000000000000000.law.json
  sha256: 9ff39f03e58b315d04fbb65246dd5a4e64cf8c6a428eae84c53bb49c530816ec
  Statutory article: 第三条 (art. 3)

原文逐語（pinned, 一字一句改変なし）:
  「前二条の場合において同一の登記所の管轄内に在る二箇以上の不動産につき登記を嘱託するには、登記原因又は登記の目的が同一でなくても、同一の嘱託書でその登記を嘱託することができる。」

Scope — ONLY the explicit condition is modelled: a combined registration
request is permitted iff (a) the properties lie under the SAME registry office
and (b) the number of properties is at least 二箇 (= 2). The registration reason
/ purpose need NOT be the same: it is deliberately NOT a parameter, i.e. it is
irrelevant to this condition. Nothing else is modelled — not the 前二条 cases,
not the 嘱託 procedure, not registry-office jurisdiction rules.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CombinedRegistrationRequest

/-- The art.3 condition: 同一の登記所 且つ 二箇以上 (2 <= propertyCount). -/
def canCombineRequest (sameOffice : Bool) (propertyCount : Nat) : Bool :=
  sameOffice && 2 <= propertyCount

/-- A different registry office forbids combining, whatever the property count. -/
theorem different_office_forbids (propertyCount : Nat) :
    canCombineRequest false propertyCount = false := by
  simp [canCombineRequest]

/-- Same office with at least 二箇 properties permits combining. -/
theorem same_office_at_least_two (propertyCount : Nat) (h : 2 <= propertyCount) :
    canCombineRequest true propertyCount = true := by
  simp [canCombineRequest, h]

end JapanTaxLaw.CombinedRegistrationRequest
