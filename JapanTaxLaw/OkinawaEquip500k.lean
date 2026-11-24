import JapanTaxLaw.TaxFinance

/-!
# OkinawaEquip500k — 沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令 art. 5（取得価額の合計額 五十万円超）

Sources (pinned):

  Law id: 414M60000008042
  Revision: 414M60000008042_20250401_507M60000008028
  Raw snapshot: data/raw/414M60000008042_20250401_507M60000008028.law.json

Pinned 原文: 「イに掲げるもののほか、機械及び装置並びに器具及び備品で、これらの取得価額の合計額が五十万円を超えるもの」

Scoped claim: only the 取得価額の合計額 五十万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OkinawaEquip500k

def equipFloor500k : Nat := 500000

def exceedsEquip500k (x : Nat) : Bool :=
  decide (equipFloor500k < x)

theorem threshold_value : equipFloor500k = 500000 := rfl

end JapanTaxLaw.OkinawaEquip500k
