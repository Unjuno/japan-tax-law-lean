import JapanTaxLaw.ImpositionCollectionEffects
import JapanTaxLaw.ImpositionCollectionEffectsSpec

/-!
# ImpositionCollectionEffectsTests — 課税・科刑・徴収効果
-/
namespace JapanTaxLaw.ImpositionCollectionEffectsTests
open JapanTaxLaw.ImpositionCollectionEffects

theorem impose_spec (b r : Nat) : imposeTax b r = JapanTaxLaw.ImpositionCollectionEffectsSpec.imposeTaxSpec b r := by rfl
theorem penalty_spec (v : Bool) : imposePenalty v = JapanTaxLaw.ImpositionCollectionEffectsSpec.imposePenaltySpec v := by rfl
theorem combine_spec (a b : Obligation) : combineObligations a b = JapanTaxLaw.ImpositionCollectionEffectsSpec.combineObligationsSpec a b := by rfl
theorem priority_spec (p : Nat) : collectionPriority p = JapanTaxLaw.ImpositionCollectionEffectsSpec.collectionPrioritySpec p := by rfl
theorem collect_spec (o a : Nat) : collect o a = JapanTaxLaw.ImpositionCollectionEffectsSpec.collectSpec o a := by rfl
example (b r : Nat) : imposeTax b r = b + r := impose_creates_obligation b r
example (b r d : Nat) : imposeTax b r <= imposeTax (b + d) r := impose_monotone_base b r d
example : imposePenalty true = true := penalty_on_violation
example : imposePenalty false = false := no_penalty_without_violation
example (a b : Obligation) : combineObligations a b = a + b := obligations_compose a b
example (a b c : Nat) (hab : a <= b) (hbc : b <= c) : collectionPriority a <= collectionPriority c := priority_transitive a b c hab hbc
example (o : Nat) : collect o o = 0 := full_collection_discharges o
example (o a : Nat) : collect o a <= o := partial_collection_bounded o a
example : impositionEffectDeclared = true := imposition_effect_is_declaration

end JapanTaxLaw.ImpositionCollectionEffectsTests
