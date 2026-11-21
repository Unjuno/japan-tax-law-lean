import JapanTaxLaw.AntiDumpingRate

/-!
# AntiDumpingRate spec — 不当廉売関税率 の独立整数定式
Sources (pinned): law 428CO0000000196, revision 428CO0000000196_20210814_503CO0000000231.
Independent restatement: 49.5%=495/1000, 73.7%=737/1000, 税額=価格×率÷1000。
-/

namespace JapanTaxLaw.AntiDumpingRate

def specDuty (rate value : Nat) : Nat := value * rate / 1000

example : specDuty 495 1000 = 495 := by decide
example : specDuty 737 1000 = 737 := by decide

def agreeAntiDumpingRate : Bool :=
  [0, 1, 100, 1000, 10000].all fun v =>
    dutyYen koreaRatePerMille v == specDuty 495 v
    && dutyYen chinaRatePerMille v == specDuty 737 v

example : agreeAntiDumpingRate = true := by decide

end JapanTaxLaw.AntiDumpingRate
