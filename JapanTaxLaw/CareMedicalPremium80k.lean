import JapanTaxLaw.TaxFinance

/-!
# CareMedicalPremium80k — 所得税法 art. 76（介護医療保険料の金額の合計額 八万円超）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その年中に支払つた介護医療保険料の金額の合計額が八万円を超える場合」

Scoped claim: only the 介護医療保険料の金額の合計額 八万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CareMedicalPremium80k

def careMedicalFloor80k : Nat := 80000

def exceedsCareMedical80k (x : Nat) : Bool :=
  decide (careMedicalFloor80k < x)

theorem threshold_value : careMedicalFloor80k = 80000 := rfl

end JapanTaxLaw.CareMedicalPremium80k
