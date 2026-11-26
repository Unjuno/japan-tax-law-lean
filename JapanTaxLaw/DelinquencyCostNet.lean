import JapanTaxLaw.TaxFinance

/-!
# DelinquencyCostNet — 国税収納金整理資金施行令 art.22(1) 滞納処分費残額（bounded slice）

Sources (pinned):
  Law id: 329CO0000000051
  Revision: 329CO0000000051_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000051_20260401_508CO0000000085.law.json
  Normative id: NORM|430e94d648017dcbea837b0f4a3edd6e3c20e5d00a1451c39d898a61bbb9cc61
  Article Num 22, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「滞納処分費の収納済額及び滞納処分費に係る返納金（過誤納金の還付金等に係るものに限る。）の収納済額の合計額から滞納処分費に係る支払決定済額を控除した金額は、一般会計の雑収入とする。」

Computation（単位: 円。入力は収納済額・返納金収納済額・支払決定済額）:
  total = collected + refundCollected
  netMiscIncome = if paid <= total then total - paid else 0

Scope / NOT MODELLED:
  - 過誤納金還付金等の認定、一般会計の整理・帳簿処理は NOT MODELLED。
  - 本モデルは合計額から支払決定済額を控除する計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.DelinquencyCostNet

/-- 滞納処分費の収納済額と返納金収納済額の合計から支払決定済額を控除した雑収入。 -/
def netMiscIncome (collected : Nat) (refundCollected : Nat) (paid : Nat) : Nat :=
  let total := collected + refundCollected
  if paid <= total then total - paid else 0

example : netMiscIncome 0 0 0 = 0 := by decide
example : netMiscIncome 100 40 60 = 80 := by decide
example : netMiscIncome 100 40 140 = 0 := by decide
example : netMiscIncome 100 40 200 = 0 := by decide

end JapanTaxLaw.DelinquencyCostNet
