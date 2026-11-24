import JapanTaxLaw.TaxFinance

/-!
# ForestArea650Ha — 租税特別措置法施行規則 art. 23_8_6（山林の面積 六百五十ヘクタール超）

Sources (pinned):

  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json

Pinned 原文: 「認定起算日（当該認定起算日における特定森林経営計画が定められている区域内に存する山林の面積が六百五十ヘクタールを超える場合にあつては、当初認定起算日）」

Scoped claim: only the 山林の面積 六百五十ヘクタール超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ForestArea650Ha

def forestFloor650 : Nat := 650

def exceedsForest650 (x : Nat) : Bool :=
  decide (forestFloor650 < x)

theorem threshold_value : forestFloor650 = 650 := rfl

end JapanTaxLaw.ForestArea650Ha
