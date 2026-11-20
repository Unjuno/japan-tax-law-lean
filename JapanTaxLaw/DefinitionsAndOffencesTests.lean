import JapanTaxLaw.DefinitionsAndOffences
import JapanTaxLaw.DefinitionsAndOffencesSpec

/-!
# DefinitionsAndOffencesTests — 定義・閾値・犯罪・罰金上限
-/
namespace JapanTaxLaw.DefinitionsAndOffencesTests

open JapanTaxLaw.DefinitionsAndOffences

theorem ministry_spec (c : Nat) :
    ministryMatter c = JapanTaxLaw.DefinitionsAndOffencesSpec.ministrySpec c := by rfl

theorem age_spec (a : Nat) :
    atLeastSixtyFive a = true ↔ JapanTaxLaw.DefinitionsAndOffencesSpec.ageSpec a := by
  simp [atLeastSixtyFive, JapanTaxLaw.DefinitionsAndOffencesSpec.ageSpec]

theorem ratio_spec (p : Nat) :
    ratioOver95 p = true ↔ JapanTaxLaw.DefinitionsAndOffencesSpec.ratioSpec p := by
  simp [ratioOver95, JapanTaxLaw.DefinitionsAndOffencesSpec.ratioSpec]

theorem cap_spec (a cap : Nat) :
    withinCap a cap = true ↔ JapanTaxLaw.DefinitionsAndOffencesSpec.fineCapSpec a cap := by
  simp [withinCap, JapanTaxLaw.DefinitionsAndOffencesSpec.fineCapSpec]

theorem dual_spec (a c : Nat) :
    bothPunishedFine a c ↔ JapanTaxLaw.DefinitionsAndOffencesSpec.dualFineSpec a c := by rfl

example (k v : Nat) (r : List (Nat × Nat)) : lookupDefinition ((k,v)::r) k = some v := definition_hit k v r
example (q : Nat) : lookupDefinition [] q = none := definition_miss q
example (c : Nat) : ministryMatter c = c := ministry_identity c
example : atLeastSixtyFive 65 = true := sixtyfive_at_boundary
example : atLeastSixtyFive 64 = false := sixtyfive_below
example (a : Nat) (h : 65 <= a) : atLeastSixtyFive a = true := sixtyfive_above a h
example : ratioOver95 95 = false := ratio_at_95
example : ratioOver95 96 = true := ratio_over_95
example (p : Nat) (h : 95 < p) : ratioOver95 p = true := ratio_over p h
example : isQuestionOffence .noAnswer := no_answer_is_offence
example : isQuestionOffence .falseAnswer := false_answer_is_offence
example : falseTaxManagerReturn true false = true := false_return_offence
example : falseTaxManagerReturn false true = true := unjust_means_offence
example (a c : Nat) (h : bothPunishedFine a c) : a > 0 := actor_fine a c h
example (a c : Nat) (h : bothPunishedFine a c) : c > 0 := corp_fine a c h
example : withinCap penaltyCap300k penaltyCap300k = true := within_300k_boundary
example : withinCap 300001 penaltyCap300k = false := over_300k
example (a : Nat) (h : a <= penaltyCap300k) : withinCap a penaltyCap1m = true := cap_monotone a h
example : isSpecifiedLoan .specified := specified_is_loan
example : ¬ isSpecifiedLoan .other := other_is_not_specified
example : localGovernmentAcquirer true = true := local_gov_acquirer
example : localGovernmentAcquirer false = false := non_local_acquirer

end JapanTaxLaw.DefinitionsAndOffencesTests
