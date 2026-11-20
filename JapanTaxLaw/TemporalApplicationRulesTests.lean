import JapanTaxLaw.TemporalApplicationRules
import JapanTaxLaw.TemporalApplicationRulesSpec

/-!
# TemporalApplicationRulesTests — 時間的境界と付随構造
-/
namespace JapanTaxLaw.TemporalApplicationRulesTests

open JapanTaxLaw.TemporalApplicationRules

theorem new_spec (d e : Nat) :
    newLawApplies d e = true ↔ JapanTaxLaw.TemporalApplicationRulesSpec.newLawSpec d e := by
  simp [newLawApplies, JapanTaxLaw.TemporalApplicationRulesSpec.newLawSpec]

theorem old_spec (d e : Nat) :
    oldLawApplies d e = true ↔ JapanTaxLaw.TemporalApplicationRulesSpec.oldLawSpec d e := by
  simp [oldLawApplies, JapanTaxLaw.TemporalApplicationRulesSpec.oldLawSpec]

theorem prior_spec (a e : Nat) :
    priorActPenalty a e = true ↔ JapanTaxLaw.TemporalApplicationRulesSpec.priorPenaltySpec a e := by
  simp [priorActPenalty, JapanTaxLaw.TemporalApplicationRulesSpec.priorPenaltySpec]

theorem from_date_spec (d t : Nat) :
    fromDateApplies d t = true ↔ JapanTaxLaw.TemporalApplicationRulesSpec.fromDateSpec d t := by
  simp [fromDateApplies, JapanTaxLaw.TemporalApplicationRulesSpec.fromDateSpec]

theorem limitation_spec (p : Nat) :
    limitationOf p = JapanTaxLaw.TemporalApplicationRulesSpec.limitationSpec p := by rfl

theorem delegated_spec (c : Nat) :
    delegatedTransitional c = JapanTaxLaw.TemporalApplicationRulesSpec.delegatedSpec c := by rfl

theorem special_limit_spec (t : Nat) :
    refSpecialLimit t = JapanTaxLaw.TemporalApplicationRulesSpec.specialLimitSpec t := by rfl

theorem case_index_spec (i : Nat) :
    caseIndex i = JapanTaxLaw.TemporalApplicationRulesSpec.caseIndexSpec i := by rfl

example (e : Nat) : newLawApplies e e = true := new_law_at_enforcement e
example (d e : Nat) (h : e <= d) : newLawApplies d e = true := new_law_after d e h
example (d e : Nat) (h : d < e) : oldLawApplies d e = true := old_law_before d e h
example (d e : Nat) : ¬ (newLawApplies d e = true ∧ oldLawApplies d e = true) := new_old_exclusive d e
example (d e : Nat) : newLawApplies d e = true ∨ oldLawApplies d e = true := new_old_total d e
example (a e : Nat) (h : a < e) : priorActPenalty a e = true := prior_penalty_before a e h
example (a e : Nat) (h : e <= a) : priorActPenalty a e = false := prior_penalty_from_enforcement a e h
example (p : Nat) : limitationOf p = p := limitation_follows_principal p
example (t : Nat) : fromDateApplies t t = true := from_date_at_trigger t
example (c : Nat) : delegatedTransitional c = c := transitional_is_delegated c
example : represents .representative := representative_acts
example : ¬ represents .entity := entity_does_not_represent
example : studyDirectiveDeclared = true := study_is_declaration
example : certificationRequired = true := certification_is_requirement
example (t : Nat) : refSpecialLimit t = t := special_limit_ref_identity t
example : isObstruction .refusal := refusal_is_obstruction
example : isObstruction .falseRecord := false_record_is_obstruction
example (i : Nat) : caseIndex i = i := case_index_identity i

end JapanTaxLaw.TemporalApplicationRulesTests
