import JapanTaxLaw.TaxFinance

/-!
# StationDailyUsers100k — 地方税法施行令 art. 11（一日当たり平均利用者数 十万人以上）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「当該事業の開始の日の属する年度の前年度の一日当たりの平均的な利用者の人数が十万人以上である駅若しくは停留場（以下この号において「特定駅等」という。）又は特定駅等からの距離が百キロメートル以内の駅若しくは停留場において実施される事業」

Scoped claim: only the 一日当たり平均利用者数 十万人以上 numeric/temporal condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.StationDailyUsers100k

def limit : Nat := 100000

def qualified (x : Nat) : Bool := decide (limit <= x)

theorem limit_value : limit = 100000 := by rfl

end JapanTaxLaw.StationDailyUsers100k
