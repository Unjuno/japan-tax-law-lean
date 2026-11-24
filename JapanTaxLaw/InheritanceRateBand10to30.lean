import JapanTaxLaw.TaxFinance

/-!
# InheritanceRateBand10to30 — 相続税法 art. 16, table band ¥10M–¥30M

Pinned source: law 325AC0000000073, revision
`325AC0000000073_20260401_506AC0000000008`, snapshot
`data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.

Normative unit: `NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470`
Verbatim (appendix table cell): 「千万円を超え三千万円以下の金額」 — the
strictly-greater-than ¥10,000,000 and at-most ¥30,000,000 band of the art. 16
rate table.

Scope: only this band's membership predicate. The rate applied to the band,
the other bands, and the definition of the table's base amount are separate
units and are not modelled here.
-/
namespace JapanTaxLaw.InheritanceRateBand10to30

/-- Lower edge 千万円; strict (`超え`). Unit: yen. -/
def lowerYen : Nat := 10_000_000
/-- Upper edge 三千万円; inclusive (`以下`). Unit: yen. -/
def upperYen : Nat := 30_000_000

/-- True iff the amount falls in this table band. -/
def inBand (amountYen : Nat) : Bool :=
  decide (lowerYen < amountYen && amountYen <= upperYen)

theorem at_lower : inBand 10_000_000 = false := by decide
theorem just_above_lower : inBand 10_000_001 = true := by decide
theorem at_upper : inBand 30_000_000 = true := by decide
theorem above_upper : inBand 30_000_001 = false := by decide
theorem well_below : inBand 9_999_999 = false := by decide

end JapanTaxLaw.InheritanceRateBand10to30
