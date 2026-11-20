import JapanTaxLaw.ProvisionalTariffRate

/-!
# ProvisionalTariffRate spec — 関税暫定措置法 附則 art.2-2 の独立整数定式
Sources (pinned): law 335AC0000000036, revision 335AC0000000036_20260401_508AC0000000005.
Independent restatement: 率 1D=1600, 2B=1300, 3G=1600, 4D=137 円/L、関税額 = リットル×率。
-/

namespace JapanTaxLaw.ProvisionalTariffRate

def specTariff (liters rate : Nat) : Nat := liters * rate

example : specTariff 10 1_600 = 16_000 := by decide
example : specTariff 1 137 = 137 := by decide

def agreeProvisionalTariffRate : Bool :=
  [0, 1, 10].all fun l =>
    tariff l rate1D == specTariff l 1_600 &&
    tariff l rate2B == specTariff l 1_300 &&
    tariff l rate3G == specTariff l 1_600 &&
    tariff l rate4D == specTariff l 137
example : agreeProvisionalTariffRate = true := by decide

end JapanTaxLaw.ProvisionalTariffRate
