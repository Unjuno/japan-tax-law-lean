import JapanTaxLaw.SCFVPenaltyCeiling

/-
# SCFVPenaltyCeilingSpec — independent spec for 在日米軍特例法 art.11(3)

Law id: 327AC0000000111
Revision: 327AC0000000111_20250601_504AC0000000068
Raw snapshot: data/raw/327AC0000000111_20250601_504AC0000000068.law.json
sha256: 04223c3926ac2a26dd0ff9120a712b6e3aa4af0285455db1be9163bd7074c1b2
原文: 「第一項の規定に違反した者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

This spec declares its OWN constants from the 原文 and uses DIFFERENT
operators from the implementation:
  impl: `decide (years <= 1)`, `decide (yen <= 500_000)`
  spec: `decide (¬ years > 1)`, `decide (¬ yen > 500_000)`
Both statutory values are quoted DIRECTLY: 一年 = 1 年 and 五十万 = 500,000 円.
No 月 conversion is performed. For Nat the two operator forms are equivalent,
but this is proved for ALL inputs by the universal kernel-checked `agree_*`
theorems below (omega), not sampled. No implementation identifier occurs in
any independent spec formula.

DIMENSIONAL NOTE (§3): the two axes are dimensionally DISTINCT —
  years is 拘禁刑の期間, unit 年; yen is 罰金の額, unit 円.
They are independent; a year value must never be mixed with a yen value.

Not modelled: 「又は」 alternative structure, 第一項 violation conditions,
第二項 collection, 第四項 corporate aggravation, 附則 transitional measures.
-/

namespace JapanTaxLaw.SCFVPenaltyCeiling

/-- Independent constant: 一年, the direct statutory value 1 年. -/
def specImprisonmentCeiling : Nat := 1

/-- Independent constant: 五十万円 = 500,000 円. -/
def specFineCeiling : Nat := 500_000

/-- Independent formula (year axis): NOT greater than the ceiling, i.e. <=. -/
def specWithinImprisonment (years : Nat) : Bool :=
  decide (¬ years > specImprisonmentCeiling)

/-- Independent formula (yen axis): NOT greater than the ceiling, i.e. <=. -/
def specWithinFine (yen : Nat) : Bool :=
  decide (¬ yen > specFineCeiling)

/-- Universal bridge, year axis. Kernel-checked by omega for every Nat. -/
theorem agree_imprisonment_ceiling (years : Nat) :
    withinImprisonmentCeiling years = specWithinImprisonment years := by
  unfold withinImprisonmentCeiling imprisonmentCeilingYears
  unfold specWithinImprisonment specImprisonmentCeiling
  by_cases h : years <= 1
  · have hng : ¬ years > 1 := by omega
    simp [h, hng]
  · have hgt : years > 1 := by omega
    simp [h, hgt]

/-- Universal bridge, yen axis. Kernel-checked by omega for every Nat. -/
theorem agree_fine_ceiling (yen : Nat) :
    withinFineCeiling yen = specWithinFine yen := by
  unfold withinFineCeiling fineCeilingYen
  unfold specWithinFine specFineCeiling
  by_cases h : yen <= 500_000
  · have hng : ¬ yen > 500_000 := by omega
    simp [h, hng]
  · have hgt : yen > 500_000 := by omega
    simp [h, hgt]

/-- Independent spec boundary: 一年 = 1 年 is within (¬ 1 > 1). -/
theorem spec_imprisonment_at_ceiling : specWithinImprisonment 1 = true := by
  decide

/-- Independent spec boundary: one year over the ceiling is outside. -/
theorem spec_imprisonment_over_ceiling :
    specWithinImprisonment (specImprisonmentCeiling + 1) = false := by
  decide

/-- Independent spec boundary: 500,000 円 is within. -/
theorem spec_fine_at_ceiling : specWithinFine 500_000 = true := by
  decide

/-- Independent spec boundary: one yen over the ceiling is outside. -/
theorem spec_fine_over_ceiling :
    specWithinFine (specFineCeiling + 1) = false := by
  decide

end JapanTaxLaw.SCFVPenaltyCeiling
