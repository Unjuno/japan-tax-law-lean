import JapanTaxLaw.TaxFinance

/-!
# SalaryTotal300k — 地方税法 317_6（給与の金額の総額 三十万円以下）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「ただし、その給与の支払を受けなくなつた日の属する年に当該給与の支払をする者から支払を受けた給与の金額の総額が三十万円以下である者については、この限りでない。」

Scoped claim: only the 給与の金額の総額 三十万円以下; other conditions are caller-established.
-/

namespace JapanTaxLaw.SalaryTotal300k

def salaryTotalCapYen : Nat := 300000

def withinSalaryTotal (x : Nat) : Bool :=
  decide (x <= salaryTotalCapYen)

theorem threshold_value : salaryTotalCapYen = 300000 := rfl

end JapanTaxLaw.SalaryTotal300k
