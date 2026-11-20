import JapanTaxLaw.TransitionalTariffRate

/-!
# TransitionalTariffRate spec — 関税定率法改正法 附則 art.2 の独立整数定式
Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
Independent restatement: 率B = 1,400 円/L、率D = 139 円/L、関税額 = リットル × 率。
-/

namespace JapanTaxLaw.TransitionalTariffRate

def specTariff (liters rate : Nat) : Nat := liters * rate

example : specTariff 10 1_400 = 14_000 := by decide
example : specTariff 1 139 = 139 := by decide

def agreeTransitionalTariffRate : Bool :=
  [0, 1, 10].all fun l => tariff l rateB == specTariff l 1_400 && tariff l rateD == specTariff l 139
example : agreeTransitionalTariffRate = true := by decide

end JapanTaxLaw.TransitionalTariffRate
