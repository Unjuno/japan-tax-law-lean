import JapanTaxLaw.AggregationNorms
import JapanTaxLaw.AggregationNormsSpec

/-!
# AggregationNormsTests — 合算額
-/
namespace JapanTaxLaw.AggregationNormsTests

open JapanTaxLaw.AggregationNorms

theorem aggregate_spec (amounts : List Nat) :
    aggregateAmount amounts = JapanTaxLaw.AggregationNormsSpec.aggregateSpec amounts := by
  induction amounts with
  | nil => rfl
  | cons a xs ih =>
      dsimp [aggregateAmount] at ih ⊢
      simp [JapanTaxLaw.AggregationNormsSpec.aggregateSpec, ih]

example : aggregateAmount [] = 0 := aggregate_nil
example (a : Nat) : aggregateAmount [a] = a := aggregate_single a
example (a b : Nat) : aggregateAmount [a, b] = a + b := aggregate_combine a b
example (xs ys : List Nat) : aggregateAmount (xs ++ ys) = aggregateAmount xs + aggregateAmount ys := aggregate_append xs ys
example (a b : Nat) : aggregateAmount [a, b] = aggregateAmount [b, a] := aggregate_perm_two a b
example : aggregateDeclared = true := aggregate_is_declaration

end JapanTaxLaw.AggregationNormsTests
