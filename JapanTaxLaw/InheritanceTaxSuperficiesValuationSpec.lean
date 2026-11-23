/-\!
# InheritanceTaxSuperficiesValuationSpec — 独立形式仕様

相続税法第二十三条から独立。実装を import しない。
-/
namespace JapanTaxLaw.InheritanceTaxSuperficiesValuationSpec

def rateForPeriodSpec (years : Nat) (indefinite : Bool) : Nat :=
  if indefinite then 40
  else if years <= 10 then 5
  else if years <= 15 then 10
  else if years <= 20 then 20
  else if years <= 25 then 30
  else if years <= 30 then 40
  else if years <= 35 then 50
  else if years <= 40 then 60
  else if years <= 45 then 70
  else if years <= 50 then 80
  else 90

end JapanTaxLaw.InheritanceTaxSuperficiesValuationSpec
