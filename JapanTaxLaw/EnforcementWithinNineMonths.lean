import JapanTaxLaw.TaxFinance

/-!
# EnforcementWithinNineMonths — 地方税法 art. 1（公布の日から九月を超えない範囲内で施行）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「ただし、附則第十三条から第二十四条までの規定は、公布の日から起算して九月を超えない範囲内において政令で定める日から施行する。」

Scoped claim: only the 公布の日から九月を超えない範囲内で施行 numeric/temporal condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.EnforcementWithinNineMonths

def limit : Nat := 9

def within (x : Nat) : Bool := decide (x <= limit)

theorem limit_value : limit = 9 := by rfl

end JapanTaxLaw.EnforcementWithinNineMonths
