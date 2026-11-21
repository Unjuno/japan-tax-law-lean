import JapanTaxLaw.AntiDumpingRate53

/-!
# AntiDumpingRate53 spec — 不当廉売関税率 53.0% の独立整数定式
Sources (pinned): law 429CO0000000234, revision 429CO0000000234_20230204_505CO0000000028.
Independent restatement: 53.0%=530/1000, 税額=価格×530÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate53

def specDuty (value : Nat) : Nat := value * 530 / 1000

example : specDuty 1000 = 530 := by decide
example : specDuty 10000 = 5300 := by decide

def agreeAntiDumpingRate53 : Bool :=
  [0, 1, 100, 1000, 10000].all fun v => dutyYen v == specDuty v

example : agreeAntiDumpingRate53 = true := by decide

end JapanTaxLaw.AntiDumpingRate53
