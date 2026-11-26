import JapanTaxLaw.TaxFinance

/-!
# IndustrialEquipmentCost32M — 地方税法施行令 art. 54_13（工業生産設備の減価償却資産取得価額 三千二百万円超）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「一の工業生産設備で、これを構成する減価償却資産の取得価額の合計額が三千二百万円を超えるもの」

Scoped claim: only the 工業生産設備の減価償却資産取得価額 三千二百万円超 numeric/temporal condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.IndustrialEquipmentCost32M

def limit : Nat := 32000000

def triggered (x : Nat) : Bool := decide (limit < x)

theorem limit_value : limit = 32000000 := by rfl

end JapanTaxLaw.IndustrialEquipmentCost32M
