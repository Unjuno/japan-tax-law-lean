import JapanTaxLaw.RoundingRules
import JapanTaxLaw.RoundingRulesSpec

/-!
# RoundingRulesTests — 丸め境界・仕様一致
-/
namespace JapanTaxLaw.RoundingRulesTests

open JapanTaxLaw.RoundingRules

theorem round_spec (x u : Nat) :
    roundHalfUp x u = JapanTaxLaw.RoundingRulesSpec.roundSpec x u := by rfl

theorem floor_spec (x u : Nat) :
    floorTo x u = JapanTaxLaw.RoundingRulesSpec.floorSpec x u := by rfl

example : floorTo 12_345 100 = 12_300 := by decide
example : roundHalfUp 12_350 100 = 12_400 := by decide
example : roundHalfUp 12_349 100 = 12_300 := by decide
example : roundHalfUp 7 1 = 7 := by decide
example (x u : Nat) : floorTo x u <= x := floor_le x u
example (x u : Nat) : floorTo x u % u = 0 := floor_multiple x u
example (a b u : Nat) (h : a <= b) : floorTo a u <= floorTo b u := floor_mono a b u h
example (x : Nat) : roundHalfUp x 1 = x := integer_round_is_identity x
example (x u : Nat) : Shishagonyu.round x u = roundHalfUp x u := all_shishagonyu_variants x u

end JapanTaxLaw.RoundingRulesTests
