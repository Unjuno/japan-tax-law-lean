import JapanTaxLaw.CollectionTaxpayer

/-!
# CollectionTaxpayer specification — independent restatement of 国税徴収法
                            （昭和三十四年法律第百四十七号）
                            Act art. 2 item 6（納税者）

Source (pinned):
https://laws.e-gov.go.jp/law/334AC0000000147
Revision: 334AC0000000147_20260525_506AC0000000052
Amendment enforcement date: 2026-05-25 (CurrentEnforced)

Act art. 2 item 6, verbatim from the pinned text:
  納税者 国税に関する法律の規定により国税（国税通則法……第二条第二号（定義）に規定する
  源泉徴収等による国税を除く。）を納める義務がある者及び当該源泉徴収等による国税を徴収して
  国に納付しなければならない者をいう。

This module restates Act art. 2 item 6 independently of the implementation in
CollectionTaxpayer.lean. Note the deliberate absence of any exclusion clause.

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace CollectionTaxpayerSpec

/-- Sufficient legal sources of a 納税者 (Collection Act art. 2 item 6) judgment. -/
inductive CollectionTaxpayerJudgment : CollectionTaxpayerFacts → Prop where
  | direct    (f : CollectionTaxpayerFacts)
      (h : f.owesDirectly = Verdict.yes) : CollectionTaxpayerJudgment f
  | withholding (f : CollectionTaxpayerFacts)
      (h : f.mustCollectAndPay = Verdict.yes) : CollectionTaxpayerJudgment f

end CollectionTaxpayerSpec

open CollectionTaxpayerSpec

/-- Spec → impl: an established judgment yields an affirmative 納税者 verdict. -/
theorem spec_collection_taxpayer_sound (f : CollectionTaxpayerFacts)
    (h : CollectionTaxpayerJudgment f) :
    isCollectionTaxpayer f = Verdict.yes := by
  cases h with
  | direct hD => exact collection_direct_payment_sufficient f hD
  | withholding hM => exact collection_source_collection_sufficient f hM

/-- Impl → spec: an affirmative first-limb track yields the direct judgment. -/
theorem spec_collection_taxpayer_direct_complete (f : CollectionTaxpayerFacts)
    (h : f.owesDirectly = Verdict.yes) : CollectionTaxpayerJudgment f :=
  CollectionTaxpayerJudgment.direct f h

/-- Impl → spec: an affirmative withholding track yields the withholding judgment. -/
theorem spec_collection_taxpayer_withholding_complete (f : CollectionTaxpayerFacts)
    (h : f.mustCollectAndPay = Verdict.yes) : CollectionTaxpayerJudgment f :=
  CollectionTaxpayerJudgment.withholding f h

/-- Impl → spec: any affirmative 納税者 verdict is witnessed by a judgment. -/
theorem spec_collection_taxpayer_complete (f : CollectionTaxpayerFacts)
    (h : isCollectionTaxpayer f = Verdict.yes) : CollectionTaxpayerJudgment f := by
  rcases (collection_owes_iff_either_track_yes f).mp h with h1 | h2
  · exact CollectionTaxpayerJudgment.direct f h1
  · exact CollectionTaxpayerJudgment.withholding f h2

end JapanTaxLaw
