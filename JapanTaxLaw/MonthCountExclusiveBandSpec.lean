import JapanTaxLaw.MonthCountExclusiveBand

/-
# MonthCountExclusiveBandSpec — independent spec for 法人特別税法 第七条

Pinned source:
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  sha256: 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8
  Statutory article: 第七条 (art. 7; raw JSON Article attr.Num = "7").
  原文逐語: 「事業年度の変更その他の事由により、指定期間内に終了する事業年度の月数の合計が二十四月に満たない法人及び当該月数の合計が二十四月を超える法人（次号から第五号までに掲げる法人を除く。）」

INDEPENDENT FORMULATION. This module owns its own statutory constant
`specBand : Nat := 24` (二十四月 = 24 months) and its own formulas
`specExcluded` / `specQualifies`. No implementation identifier (bandValue /
excludedByMonthCount / qualifiesByMonthCount) occurs in any independent
definition. The only links to the implementation are the universal
kernel-checked bridges agreeBand / agreeExcluded / agreeQualifies, each a
pure `unfold ... ; rfl`. Out of scope, as in the impl: the 第一号〜第五号
enumerations, 適用期間, 課税標準 and all other provisions.
-/

namespace JapanTaxLaw.MonthCountExclusiveBand

/-- Independent 二十四月 = 24. -/
def specBand : Nat := 24

/-- Independent 除外判定: months < 24 OR 24 < months. -/
def specExcluded (months : Nat) : Bool :=
  decide (months < specBand || specBand < months)

/-- Independent 該当判定: !specExcluded months, i.e. months == 24. -/
def specQualifies (months : Nat) : Bool :=
  !specExcluded months

/-- Bridge: the two band constants coincide (pure unfold / rfl). -/
theorem agreeBand : bandValue = specBand := by
  unfold bandValue specBand
  rfl

/-- Bridge: both exclusion predicates coincide for every Nat input. -/
theorem agreeExcluded (months : Nat) :
    excludedByMonthCount months = specExcluded months := by
  unfold excludedByMonthCount specExcluded bandValue specBand
  rfl

/-- Bridge: both qualification predicates coincide for every Nat input. -/
theorem agreeQualifies (months : Nat) :
    qualifiesByMonthCount months = specQualifies months := by
  unfold qualifiesByMonthCount specQualifies excludedByMonthCount specExcluded bandValue specBand
  rfl

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specBand = 24 := by decide
example : specExcluded 23 = true := by decide
example : specExcluded 24 = false := by decide
example : specExcluded 25 = true := by decide
example : specQualifies 24 = true := by decide
example : specQualifies 23 = false := by decide
example : specQualifies 25 = false := by decide

end JapanTaxLaw.MonthCountExclusiveBand
