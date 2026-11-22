import JapanTaxLaw.TaxFinance

/-
# CouncilMemberCap30 — 税制調査会組織規則 第一条（委員三十人以内）

Sources (pinned):
  Law id: 425CO0000000025 (税制調査会組織規則)
  Revision: 425CO0000000025_20221202_504CO0000000367
  Raw snapshot: data/raw/425CO0000000025_20221202_504CO0000000367.law.json
  sha256: 8c164ab067608887627e8a5aecbe9784331597dbf0def96e76d0058ffe7b13d5
  Article Num: 1.

Pinned 原文逐語 (scoped Article 1, 一字一句改変なし):
  「税制調査会（以下「調査会」という。）は、委員三十人以内で組織する。」

Variable contract:
  n : Nat = 委員の数 (the number of council members, counted in 人);
  memberCap : Nat = 三十 = 30 (the statutory maximum);
  withinMemberCap n = decide (n <= memberCap). 三十人以内 = n <= 30,
  INCLUSIVE at 30: exactly 30 members is permitted, 31 is not.
  This is a COUNT CAP (a maximum), distinct from any >= floor.

Scope: only the explicit numeric membership cap in art. 1. Appointments,
terms, officers, meetings and every other provision are NOT MODELLED.
Every proof is `rfl` / `by decide` on concrete values.
-/

namespace JapanTaxLaw.CouncilMemberCap30

/-- 三十人: the statutory membership cap (INCLUSIVE maximum). -/
def memberCap : Nat := 30

/-- 委員三十人以内: decidable count-cap test on the number of members. -/
def withinMemberCap (n : Nat) : Bool :=
  decide (n <= memberCap)

theorem memberCap_value : memberCap = 30 := rfl

theorem within_0 : withinMemberCap 0 = true := by decide
theorem within_1 : withinMemberCap 1 = true := by decide
theorem within_29 : withinMemberCap 29 = true := by decide
theorem within_30 : withinMemberCap 30 = true := by decide
theorem within_31 : withinMemberCap 31 = false := by decide
theorem within_50 : withinMemberCap 50 = false := by decide

end JapanTaxLaw.CouncilMemberCap30
