import JapanTaxLaw.PetroleumGasSenRate
import JapanTaxLaw.PetroleumGasSenRateSpec

/-
# PetroleumGasSenRateTests — kernel-decided checks for 石油ガス税法 art.10（十七円五十銭）

Pinned: law 340AC0000000156, revision 340AC0000000156_20260525_506AC0000000052,
  data/raw/340AC0000000156_20260525_506AC0000000052.law.json,
  sha256 537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153,
  Article Num 10, needle「石油ガス税の税率は、課税石油ガス一キログラムにつき、十七円五十銭とする。」.
All checks are closed Nat/Bool expressions discharged by `by decide` or `rfl`,
or applications of named theorems. Coverage: zero / small input / the
just-below / at / just-above boundary of both literals 17 and 50, constant
values, and impl/spec agreement (concrete points plus the universal bridge).
-/

namespace JapanTaxLaw.PetroleumGasSenRate

-- (a) 法定の二成分税率 (17, 50) は一致する。
example : rateMatches 17 50 = true := by decide

-- (b) zero / small input。
example : rateMatches 0 0 = false := by decide
example : rateMatches 17 0 = false := by decide
example : rateMatches 1 1 = false := by decide

-- (c) リテラル 17 のしきい値近傍 (16 / 17 / 18)。
example : rateMatches 16 50 = false := by decide
example : rateMatches 18 50 = false := by decide

-- (d) リテラル 50 のしきい値近傍 (49 / 50 / 51)。
example : rateMatches 17 49 = false := by decide
example : rateMatches 17 51 = false := by decide

-- (e) 定数値（定理を証明項として適用）。
example : unitYen = 17 := unitYen_value
example : unitSen = 50 := unitSen_value

-- (f) impl/spec 一致（具体的点および普遍橋渡し）。
example : unitYen = specYen := agreeYen
example : unitSen = specSen := agreeSen
example : rateMatches 17 50 = specRateMatches 17 50 := by decide
example (yen : Nat) (sen : Nat) : rateMatches yen sen = specRateMatches yen sen := agreeRate yen sen

end JapanTaxLaw.PetroleumGasSenRate
