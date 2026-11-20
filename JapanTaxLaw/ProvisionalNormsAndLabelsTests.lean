import JapanTaxLaw.ProvisionalNormsAndLabels
import JapanTaxLaw.ProvisionalNormsAndLabelsSpec

/-!
# ProvisionalNormsAndLabelsTests — 12 families, spec agreement + boundaries
-/
namespace JapanTaxLaw.ProvisionalNormsAndLabelsTests

open JapanTaxLaw.ProvisionalNormsAndLabels

theorem formula_spec (f : Nat → Nat) (x : Nat) :
    applyFormula f x = JapanTaxLaw.ProvisionalNormsAndLabelsSpec.formulaSpec f x := by rfl

theorem old_law_spec (a e : Nat) :
    oldLawApplies a e = true ↔ JapanTaxLaw.ProvisionalNormsAndLabelsSpec.oldLawSpec a e := by
  simp [oldLawApplies, JapanTaxLaw.ProvisionalNormsAndLabelsSpec.oldLawSpec]

theorem bracket_spec (lo hi x : Nat) :
    inBracket lo hi x = true ↔ JapanTaxLaw.ProvisionalNormsAndLabelsSpec.bracketSpec lo hi x := by
  simp [inBracket, JapanTaxLaw.ProvisionalNormsAndLabelsSpec.bracketSpec]

theorem under_spec (w : Nat) :
    underOneTon w = JapanTaxLaw.ProvisionalNormsAndLabelsSpec.underTonSpec w := by rfl

theorem over_spec (w : Nat) :
    overOneTon w = JapanTaxLaw.ProvisionalNormsAndLabelsSpec.overTonSpec w := by rfl

example : parseSubItem "一の二" = some (1, 2) := by decide
example : parseSubItem "七の二" = some (7, 2) := by decide
example : parseSubItem "三の二" = some (3, 2) := by decide
example : parseSubItem "九の二" = some (9, 2) := by decide
example : parseSubItem "二の二" = some (2, 2) := by decide
example : parseSubItem "二十の二" = some (20, 2) := by decide
example : parseSubItem "五の二" = some (5, 2) := by decide
example : parseSubItem "八の二" = some (8, 2) := by decide
example : parseSubItem "六の二" = some (6, 2) := by decide
example : parseSubItem "十の二" = some (10, 2) := by decide
example : parseSubItem "十一の二" = some (11, 2) := by decide
example : parseSubItem "十七の二" = some (17, 2) := by decide
example : parseSubItem "十九の二" = some (19, 2) := by decide
example : parseSubItem "十二の二" = some (12, 2) := by decide
example : parseSubItem "十五の二" = some (15, 2) := by decide
example : parseSubItem "十八の二" = some (18, 2) := by decide
example : parseSubItem "十六の二" = some (16, 2) := by decide
example : parseSubItem "十四の二" = some (14, 2) := by decide
example : parseSubItem "四の二" = some (4, 2) := by decide
example : parseSubItem "四十の二" = some (40, 2) := by decide

example (f : Nat → Nat) (x : Nat) : applyFormula f x = f x := applyFormula_identity f x
example (x : Nat) : quoteClose x = x := quoteClose_identity x
example : activeRole ≠ passiveRole := yomikae_roles_distinct
example (t : Nat) : prevArticleRef t = t := prevArticleRef_identity t
example (k v : Nat) (r : List (Nat × Nat)) : lookupDef ((k,v)::r) k = some v := lookupDef_hit k v r
example (q : Nat) : lookupDef [] q = none := lookupDef_miss q
example (a e : Nat) (h : a < e) : oldLawApplies a e = true := old_law_before a e h
example (a e : Nat) (h : e <= a) : oldLawApplies a e = false := new_law_from_enforcement a e h
example : exemptPermission = .may := exempt_is_may
example : exemptPermission ≠ .must := exempt_not_must
example (lo hi : Nat) (h : lo <= hi) : inBracket lo hi lo = true := bracket_lower lo hi h
example (lo hi : Nat) (h : lo <= hi) : inBracket lo hi hi = true := bracket_upper lo hi h
example (w : Nat) : underOneTon w = true ↔ overOneTon w = false := weight_complement w
example (w : Nat) : ¬ (underOneTon w = true ∧ overOneTon w = true) := weight_exclusive w

end JapanTaxLaw.ProvisionalNormsAndLabelsTests
