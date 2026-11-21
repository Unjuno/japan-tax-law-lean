import JapanTaxLaw.TaxFinance

/-
# TonTaxPunishment — とん税法 第十二条（罰則）explicit numeric ceilings + 併科 model

Pinned source:
  Law id: 332AC0000000037
  Revision: 332AC0000000037_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000037_20250601_504AC0000000068.law.json
  sha256: fe033954f29722501d8307e078084959f1e49a7868e2205be4e9faf843dc92a3
  Article: 第十二条 (raw JSON Article attr.Num = "12")

原文逐語（pinned, 一字一句改変なし）:
  「偽りその他不正の行為により、とん税を免れ、又は納付すべきとん税を納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する。」

Variable contract:
  `years : Nat` = 拘禁刑の期間, unit 年 (whole years).
  `yen : Nat` = 罰金の額, unit 円 (whole yen).
  `imprisoned fined : Bool` = applied flags; true iff that component is imposed.
  三年 = 3 (年), 五十万 = 500,000 (円). Both 「以下」 are INCLUSIVE (<=), so
  exactly 3 年 / 500,000 円 are within the ceilings; 4 年 / 500,001 円 are over.
  「若しくは」 is the alternative (at least one component must be imposed);
  「併科」 is the SEPARATE concurrency rule allowing both to be imposed at once.
  The concurrency option is DISTINCT from the two numeric ceilings, and the
  dimensions 年 and 円 are never mixed.

Scope: ONLY the explicit numeric ceilings and the 併科 option are modelled.
  犯罪の成立要件（不正行為の認定）, 免れ/納付しなかつた fact-finding, 未遂,
  judicial discretion, other articles and procedure are NOT MODELLED.
  This is a mechanical formalisation, not a legal review.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TonTaxPunishment

open JapanTaxLaw.TaxFinance

/-- 拘禁刑の上限 = 三年以下 = 3. Unit 年; domain Nat. -/
def imprisonmentCeilingYears : Nat := 3

/-- 罰金の上限 = 五十万円以下 = 500,000. Unit 円; domain Nat. -/
def fineCeilingYen : Nat := 500_000

/-- 「三年以下」: applied imprisonment length <= 3 年 (inclusive). -/
def withinImprisonmentCeiling (years : Nat) : Bool :=
  decide (years <= imprisonmentCeilingYears)

/-- 「五十万円以下」: applied fine <= 500,000 円 (inclusive). -/
def withinFineCeiling (yen : Nat) : Bool :=
  decide (yen <= fineCeilingYen)

/-- A sentence is valid iff every APPLIED component stays within its OWN ceiling
    and at least one component is applied. 併科 allows both flags true; 若しくは
    forbids both false. Equivalent Bool reading:
    `(imprisoned = true → years <= 3) && (fined = true → yen <= 500000) && (imprisoned || fined)`.
    Written as a `decide` of the equivalent Prop conjunction so the kernel can
    discharge the universal leniency theorem below with `omega`. -/
def validSentence (years yen : Nat) (imprisoned fined : Bool) : Bool :=
  decide ((imprisoned = true → years <= imprisonmentCeilingYears) ∧
          (fined = true → yen <= fineCeilingYen) ∧
          (imprisoned = true ∨ fined = true))

/-- At the ceilings (3 年, 500,000 円), 併科 (both applied) is valid. -/
theorem at_ceiling_concurrent : validSentence 3 500_000 true true = true := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen
  decide

/-- Over both ceilings (4 年, 500,001 円), 併科 is invalid. -/
theorem over_ceiling_concurrent : validSentence 4 500_001 true true = false := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen
  decide

/-- 拘禁刑のみ (imprisonment only): an unapplied fine is irrelevant, even if
    the yen value is over the fine ceiling (dimension separation). -/
theorem imprisonment_only_valid : validSentence 3 500_001 true false = true := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen
  decide

/-- 罰金のみ (fine only): an unapplied imprisonment is irrelevant. -/
theorem fine_only_valid : validSentence 4 500_000 false true = true := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen
  decide

/-- Neither component applied: 若しくは requires at least one. -/
theorem neither_flag_invalid : validSentence 0 0 false false = false := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen
  decide

/-- Monotonicity in leniency: reducing either applied amount (years' <= years,
    yen' <= yen) preserves validity for the same sentencing flags. This is the
    inclusive-「以下」 boundary behavior, proved universally with `omega`. -/
theorem monotonic_leniency {years yen years' yen' : Nat} {imprisoned fined : Bool}
    (h : validSentence years yen imprisoned fined = true)
    (hy : years' <= years) (hyen : yen' <= yen) :
    validSentence years' yen' imprisoned fined = true := by
  unfold validSentence imprisonmentCeilingYears fineCeilingYen at h ⊢
  apply decide_eq_true
  have hp := of_decide_eq_true h
  rcases hp with ⟨hi, hf, hflag⟩
  refine ⟨?_, ?_, hflag⟩
  · intro himp
    have hle : years <= 3 := hi himp
    omega
  · intro hfined
    have hle : yen <= 500_000 := hf hfined
    omega

end JapanTaxLaw.TonTaxPunishment
