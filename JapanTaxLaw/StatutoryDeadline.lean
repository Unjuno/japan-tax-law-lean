import JapanTaxLaw.Verdict

/-!
# StatutoryDeadline — 国税通則法（国税の通則に関する法律）第2条第8号（法定納期限）

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE

Act art. 2 item 8, verbatim from the pinned text (relevant part):
  法定納期限 国税に関する法律の規定により国税を納付すべき期限（次に掲げる国税については、
  それぞれ次に定める期限又は日）をいう。この場合において、第三十八条第二項（繰上請求）に
  規定する繰上げに係る期限及び所得税法若しくは相続税法の規定による延納（以下「延納」と
  いう。）、第四十七条第一項（納税の猶予の通知等）に規定する納税の猶予又は徴収若しくは
  滞納処分に関する猶予に係る期限は、当該国税を納付すべき期限に含まれないものとする。
  [イ–ニ follow; those sub-items are not formalized by this module]

This module formalizes the EXCLUSION clause of Act art. 2 item 8:
the five kinds of periods that are NOT 法定納期限. The enumerated sub-items
（イ–ニ）and their interaction with the exclusion clause belong to a later
slice (Art. 2 item 8 sub-items) and are explicitly NOT claimed here.

Scope:
* Only the exclusion clause is formalized. The positive definition
  （国税に関する法律の規定により国税を納付すべき期限）and sub-items イ–ニ are not modeled.
* Exclusion states are four-valued `Verdict`s; `unknown` is never treated as `false`.
* Whether a concrete period is in fact an excluded one is an externally assessed
  legal fact (applicability of 繰上請求, 延納, etc.) — not decided here.

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict
constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- The five excluded period kinds of Act art. 2 item 8, verbatim coverage. -/
inductive DeadlineExclusionKind where
  /-- 第三十八条第二項（繰上請求）に規定する繰上げに係る期限 -/
  | acceleratedRequest
  /-- 所得税法若しくは相続税法の規定による延納に係る期限 -/
  | extendedPayment
  /-- 第四十七条第一項（納税の猶予の通知等）に規定する納税の猶予に係る期限 -/
  | noticeDeferral
  /-- 徴収に関する猶予に係る期限 -/
  | collectionDeferral
  /-- 滞納処分に関する猶予に係る期限 -/
  | delinquencyDispositionDeferral
  deriving DecidableEq, Repr

/-- Assessed facts relevant to the exclusion clause of Act art. 2 item 8. -/
structure DeadlineFacts where
  acceleratedRequestApplies : Verdict
  extendedPaymentApplies : Verdict
  noticeDeferralApplies : Verdict
  collectionDeferralApplies : Verdict
  delinquencyDispositionDeferralApplies : Verdict
  deriving DecidableEq, Repr

/-- Any of the five exclusion kinds is affirmatively assessed as applying. -/
def exclusionApplies (f : DeadlineFacts) : Verdict :=
  Verdict.or (Verdict.or (Verdict.or f.acceleratedRequestApplies f.extendedPaymentApplies)
                         (Verdict.or f.noticeDeferralApplies f.collectionDeferralApplies))
             f.delinquencyDispositionDeferralApplies

/-- Act art. 2 item 8: such periods are NOT 法定納期限. -/
def isStatutoryDeadline (f : DeadlineFacts) : Verdict :=
  Verdict.not (exclusionApplies f)

-- ==================== structural consistency lemmas ====================

/-- 繰上請求 ⇒ 法定納期限ではない. -/
theorem accelerated_request_excludes (f : DeadlineFacts)
    (h : f.acceleratedRequestApplies = Verdict.yes) : isStatutoryDeadline f = Verdict.no := by
  simp [exclusionApplies, isStatutoryDeadline, h, Verdict.or, Verdict.not]

/-- 延納 ⇒ 法定納期限ではない. -/
theorem extended_payment_excludes (f : DeadlineFacts)
    (h : f.extendedPaymentApplies = Verdict.yes) : isStatutoryDeadline f = Verdict.no := by
  cases hA : f.acceleratedRequestApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, h, Verdict.or, Verdict.not]

/-- 納税の猶予 ⇒ 法定納期限ではない（その他に確定事実は不問）. -/
theorem notice_deferral_excludes (f : DeadlineFacts)
    (h : f.noticeDeferralApplies = Verdict.yes) : isStatutoryDeadline f = Verdict.no := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, h, Verdict.or, Verdict.not]

