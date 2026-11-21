import JapanTaxLaw.AntiDumpingRate694

/-!
# AntiDumpingRate694 spec — 不当廉売関税率 69.4% の独立整数定式
Sources (pinned): law 426CO0000000415, revision 426CO0000000415_20150425_427CO0000000215.
Independent restatement: 69.4%=694/1000, 税額=価格×694÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate694

def specDuty (v : Nat) : Nat := v * 694 / 1000

example : specDuty 1000 = 694 := by decide
example : specDuty 10000 = 6940 := by decide

def agreeAntiDumpingRate694 : Bool :=
  [0, 1, 100, 1000, 10000].all fun v => dutyYen v == specDuty v

example : agreeAntiDumpingRate694 = true := by decide

end JapanTaxLaw.AntiDumpingRate694
