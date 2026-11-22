import JapanTaxLaw.AntiDumpingRate952

/-!
# AntiDumpingRate952 spec — 不当廉売関税率 95.2% の独立整数定式
Sources (pinned): law 507CO0000000095, revision 507CO0000000095_20250703_507CO0000000240.
Independent restatement: 95.2%=952/1000, 税額=価格×952÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate952

def specDuty (v : Nat) : Nat := v * 952 / 1000

example : specDuty 1000 = 952 := by decide
example : specDuty 10000 = 9520 := by decide

def agreeAntiDumpingRate952 : Bool :=
  [0, 1, 100, 1000, 10000].all fun v => dutyYen v == specDuty v

example : agreeAntiDumpingRate952 = true := by decide

end JapanTaxLaw.AntiDumpingRate952
