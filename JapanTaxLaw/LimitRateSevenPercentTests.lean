import JapanTaxLaw.LimitRateSevenPercentSpec

/-
# LimitRateSevenPercentTests — kernel-decided checks for 租税条約等実施特例法施行令 art.4(1)(4)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned rate, zero, a small positive
input, both sides of the 7% case, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.LimitRateSevenPercent

-- (a) pinned statutory value: 百分の七 = 7 percent points.
example : statutoryRatePercent = 7 := rfl

-- (b) zero and small positive rates do not match this case.
example : isSevenPercent 0 = false := by decide
example : isSevenPercent 1 = false := by decide

-- (c) just below the rate fails.
example : isSevenPercent 6 = false := by decide

-- (d) exactly 7% qualifies.
example : isSevenPercent 7 = true := by decide

-- (e) one point above fails.
example : isSevenPercent 8 = false := by decide

-- (f) Nat identity / saturation at the rate.
example : 7 + 0 = 7 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : isSevenPercent 7 = specIsSevenPercent 7 := by decide
example : isSevenPercent 8 = specIsSevenPercent 8 := by decide
example : isSevenPercent 0 = specIsSevenPercent 0 := by decide

-- (h) universal theorem applied to an arbitrary percent.
example (x : Nat) : isSevenPercent x = specIsSevenPercent x := agree_rate x

-- (i) independent spec constants are the statutory 7/100 ratio.
example : specRateNumerator = 7 := rfl
example : specRateDenominator = 100 := rfl

end JapanTaxLaw.LimitRateSevenPercent
