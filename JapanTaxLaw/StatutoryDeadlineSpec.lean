import JapanTaxLaw.StatutoryDeadline
import JapanTaxLaw.VerdictLemmas

/-!
# StatutoryDeadline specification — independent restatement of 国税通則法（国税の通則に関する法律）
                        Act art. 2 item 8 exclusion clause

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 2 item 8, verbatim from the pinned text:
  法定納期限 国税に関する法律の規定により国税を納付すべき期限（次に掲げる国税については、
  それぞれ次に定める期限又は日）をいう。この場合において、第三十八条第二項（繰上請求）に
  規定する繰上げに係る期限及び所得税法若しくは相続税法の規定による延納（以下「延納」と
  いう。）、第四十七条第一項（納税の猶予の通知等）に規定する納税の猶予又は徴収若しくは
  滞納処分に関する猶予に係る期限は、当該国税を納付すべき期限に含まれないものとする。

This module restates the exclusion clause independently of the implementation
in StatutoryDeadline.lean. The spec fixes the five excluded kinds and the
affirmative existence rule (none of the five certified ⇒ the period counts as
法定納期限).

Axiom discipline: all theorems are proved by `cases`/`simp`/`rcases` over
Verdict constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace StatutoryDeadlineSpec

/-- An excluded period is one whose exclusion kind is affirmatively established. -/
inductive DeadlineExcludedJudgment : DeadlineFacts → Prop where
  | acceleratedRequest (f : DeadlineFacts) (h : f.acceleratedRequestApplies = Verdict.yes) :
      DeadlineExcludedJudgment f
  | extendedPayment (f : DeadlineFacts) (h : f.extendedPaymentApplies = Verdict.yes) :
      DeadlineExcludedJudgment f
  | noticeDeferral (f : DeadlineFacts) (h : f.noticeDeferralApplies = Verdict.yes) :
      DeadlineExcludedJudgment f
  | collectionDeferral (f : DeadlineFacts) (h : f.collectionDeferralApplies = Verdict.yes) :
      DeadlineExcludedJudgment f
  | delinquencyDispositionDeferral (f : DeadlineFacts)
      (h : f.delinquencyDispositionDeferralApplies = Verdict.yes) : DeadlineExcludedJudgment f

/-- Spec → impl: an affirmatively established exclusion is an exclusion. -/
theorem spec_excluded_sound (f : DeadlineFacts)
    (h : DeadlineExcludedJudgment f) : exclusionApplies f = Verdict.yes := by
  cases h with
  | acceleratedRequest hh =>
      simp [exclusionApplies, hh, Verdict.or]
  | extendedPayment hh =>
      cases hA : f.acceleratedRequestApplies <;>
        simp [exclusionApplies, hA, hh, Verdict.or]
  | noticeDeferral hh =>
      cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
        simp [exclusionApplies, hA, hE, hh, Verdict.or]
  | collectionDeferral hh =>
      cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
        cases hN : f.noticeDeferralApplies <;>
        simp [exclusionApplies, hA, hE, hN, hh, Verdict.or]
  | delinquencyDispositionDeferral hh =>
      cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
        cases hN : f.noticeDeferralApplies <;> cases hC : f.collectionDeferralApplies <;>
        simp [exclusionApplies, hA, hE, hN, hC, hh, Verdict.or]

/-- Spec → impl: exclusion ⇒ not a 法定納期限. -/
theorem spec_excluded_imp_not_statutory (f : DeadlineFacts)
    (h : DeadlineExcludedJudgment f) : isStatutoryDeadline f = Verdict.no := by
  cases h with
  | acceleratedRequest hh => exact accelerated_request_excludes f hh
  | extendedPayment hh => exact extended_payment_excludes f hh
  | noticeDeferral hh => exact notice_deferral_excludes f hh
  | collectionDeferral hh => exact collection_deferral_excludes f hh
  | delinquencyDispositionDeferral hh => exact delinquency_deferral_excludes f hh

/-- Impl → spec: an exclusion is witnessed by one of the five kinds. -/
theorem spec_excluded_complete (f : DeadlineFacts)
    (h : exclusionApplies f = Verdict.yes) : DeadlineExcludedJudgment f := by
  have hX := Verdict.or_eq_yes.mp h
  rcases hX with hInner | hD
  · have hS := Verdict.or_eq_yes.mp hInner
    rcases hS with hLeft | hRight
    · have hLS := Verdict.or_eq_yes.mp hLeft
      rcases hLS with hA | hE
      · exact DeadlineExcludedJudgment.acceleratedRequest f hA
      · exact DeadlineExcludedJudgment.extendedPayment f hE
    · have hRS := Verdict.or_eq_yes.mp hRight
      rcases hRS with hN | hC
      · exact DeadlineExcludedJudgment.noticeDeferral f hN
      · exact DeadlineExcludedJudgment.collectionDeferral f hC
  · exact DeadlineExcludedJudgment.delinquencyDispositionDeferral f hD

end StatutoryDeadlineSpec

end JapanTaxLaw
