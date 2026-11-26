import JapanTaxLaw.TaxFinance

/-!
# LocalCorpCapital10MEmployees50Plus — 地方税法 art. 312（資本金千万円以下 かつ 従業者五十人超）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」

Scoped claim: only the 資本金千万円以下 かつ 従業者五十人超 numeric classification; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCorpCapital10MEmployees50Plus

def capitalCeiling : Nat := 10000000
def employeeFloor : Nat := 50

def qualified (capital employees : Nat) : Bool :=
  decide (capital <= capitalCeiling ∧ employeeFloor < employees)

theorem constants : capitalCeiling = 10000000 ∧ employeeFloor = 50 := by
  constructor <;> rfl

end JapanTaxLaw.LocalCorpCapital10MEmployees50Plus
