import JapanTaxLaw.InheritanceApportionment

/-!
# InheritanceApportionment spec — independent restatement of
  相続税法 art. 17（各相続人等の相続税額）

Sources (pinned; identical to InheritanceApportionment.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 17 — 相続又は遺贈により財産を取得した者に係る相続税額は、
    その被相続人から相続又は遺贈により財産を取得したすべての者に係る相続税の総額に、
    それぞれこれらの事由により財産を取得した者に係る相続税の課税価格が
    当該財産を取得したすべての者に係る課税価格の合計額のうちに占める割合を乗じて算出した金額とする
from the statutory text itself. The art. 17 text contains no numeric literal —
all bindings here are caller-supplied (art. 16's total tax amount, per-heir taxable
values, their sum). No rate table exists at art. 17 (it lives in art. 16,
`InheritanceTax.lean`).

Scope boundary identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 17 proportional share (totalTax × heirTaxable / totalTaxable, floor once). -/
def specHeirApportionedTax (totalTax heirTaxable totalTaxable : Money) : Money :=
  if totalTaxable = 0 then 0 else totalTax * heirTaxable / totalTaxable

-- ==== points, all kernel-decided ====
example : specHeirApportionedTax 1_000_000 100_000 4_000_000 = 25_000 := by decide
example : specHeirApportionedTax 2_000_000 500_000 4_000_000 = 250_000 := by decide
example : specHeirApportionedTax 2_000_000 1_500_000 4_000_000 = 750_000 := by decide
example : specHeirApportionedTax 0 100_000 4_000_000 = 0 := by decide
example : specHeirApportionedTax 1_000_000 0 4_000_000 = 0 := by decide
example : specHeirApportionedTax 1_000_000 4_000_000 4_000_000 = 1_000_000 := by decide
example : specHeirApportionedTax 1_000_000 100_000 0 = 0 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeApportionmentPoints : Bool :=
  let samples : List (Money × Money × Money) :=
    [ (0, 0, 0), (0, 1, 1), (0, 3, 4), (1_000_000, 0, 4_000_000),
      (1_000_000, 1_000_000, 4_000_000), (1_000_000, 4_000_000, 4_000_000),
      (5_000_000, 2_500_000, 9_000_000), (12_000_000, 1_500_000, 8_000_000) ]
  samples.all fun (totalTax, heirTaxable, totalTaxable) =>
    specHeirApportionedTax totalTax heirTaxable totalTaxable ==
      heirApportionedTax totalTax heirTaxable totalTaxable

example : agreeApportionmentPoints = true := by decide

end JapanTaxLaw
