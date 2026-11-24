import JapanTaxLaw.TaxFinance

/-
# DelegatedEnforcement3M — 公布後三月以内の政令施行日（委任＋期間上限）

Sources (pinned):
  Law id: 422AC1000000050
  Revision: 422AC1000000050_20110701_423AC0000000016
  Raw snapshot: data/raw/422AC1000000050_20110701_423AC0000000016.law.json
  sha256: 1b7e343b06e305a7e494f501aac926f9a2153a35ad06fcf8ee0dca7c64da17ab
  Article Num: 1 (附則第一条 — enforcement date).

Pinned 原文逐語 (scoped Article 1, 一字一句改変なし):
  「この法律は、公布の日から起算して三月を超えない範囲内において政令で定める日から施行する。」

Norm kind: TEMPORAL DELEGATION — a statutory upper bound (三月 = 3 months)
  on a date that is itself delegated to cabinet order. The law takes effect
  on the date fixed by cabinet order, provided that date is within three
  months of promulgation.

Variable contract:
  monthsAfterPromulgation : Nat = 公布の日からの経過月数 (unit: 月);
  windowMonths : Nat = 三 = 3 (the statutory upper bound, INCLUSIVE);
  withinWindow monthsAfterPromulgation
    = decide (monthsAfterPromulgation <= windowMonths) : Bool —
      true when the cabinet-order enforcement date lies within the window.
  三月を超えない = n <= 3, INCLUSIVE at 3: month 3 is permitted, month 4 is not.

NOT MODELLED: the exact delegated date is NOT MODELLED. It is
  caller-established (fixed by cabinet order); only the statutory upper
  bound and its decidable membership test are modelled here.

Scope: only art. 1's enforcement-date window. Other provisions, the content
  of the cabinet order, and legal correctness are NOT MODELLED.
  Every proof is `rfl` / `by decide` on concrete values.
-/

namespace JapanTaxLaw.DelegatedEnforcement3M

/-- 三月: the statutory window upper bound (INCLUSIVE maximum). -/
def windowMonths : Nat := 3

/-- 三月を超えない範囲内: decidable window test on elapsed months. -/
def withinWindow (monthsAfterPromulgation : Nat) : Bool :=
  decide (monthsAfterPromulgation <= windowMonths)

theorem windowMonths_value : windowMonths = 3 := rfl

theorem within_0 : withinWindow 0 = true := by decide
theorem within_2 : withinWindow 2 = true := by decide
theorem within_3 : withinWindow 3 = true := by decide
theorem within_4 : withinWindow 4 = false := by decide

end JapanTaxLaw.DelegatedEnforcement3M
