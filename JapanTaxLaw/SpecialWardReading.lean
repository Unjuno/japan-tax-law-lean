import JapanTaxLaw.TaxFinance

/-
# SpecialWardReading — 口蹄疫特例法施行令 第二条第六項（特別区への準用）

Pinned source:
  Law id: 422CO0000000221
  Revision: 422CO0000000221_20101029_000000000000000
  Raw snapshot: data/raw/422CO0000000221_20101029_000000000000000.law.json
  Article: 第二条 (art. 2), 第六項
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#6/ParagraphSentence/Sentence#1
  Normative unit id: NORM|dd5ec1ac1f02917579082e477bba620ca8d36970e2a503fef2f51185baa2d6b4

原文逐語（pinned, verbatim, READING）:
  「前各項の規定は、特別区について準用する。」

Variable contract:
  A jurisdiction code is a Nat: 0 = 特別区, 1 = 前各項の規定を準用する,
  2+ = caller-defined jurisdictions. `asSpecialWard` maps 0 to 1 and preserves
  every other code. Unit: a discrete jurisdiction tag; domain: Nat.

Scope: ONLY the mutatis-mutandis application of the preceding paragraphs to
特別区 is modelled. The content of those paragraphs and all other provisions
are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialWardReading

/-- 「前各項の規定は、特別区について準用する」。 -/
def asSpecialWard : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem special_ward_gets_reading : asSpecialWard 0 = 1 := rfl

theorem applied_unchanged : asSpecialWard 1 = 1 := rfl

theorem other_unchanged : asSpecialWard 2 = 2 := rfl

theorem idempotent (c : Nat) : asSpecialWard (asSpecialWard c) = asSpecialWard c := by
  cases c <;> rfl

end JapanTaxLaw.SpecialWardReading