/-- 徴収の猶予 ⇒ 法定納期限ではない. -/
theorem collection_deferral_excludes (f : DeadlineFacts)
    (h : f.collectionDeferralApplies = Verdict.yes) : isStatutoryDeadline f = Verdict.no := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    cases hN : f.noticeDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, hN, h, Verdict.or, Verdict.not]

/-- 滞納処分に関する猶予 ⇒ 法定納期限ではない. -/
theorem delinquency_deferral_excludes (f : DeadlineFacts)
    (h : f.delinquencyDispositionDeferralApplies = Verdict.yes) : isStatutoryDeadline f = Verdict.no := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    cases hN : f.noticeDeferralApplies <;> cases hC : f.collectionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, hN, hC, h, Verdict.or, Verdict.not]

/-- いずれの除外も認められない ⇒ 法定納期限（肯定側）. -/
theorem none_excluded_statutory (f : DeadlineFacts)
    (hA : f.acceleratedRequestApplies = Verdict.no)
    (hE : f.extendedPaymentApplies = Verdict.no)
    (hN : f.noticeDeferralApplies = Verdict.no)
    (hC : f.collectionDeferralApplies = Verdict.no)
    (hD : f.delinquencyDispositionDeferralApplies = Verdict.no) : isStatutoryDeadline f = Verdict.yes := by
  simp [isStatutoryDeadline, exclusionApplies, hA, hE, hN, hC, hD, Verdict.or, Verdict.not]

/-- 除外の該当がすべて否定的なら法定納期限である. -/
theorem exclusionApplies_no_iff (f : DeadlineFacts) :
    exclusionApplies f = Verdict.no ↔
      (f.acceleratedRequestApplies = Verdict.no ∧ f.extendedPaymentApplies = Verdict.no ∧
       f.noticeDeferralApplies = Verdict.no ∧ f.collectionDeferralApplies = Verdict.no ∧
       f.delinquencyDispositionDeferralApplies = Verdict.no) := by
  cases hA : f.acceleratedRequestApplies <;>
  cases hE : f.extendedPaymentApplies <;>
  cases hN : f.noticeDeferralApplies <;>
  cases hC : f.collectionDeferralApplies <;>
  cases hD : f.delinquencyDispositionDeferralApplies <;>
  simp [exclusionApplies, hA, hE, hN, hC, hD, Verdict.or]

/-- いずれかの除外事由が不明なら、肯定判定しない（不明を偽として処理しない）. -/
theorem accelerated_request_unknown_not_yes (f : DeadlineFacts)
    (h : f.acceleratedRequestApplies = Verdict.unknown) : isStatutoryDeadline f ≠ Verdict.yes := by
  cases hE : f.extendedPaymentApplies <;> cases hN : f.noticeDeferralApplies <;>
    cases hC : f.collectionDeferralApplies <;> cases hD : f.delinquencyDispositionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, h, hE, hN, hC, hD, Verdict.or, Verdict.not]

theorem extended_payment_unknown_not_yes (f : DeadlineFacts)
    (h : f.extendedPaymentApplies = Verdict.unknown) : isStatutoryDeadline f ≠ Verdict.yes := by
  cases hA : f.acceleratedRequestApplies <;> cases hN : f.noticeDeferralApplies <;>
    cases hC : f.collectionDeferralApplies <;> cases hD : f.delinquencyDispositionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, h, hN, hC, hD, Verdict.or, Verdict.not]

theorem notice_deferral_unknown_not_yes (f : DeadlineFacts)
    (h : f.noticeDeferralApplies = Verdict.unknown) : isStatutoryDeadline f ≠ Verdict.yes := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    cases hC : f.collectionDeferralApplies <;> cases hD : f.delinquencyDispositionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, h, hC, hD, Verdict.or, Verdict.not]

theorem collection_deferral_unknown_not_yes (f : DeadlineFacts)
    (h : f.collectionDeferralApplies = Verdict.unknown) : isStatutoryDeadline f ≠ Verdict.yes := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    cases hN : f.noticeDeferralApplies <;> cases hD : f.delinquencyDispositionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, hN, h, hD, Verdict.or, Verdict.not]

theorem delinquency_deferral_unknown_not_yes (f : DeadlineFacts)
    (h : f.delinquencyDispositionDeferralApplies = Verdict.unknown) : isStatutoryDeadline f ≠ Verdict.yes := by
  cases hA : f.acceleratedRequestApplies <;> cases hE : f.extendedPaymentApplies <;>
    cases hN : f.noticeDeferralApplies <;> cases hC : f.collectionDeferralApplies <;>
    simp [exclusionApplies, isStatutoryDeadline, hA, hE, hN, hC, h, Verdict.or, Verdict.not]

end JapanTaxLaw
