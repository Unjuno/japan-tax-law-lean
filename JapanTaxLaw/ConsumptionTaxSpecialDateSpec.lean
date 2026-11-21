import JapanTaxLaw.ConsumptionTaxSpecialDate

/-!
# ConsumptionTaxSpecialDate spec — 令和3年1月31日 の独立整数定式
Sources (pinned): law 502CO0000000160, revision 502CO0000000160_20260401_508CO0000000104.
Independent restatement: 令和3年=2021、月1、日31。
-/

namespace JapanTaxLaw.ConsumptionTaxSpecialDate

def specYear : Nat := 2021
def specMonth : Nat := 1
def specDay : Nat := 31

example : specYear = 2021 := by decide
example : specMonth = 1 := by decide
example : specDay = 31 := by decide

def agreeConsumptionTaxSpecialDate : Bool :=
  westernYear == specYear && month == specMonth && day == specDay

example : agreeConsumptionTaxSpecialDate = true := by decide

end JapanTaxLaw.ConsumptionTaxSpecialDate
