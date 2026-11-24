import JapanTaxLaw.TaxFinance

/-!
# InvestigationDeadlineOneYear — 関税定率法 art. 7(7) 調査期間

Pinned source: law 143AC0000000054, revision
`143AC0000000054_20260601_508AC0000000005`, snapshot
`data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.

Normative unit: `NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6`
Verbatim: 「前項の調査は、当該調査を開始した日から一年以内に終了するものとする。」

This is a temporal norm. The statute says 「一年以内」; to avoid assuming a
365-day calendar conversion, the model takes an already-computed elapsed
whole-year count (`Nat`) as caller-established and checks the inclusive
one-year limit. The actual date arithmetic from the investigation start date
is a separate matter and is NOT modelled or claimed here.
-/
namespace JapanTaxLaw.InvestigationDeadlineOneYear

/-- 一年, expressed as a whole-year count; inclusive upper limit. -/
def limitYears : Nat := 1

/-- True iff the investigation ended within one year of its start. -/
def withinDeadline (elapsedYears : Nat) : Bool :=
  decide (elapsedYears <= limitYears)

theorem at_start : withinDeadline 0 = true := by decide
theorem at_one_year : withinDeadline 1 = true := by decide
theorem after_one_year : withinDeadline 2 = false := by decide

end JapanTaxLaw.InvestigationDeadlineOneYear
