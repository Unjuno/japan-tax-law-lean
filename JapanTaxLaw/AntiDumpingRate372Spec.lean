import JapanTaxLaw.AntiDumpingRate372

/-!
# AntiDumpingRate372 spec — 不当廉売関税率 37.2% の独立整数定式
Sources (pinned): law 502CO0000000208, revision 502CO0000000208_20200917_502CO0000000279.
Independent restatement: 37.2%=372/1000, 税額=価格×372÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate372

def specDuty (v : Nat) : Nat := v * 372 / 1000

example : specDuty 1000 = 372 := by decide
example : specDuty 10000 = 3720 := by decide

def agreeAntiDumpingRate372 : Bool :=
  [0, 1, 100, 1000, 10000].all fun v => dutyYen v == specDuty v

example : agreeAntiDumpingRate372 = true := by decide

end JapanTaxLaw.AntiDumpingRate372
