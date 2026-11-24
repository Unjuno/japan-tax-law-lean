import JapanTaxLaw.TaxFinance

/-
# DelegatedEnforcement6M — 公布後六月以内の政令施行日（委任＋期間上限）

Sources (pinned):
  Law id: 410AC0000000025
  Revision: 410AC0000000025_20250401_507AC0000000013
  Raw snapshot: data/raw/410AC0000000025_20250401_507AC0000000013.law.json
  sha256: 81885682cdf2beae20a92d0c6f97674f0c9017909346f41127f574a99ada4ba1
  Article Num: 1 (附則第一条 — enforcement date, 「施行日」 defined there).

Pinned 原文逐語 (scoped Article 1, 一字一句改変なし):
  「この法律は、公布の日から起算して六月を超えない範囲内において政令で定める日（以下「施行日」という。）から施行する。」

Norm kind: TEMPORAL DELEGATION — a statutory upper bound (六月 = 6 months)
  on a date that is itself delegated to cabinet order. The law takes effect
  on the date fixed by cabinet order (called 施行日), provided that date is
  within six months of promulgation.

Variable contract:
  monthsAfterPromulgation : Nat = 公布の日からの経過月数 (unit: 月);
  windowMonths : Nat = 六 = 6 (the statutory upper bound, INCLUSIVE);
  withinWindow monthsAfterPromulgation
    = decide (monthsAfterPromulgation <= windowMonths) : Bool —
      true when the cabinet-order enforcement date lies within the window.
  六月を超えない = n <= 6, INCLUSIVE at 6: month 6 is permitted, month 7 is not.

NOT MODELLED: the exact delegated date (the 施行日 fixed by cabinet order)
  is NOT MODELLED. It is caller-established; only the statutory upper bound
  and its decidable membership test are modelled here.

Scope: only art. 1's enforcement-date window. Other provisions, the content
  of the cabinet order, and legal correctness are NOT MODELLED.
  Every proof is `rfl` / `by decide` on concrete values.
-/

namespace JapanTaxLaw.DelegatedEnforcement6M

/-- 六月: the statutory window upper bound (INCLUSIVE maximum). -/
def windowMonths : Nat := 6

/-- 六月を超えない範囲内: decidable window test on elapsed months. -/
def withinWindow (monthsAfterPromulgation : Nat) : Bool :=
  decide (monthsAfterPromulgation <= windowMonths)

theorem windowMonths_value : windowMonths = 6 := rfl

theorem within_0 : withinWindow 0 = true := by decide
theorem within_5 : withinWindow 5 = true := by decide
theorem within_6 : withinWindow 6 = true := by decide
theorem within_7 : withinWindow 7 = false := by decide

end JapanTaxLaw.DelegatedEnforcement6M
