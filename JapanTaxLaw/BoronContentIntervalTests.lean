import JapanTaxLaw.BoronContentIntervalSpec

/-! Kernel-decided boundary examples for 不当廉売関税政令 art.1 ロ(1). -/
namespace JapanTaxLaw.BoronContentInterval

example : inBoronRange 80 := by decide
example : inBoronRange 700 := by decide
example : ¬ inBoronRange 79 := by decide
example : ¬ inBoronRange 701 := by decide
example : inBoronRange 100 := by decide
example : ¬ inBoronRange 0 := by decide
example : specInRange 80 := by decide
example : specInRange 700 := by decide
example : specInRange 80 ↔ inBoronRange 80 := agreeRange 80
example : specInRange 79 ↔ inBoronRange 79 := agreeRange 79
example : specInRange 701 ↔ inBoronRange 701 := agreeRange 701

end JapanTaxLaw.BoronContentInterval
