import JapanTaxLaw.TaxFinance

/-!
# Employee300 — 租税特別措置法 art. 87（常時使用従業員 三百人超）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「その年度の前年度の末日において常時使用する従業員の数が三百人を超える個人」

Scoped claim: only the 常時使用従業員 三百人超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Employee300

def employeeFloor300 : Nat := 300

def exceedsEmployees300 (x : Nat) : Bool :=
  decide (employeeFloor300 < x)

theorem threshold_value : employeeFloor300 = 300 := rfl

end JapanTaxLaw.Employee300
