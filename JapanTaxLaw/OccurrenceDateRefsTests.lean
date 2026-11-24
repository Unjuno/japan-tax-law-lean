import JapanTaxLaw.OccurrenceDateRefs
import JapanTaxLaw.OccurrenceDateRefsSpec

/-!
# OccurrenceDateRefsTests — 発生日の参照
-/
namespace JapanTaxLaw.OccurrenceDateRefsTests
open JapanTaxLaw.OccurrenceDateRefs

theorem occ_spec (m : OccurrenceMap) (e : EventId) : occurrenceDate m e = JapanTaxLaw.OccurrenceDateRefsSpec.occurrenceDateSpec m e := by rfl
theorem order_spec (d1 d2 : Date) : datesOrdered d1 d2 = JapanTaxLaw.OccurrenceDateRefsSpec.datesOrderedSpec d1 d2 := by rfl
theorem onafter_spec (d b : Date) : onOrAfter d b = JapanTaxLaw.OccurrenceDateRefsSpec.onOrAfterSpec d b := by rfl
example (m : OccurrenceMap) (e : EventId) : occurrenceDate m e = m e := occurrence_deterministic m e
example (m : OccurrenceMap) (e d1 d2 : Date) (h1 : d1 = m e) (h2 : d2 = m e) : d1 = d2 := same_event_same_date m e d1 d2 h1 h2
example (d : Date) : datesOrdered d d = true := order_refl d
example (d1 d2 : Date) : datesOrdered d1 d2 = true ∨ datesOrdered d2 d1 = true := order_total d1 d2
example (b : Date) : onOrAfter b b = true := occurrence_on_boundary b
example : occurrenceDateDeclared = true := occurrence_date_is_declaration

end JapanTaxLaw.OccurrenceDateRefsTests
