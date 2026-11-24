import JapanTaxLaw.CorpFiscalYearArt72_13
import JapanTaxLaw.CorpFiscalYearArt72_13Spec

/-!
# CorpFiscalYearArt72_13Tests — 地方税法 第七十二条の十三
-/
namespace JapanTaxLaw.CorpFiscalYearArt72_13Tests
open JapanTaxLaw.CorpFiscalYearArt72_13

theorem default_spec : defaultCalendarYear = JapanTaxLaw.CorpFiscalYearArt72_13Spec.defaultCalendarYearSpec := by rfl
theorem end_spec (d : Day) : endAtBoundary d = JapanTaxLaw.CorpFiscalYearArt72_13Spec.endAtBoundarySpec d := by rfl
theorem start_spec (d : Day) : startAtBoundary d = JapanTaxLaw.CorpFiscalYearArt72_13Spec.startAtBoundarySpec d := by rfl
theorem next_spec (d s : Day) (b : Bool) : nextYearStart d b s = JapanTaxLaw.CorpFiscalYearArt72_13Spec.nextYearStartSpec d b s := by rfl
theorem cstart_spec (d : Day) : consolidatedStart d = JapanTaxLaw.CorpFiscalYearArt72_13Spec.consolidatedStartSpec d := by rfl
theorem cend_spec (d : Day) : consolidatedEnd d = JapanTaxLaw.CorpFiscalYearArt72_13Spec.consolidatedEndSpec d := by rfl
example (d : Day) (h : 2 <= d) : startAtBoundary d = endAtBoundary d + 1 := boundary_contiguous d h
example (d : Day) (hlo : 2 <= d) (hhi : d <= 365) : endAtBoundary d >= 1 ∧ startAtBoundary d <= 365 := boundary_in_year d hlo hhi
example (d s : Day) : nextYearStart d false s = d := no_suppress_starts_at_boundary d s
example (d s : Day) : nextYearStart d true s = s := suppress_starts_at_special_end d s
example (ps pe : Day) : consolidatedStart ps = ps ∧ consolidatedEnd pe = pe := consolidated_matches_parent ps pe
example (d : Day) (h : 2 <= d) : endAtBoundary d < startAtBoundary d := end_before_next_start d h
example : corpFiscalYearDeclared = true := corp_fiscal_year_is_declaration

end JapanTaxLaw.CorpFiscalYearArt72_13Tests
