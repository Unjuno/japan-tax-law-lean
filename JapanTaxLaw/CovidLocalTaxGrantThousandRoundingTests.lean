import JapanTaxLaw.CovidLocalTaxGrantThousandRounding
import JapanTaxLaw.CovidLocalTaxGrantThousandRoundingSpec

/-
# CovidLocalTaxGrantThousandRoundingTests — コロナ減収補塡特例交付金省令 2(1) の kernel-decided 検証

Pinned: law 504M60000008016 / revision 504M60000008016_20220318_000000000000000.
Coverage: 五百=500 / 千=1000, remainder boundaries 0/499/500/999/1000/1499/1500,
impl/spec agreement.
-/

namespace JapanTaxLaw.CovidLocalTaxGrantThousandRounding

example : lowerBand = 500 := by decide
example : upperBand = 1000 := by decide

-- 端数境界
example : roundAmount 0 = 0 := by decide
example : roundAmount 499 = 0 := by decide
example : roundAmount 500 = 1000 := by decide
example : roundAmount 999 = 1000 := by decide
example : roundAmount 1000 = 1000 := by decide
example : roundAmount 1499 = 1000 := by decide
example : roundAmount 1500 = 2000 := by decide

-- impl / 独立仕様の一致
example : lowerBand = specLower := by decide
example : upperBand = specUpper := by decide
example : roundAmount 0 = specRound 0 := by decide
example : roundAmount 499 = specRound 499 := by decide
example : roundAmount 500 = specRound 500 := by decide
example : roundAmount 999 = specRound 999 := by decide
example : roundAmount 1000 = specRound 1000 := by decide
example : roundAmount 1499 = specRound 1499 := by decide
example : roundAmount 1500 = specRound 1500 := by decide

end JapanTaxLaw.CovidLocalTaxGrantThousandRounding
