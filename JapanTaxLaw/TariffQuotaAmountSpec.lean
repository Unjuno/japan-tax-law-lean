import JapanTaxLaw.TariffQuotaAmount

/-!
# TariffQuotaAmount spec — 関税割当数量 8000トン の独立整数定式
Sources (pinned): law 417M60000200012, revision 417M60000200012_20260401_507M60000200056.
Independent restatement: 割当数量 = 8000 トン。
-/

namespace JapanTaxLaw.TariffQuotaAmount

def specQuota : Nat := 8000

example : specQuota = 8_000 := by decide

def agreeTariffQuotaAmount : Bool := quotaTons == specQuota

example : agreeTariffQuotaAmount = true := by decide

end JapanTaxLaw.TariffQuotaAmount
