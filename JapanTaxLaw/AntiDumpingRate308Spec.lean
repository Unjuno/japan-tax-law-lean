import JapanTaxLaw.AntiDumpingRate308

/-!
# AntiDumpingRate308 spec — 不当廉売関税率 30.8% の独立整数定式
Sources (pinned): law 503CO0000000065, revision 503CO0000000065_20260709_508CO0000000223.
Independent restatement: 30.8%=308/1000, 税額=価格×308÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate308

def specDuty (v : Nat) : Nat := v * 308 / 1000

example : specDuty 1000 = 308 := by decide
example : specDuty 10000 = 3080 := by decide

def agreeAntiDumpingRate308 : Bool :=
  [0, 1, 100, 1000, 10000].all fun v => dutyYen v == specDuty v

example : agreeAntiDumpingRate308 = true := by decide

end JapanTaxLaw.AntiDumpingRate308
