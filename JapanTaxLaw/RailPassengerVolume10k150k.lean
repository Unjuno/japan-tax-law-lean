import JapanTaxLaw.TaxFinance

/-!
# RailPassengerVolume10k150k — 地方税法施行規則 art. 6（一日当たり片道断面輸送量 一万人以上十五万人未満）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「一日当たりの片道断面輸送量が一万人以上十五万人未満の線区（旅客鉄道株式会社及び日本貨物鉄道株式会社に関する法律の一部を改正する法律（平成十三年法律第六十一号）附則第二条第一項第一号に掲げる者が事業の用に供する線区を除く。次号において同じ。）」

Scoped claim: only the 一日当たり片道断面輸送量 一万人以上十五万人未満 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.RailPassengerVolume10k150k

def lowerBound : Nat := 10000
def upperBound : Nat := 150000

def inBand (x : Nat) : Bool := decide (lowerBound <= x ∧ x < upperBound)

theorem bounds_value : lowerBound = 10000 ∧ upperBound = 150000 := by
  constructor <;> rfl

end JapanTaxLaw.RailPassengerVolume10k150k
