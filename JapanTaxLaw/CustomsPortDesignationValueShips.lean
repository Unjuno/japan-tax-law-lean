import JapanTaxLaw.TaxFinance

/-!
# CustomsPortDesignationValueShips — 関税法施行令 art. 1（貨物価額五千万円超 かつ 入出港隻数十一隻超）

Sources (pinned):

  Law id: 329CO0000000150
  Revision: 329CO0000000150_20260701_508CO0000000217
  Raw snapshot: data/raw/329CO0000000150_20260701_508CO0000000217.law.json

Pinned 原文: 「一年を通じて当該開港において輸出され、又は輸入された貨物の価額の合計額が五千万円を超え、かつ、外国貿易船の入港隻数及び出港隻数の合計数が十一隻を超えることが引き続き二年なかつたとき。」

Scoped claim: only the 貨物価額五千万円超 かつ 入出港隻数十一隻超 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsPortDesignationValueShips

def valueFloor : Nat := 50000000
def shipFloor : Nat := 11

def bothExceeded (value ships : Nat) : Bool :=
  decide (valueFloor < value ∧ shipFloor < ships)

theorem constants : valueFloor = 50000000 ∧ shipFloor = 11 := by
  constructor <;> rfl

end JapanTaxLaw.CustomsPortDesignationValueShips
