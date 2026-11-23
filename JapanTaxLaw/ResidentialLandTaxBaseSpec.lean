/-\!
# ResidentialLandTaxBaseSpec — 独立形式仕様

地方税法第三百四十九条の三の二から独立。実装を import しない。
-/
namespace JapanTaxLaw.ResidentialLandTaxBaseSpec

def smallScaleSpec (area dwellings : Nat) : Bool :=
  if area <= 200 then true else if dwellings == 0 then false else (area / dwellings) <= 200
def taxBaseRateDenominatorSpec (small : Bool) : Nat := if small then 6 else 3
def taxBaseAmountSpec (price : Nat) (small : Bool) : Nat := price / taxBaseRateDenominatorSpec small

end JapanTaxLaw.ResidentialLandTaxBaseSpec
