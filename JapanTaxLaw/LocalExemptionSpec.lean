import JapanTaxLaw.LocalExemption

/-!
# LocalExemption specification — independent restatement of 地方税法（昭和二十五年法律第二百二十六号）
                       Act art. 6 （公益等に因る課税免除及び不均一課税）

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 6, verbatim from the pinned text:
  第六条 地方団体は、公益上その他の事由に因り課税を不適当とする場合においては、課税をしないことができる.
  ２ 地方団体は、公益上その他の事由に因り必要がある場合においては、不均一の課税をすることができる.

This module restates the two permissions independently of the implementation
in LocalExemption.lean. The spec fixes the two affirmative permissions:
  地方団体 + 公益上の理由 ⇒ 課税しない選択肢を保持（第1項）
  地方団体 + 公益上の理由（必要あり） ⇒ 不均一課税の選択肢を保持（第2項）

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace LocalExemptionSpec

/-- Sufficient sources of an affirmative Act art. 6 outcome. -/
inductive LocalTaxExemptionJudgment : LocalTaxExemptionFacts → Prop where
  | art6Sec1 (f : LocalTaxExemptionFacts)
      (hI : f.isLocalEntity = Verdict.yes)
      (hP : f.publicInterestExemptionApplies = Verdict.yes) : LocalTaxExemptionJudgment f
  | art6Sec2 (f : LocalTaxExemptionFacts)
      (hI : f.isLocalEntity = Verdict.yes)
      (hP : f.publicInterestUnevenLevyApplies = Verdict.yes) : LocalTaxExemptionJudgment f

end LocalExemptionSpec

open LocalExemptionSpec

/-- Spec → impl: an affirmatively established judgment yields its permission. -/
theorem spec_local_tax_exemption_sound (f : LocalTaxExemptionFacts)
    (h : LocalTaxExemptionJudgment f) : mayNotLevy f = Verdict.yes ∨ mayLevyUnevenly f = Verdict.yes := by
  cases h with
  | art6Sec1 hI hP => exact Or.inl (local_entity_exemption_sufficient f hI hP)
  | art6Sec2 hI hP => exact Or.inr (local_entity_uneven_levy_sufficient f hI hP)

/-- Impl → spec: an affirmatively established exception-based freedom (第1項) is a witness. -/
theorem spec_local_tax_exemption_complete (f : LocalTaxExemptionFacts)
    (h : mayNotLevy f = Verdict.yes) : LocalTaxExemptionJudgment f := by
  cases hI : f.isLocalEntity <;> cases hP : f.publicInterestExemptionApplies <;>
    simp [mayNotLevy, hI, hP, Verdict.and] at h
  · exact LocalTaxExemptionJudgment.art6Sec1 f hI hP

/-- Impl → spec: an affirmatively established uneven-levy permission (第2項) is a witness. -/
theorem spec_local_tax_exemption_complete_sec2 (f : LocalTaxExemptionFacts)
    (h : mayLevyUnevenly f = Verdict.yes) : LocalTaxExemptionJudgment f := by
  cases hI : f.isLocalEntity <;> cases hP : f.publicInterestUnevenLevyApplies <;>
    simp [mayLevyUnevenly, hI, hP, Verdict.and] at h
  · exact LocalTaxExemptionJudgment.art6Sec2 f hI hP

end JapanTaxLaw
