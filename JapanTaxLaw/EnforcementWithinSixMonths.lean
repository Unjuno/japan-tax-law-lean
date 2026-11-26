import JapanTaxLaw.TaxFinance

/-!
# EnforcementWithinSixMonths — 地方税法 art. 1（公布の日から六月を超えない範囲内で施行）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「ただし、附則第二十一条から第五十五条までの規定は、公布の日から起算して六月を超えない範囲内において政令で定める日から施行する。」

Scoped claim: only the 公布の日から六月を超えない範囲内で施行 numeric/temporal condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.EnforcementWithinSixMonths

def limit : Nat := 6

def within (x : Nat) : Bool := decide (x <= limit)

theorem limit_value : limit = 6 := by rfl

end JapanTaxLaw.EnforcementWithinSixMonths
