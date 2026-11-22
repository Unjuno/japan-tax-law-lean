import JapanTaxLaw.FiscalYearMonthProration

/-
# FiscalYearMonthProrationSpec — independent integer restatement of 四百万円を十二で除し月数を乗じる按分

Pinned source: law 404AC0000000015, revision 404AC0000000015_20010401_413AC0000000006.
Independent restatement: 年四百万円 = 4,000,000 円, 十二 = 12,
按分額 = (4,000,000 ÷ 12) × months (Nat floor division at the division step).
This module owns its own `specAnnual`, `specMonths`, `specProrated`; no
implementation identifier (annualAmount / monthsPerYear / proratedFor) occurs
in any independent formula. The only bridges are the kernel-checked agree*
below, each a pure `unfold ... ; rfl`.
-/

namespace JapanTaxLaw.FiscalYearMonthProration

/-- Independent 年四百万円 = 4,000,000. -/
def specAnnual : Nat := 4_000_000

/-- Independent 十二 = 12. -/
def specMonths : Nat := 12

/-- Independent proration: divide by 12 first, then multiply by months. -/
def specProrated (months : Nat) : Nat :=
  (specAnnual / specMonths) * months

/-- Bridge: statutory annual amount equals independent annual amount. -/
theorem agreeAnnual : annualAmount = specAnnual := by unfold annualAmount specAnnual; rfl

/-- Bridge: statutory months per year equals independent months per year. -/
theorem agreeMonths : monthsPerYear = specMonths := by unfold monthsPerYear specMonths; rfl

/-- Bridge: the two formulas agree for every months (all constants occur in the body). -/
theorem agreeProrated (months : Nat) : proratedFor months = specProrated months := by
  unfold proratedFor specProrated annualAmount specAnnual monthsPerYear specMonths
  rfl

end JapanTaxLaw.FiscalYearMonthProration
