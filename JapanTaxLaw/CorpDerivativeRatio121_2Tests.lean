import JapanTaxLaw.CorpDerivativeRatio121_2
import JapanTaxLaw.CorpDerivativeRatio121_2Spec

/-!
# CorpDerivativeRatio121_2Tests — 法人税法施行令 121-2
-/
namespace JapanTaxLaw.CorpDerivativeRatio121_2Tests
open JapanTaxLaw.CorpDerivativeRatio121_2

theorem ratio_spec (n d : Amount) : computeRatio n d = JapanTaxLaw.CorpDerivativeRatio121_2Spec.computeRatioSpec n d := by rfl
example (d : Amount) : computeRatio 0 d = 0 := ratio_zero_numerator d
example (n : Amount) : computeRatio n 1 = n := ratio_denominator_one n
example (n1 n2 d : Nat) (h : n1 <= n2) (hd : 0 < d) : computeRatio n1 d <= computeRatio n2 d := ratio_monotone_numerator n1 n2 d h hd
example (n d k : Nat) (hk : 0 < k) : computeRatio (n * k) (d * k) = computeRatio n d := ratio_scale_invariant n d k hk
example (g l e : Amount) : gainRatio g e = computeRatio g e ∧ lossRatio l e = computeRatio l e := gain_loss_same_structure g l e
example : derivativeRatioDeclared = true := derivative_ratio_is_declaration

end JapanTaxLaw.CorpDerivativeRatio121_2Tests
