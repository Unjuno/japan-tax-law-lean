import JapanTaxLaw.Verdict
import JapanTaxLaw.VerdictLemmas
import JapanTaxLaw.Taxpayer

/-!
# Taxpayer specification — independent restatement of 国税通則法（国税の通則に関する法律）
                        Act art. 2 item 5

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 2 item 5, verbatim from the pinned text:
  納税者 国税に関する法律の規定により国税（源泉徴収等による国税を除く。）を納める義務が
  ある者（国税徴収法（昭和三十四年法律第百四十七号）に規定する第二次納税義務者及び国税の
  保証人を除く。）及び源泉徴収等による国税を徴収して国に納付しなければならない者をいう。

This module restates the rule independently of the implementation in
Taxpayer.lean. It fixes the SUFFICIENT conditions for an affirmative
taxpayer judgment:

  (a) direct track: obliged to pay national tax (other than source-collected),
      and NOT a secondary obligor under the National Tax Collection Act and NOT a
      national-tax guarantor;
  (b) withholding track: obliged to collect and pay source-collected national tax.

Soundness/completeness theorem pairs show the implementation honours the
specification and vice versa. The unknown/conflict corners (e.g. obligation
unknown, exclusion verdicts unknown) are exercised by the test suite.
-/

namespace JapanTaxLaw

namespace TaxpayerSpec

/-- Sufficient sources of an affirmative taxpayer judgment under Act art. 2 item 5. -/
inductive TaxpayerJudgment : TaxpayerFacts → Prop where
  | directTrack (f : TaxpayerFacts)
      (hOwes : f.owesDirectly = Verdict.yes)
      (hNoSec : f.isSecondaryObligor = Verdict.no)
      (hNoGuar : f.isNationalTaxGuarantor = Verdict.no) : TaxpayerJudgment f
  | sourceCollectionTrack (f : TaxpayerFacts)
      (hCol : f.mustCollectAndPay = Verdict.yes) : TaxpayerJudgment f

end TaxpayerSpec

open TaxpayerSpec

-- ==================== soundness and completeness ====================

/-- Specification → implementation: the independently stated sufficient
    conditions are honoured by the implementation. -/
theorem taxpayer_spec_sound (f : TaxpayerFacts)
    (h : TaxpayerJudgment f) : isTaxpayer f = Verdict.yes := by
  cases h with
  | directTrack hOwes hNoSec hNoGuar =>
      have hdt : directTrack f = Verdict.yes := by
        have hx : directTrackExcluded f = Verdict.no := by
          unfold directTrackExcluded
          rw [hNoSec, hNoGuar]
          rfl
        unfold directTrack
        rw [hx, hOwes]
        rfl
      unfold isTaxpayer
      rw [hdt]
      exact Verdict.or_yes_left _
  | sourceCollectionTrack hCol =>
      unfold isTaxpayer
      rw [hCol]
      exact Verdict.or_yes_right _

/-- Implementation → specification: every affirmative implementation outcome is
    witnessed by a sufficient rule (completeness of the spec). -/
theorem taxpayer_spec_complete (f : TaxpayerFacts)
    (h : isTaxpayer f = Verdict.yes) : TaxpayerJudgment f := by
  unfold isTaxpayer at h
  have hor : directTrack f = Verdict.yes ∨ f.mustCollectAndPay = Verdict.yes := Verdict.or_eq_yes.mp h
  cases hor with
  | inl h1 =>
      rcases Verdict.and_eq_yes.mp h1 with ⟨hOwes, hExcl⟩
      have hEx : directTrackExcluded f = Verdict.no := Verdict.not_eq_yes.mp hExcl
      have hBoth : f.isSecondaryObligor = Verdict.no ∧ f.isNationalTaxGuarantor = Verdict.no := by
        unfold directTrackExcluded at hEx
        exact Verdict.or_eq_no.mp hEx
      exact TaxpayerJudgment.directTrack f hOwes hBoth.1 hBoth.2
  | inr h3 =>
      exact TaxpayerJudgment.sourceCollectionTrack f h3

end JapanTaxLaw
