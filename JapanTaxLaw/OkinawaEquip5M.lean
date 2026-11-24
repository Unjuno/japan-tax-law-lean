import JapanTaxLaw.TaxFinance

/-!
# OkinawaEquip5M — 沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令 art. 3（取得価額の合計額 五百万円超）

Sources (pinned):

  Law id: 414M60000008042
  Revision: 414M60000008042_20250401_507M60000008028
  Raw snapshot: data/raw/414M60000008042_20250401_507M60000008028.law.json

Pinned 原文: 「イに掲げるもののほか、機械及び装置並びに器具及び備品で、これらの取得価額の合計額が五百万円を超えるもの」

Scoped claim: only the 取得価額の合計額 五百万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OkinawaEquip5M

def equipFloor5M : Nat := 5000000

def exceedsEquip5M (x : Nat) : Bool :=
  decide (equipFloor5M < x)

theorem threshold_value : equipFloor5M = 5000000 := rfl

end JapanTaxLaw.OkinawaEquip5M
