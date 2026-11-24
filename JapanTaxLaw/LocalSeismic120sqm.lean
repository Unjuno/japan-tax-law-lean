import JapanTaxLaw.TaxFinance

/-!
# LocalSeismic120sqm — 地方税法施行令 art. 12（耐震基準適合住宅の床面積 百二十平方メートル超）

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

Pinned 原文: 「共同住宅等である特定耐震基準適合住宅以外の特定耐震基準適合住宅にあつては、人の居住の用に供する部分の床面積が百二十平方メートルを超えるもの」

Scoped claim: only the 耐震基準適合住宅の床面積 百二十平方メートル超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalSeismic120sqm

def seismicFloor120 : Nat := 120

def exceedsSeismic120 (x : Nat) : Bool :=
  decide (seismicFloor120 < x)

theorem threshold_value : seismicFloor120 = 120 := rfl

end JapanTaxLaw.LocalSeismic120sqm
