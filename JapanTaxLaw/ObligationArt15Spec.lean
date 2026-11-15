import JapanTaxLaw.ObligationArt15

/-!
# ObligationArt15 specification — independent restatement of 国税通則法
                        Act art. 15 establishment events

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 15, verbatim (relevant portion):
  第二項 納税義務は、次の各号に掲げる国税（第一号から第十三号までにおいて、附帯税を除く。）
  については、当該各号に定める時（当該国税のうち政令で定めるものについては、政令で定める時）
  に成立する。
  （抜粋）
  二 源泉徴収による所得税 利子、配当、給与、報酬、料金その他源泉徴収をすべきものとされている
      所得の支払の時
  七 消費税等 課税資産の譲渡等若しくは特定課税仕入れをした時又は課税物件の製造場からの
      移出若しくは保税地域からの引取りの時
  十四 過少申告加算税、無申告加算税…重加算税 法定申告期限の経過の時
  十五 不納付加算税…重加算税 法定納期限の経過の時
  第三項 納税義務の成立と同時に特別の手続を要しないで納付すべき税額が確定する国税は、
  次に掲げる国税とする。（…七 延滞税及び利子税）

This module restates the Act art. 15 establishment events independently of
the implementation in ObligationArt15.lean. The spec fixes the five classes of
establishment events recognized by this slice.

Axiom discipline: all theorems are proved by `decide`/`rcases` over
DecidableEq/inductive instances. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace ObligationArt15Spec

/-- Sufficient sources of an affirmative establishment classification. -/
inductive EstablishmentJudgment : TaxKind → EstablishmentEventKind → Prop where
  | incomePayment (k : TaxKind) (h : k = .withholdingIncomeTax) :
      EstablishmentJudgment k .timeOfIncomePayment
  | supplyOrRemoval (k : TaxKind)
      (h : k = .consumptionTax ∨ k = .liquorTax ∨ k = .tobaccoTax ∨ k = .gasolineTax ∨
           k = .localGasolineTax ∨ k = .petroleumGasTax ∨ k = .petroleumAndCoalTax) :
      EstablishmentJudgment k .timeOfSupplyOrRemoval
  | filingDeadlineExpiry (k : TaxKind)
      (h : k = .underDeclarationTax ∨ k = .nonDeclarationTax) :
      EstablishmentJudgment k .timeOfExpiryOfFilingDeadline
  | paymentDeadlineExpiry (k : TaxKind) (h : k = .nonPaymentTax) :
      EstablishmentJudgment k .timeOfExpiryOfPaymentDeadline
  | noProcedure (k : TaxKind)
      (h : k = .latePaymentTax ∨ k = .interestTax) :
      EstablishmentJudgment k .noSpecialProcedureNeeded

/-- Spec → impl. -/
theorem spec_sound (k : TaxKind) (e : EstablishmentEventKind)
    (h : EstablishmentJudgment k e) : establishmentEvent k = e := by
  cases h with
  | incomePayment hh => subst hh; rfl
  | supplyOrRemoval hh =>
      rcases hh with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl
  | filingDeadlineExpiry hh =>
      rcases hh with rfl | rfl <;> rfl
  | paymentDeadlineExpiry hh => subst hh; rfl
  | noProcedure hh =>
      rcases hh with rfl | rfl <;> rfl

/-- Impl → spec: the payment event is witnessed. -/
theorem spec_complete_incomePayment (k : TaxKind)
    (h : establishmentEvent k = .timeOfIncomePayment) : EstablishmentJudgment k .timeOfIncomePayment := by
  cases k <;> simp [establishmentEvent] at h
  exact EstablishmentJudgment.incomePayment _ rfl

/-- Impl → spec: the supply/removal event is witnessed. -/
theorem spec_complete_supplyOrRemoval (k : TaxKind)
    (h : establishmentEvent k = .timeOfSupplyOrRemoval) : EstablishmentJudgment k .timeOfSupplyOrRemoval := by
  cases k <;> simp [establishmentEvent] at h
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)
  · exact EstablishmentJudgment.supplyOrRemoval _ (by simp)

/-- Impl → spec: the filing-deadline event is witnessed. -/
theorem spec_complete_filingDeadlineExpiry (k : TaxKind)
    (h : establishmentEvent k = .timeOfExpiryOfFilingDeadline) :
    EstablishmentJudgment k .timeOfExpiryOfFilingDeadline := by
  cases k <;> simp [establishmentEvent] at h
  · exact EstablishmentJudgment.filingDeadlineExpiry _ (Or.inl rfl)
  · exact EstablishmentJudgment.filingDeadlineExpiry _ (Or.inr rfl)

/-- Impl → spec: the payment-deadline event is witnessed. -/
theorem spec_complete_paymentDeadlineExpiry (k : TaxKind)
    (h : establishmentEvent k = .timeOfExpiryOfPaymentDeadline) :
    EstablishmentJudgment k .timeOfExpiryOfPaymentDeadline := by
  cases k <;> simp [establishmentEvent] at h
  exact EstablishmentJudgment.paymentDeadlineExpiry _ rfl

/-- Impl → spec: the para-3-item-7 event is witnessed. -/
theorem spec_complete_noProcedure (k : TaxKind)
    (h : establishmentEvent k = .noSpecialProcedureNeeded) :
    EstablishmentJudgment k .noSpecialProcedureNeeded := by
  cases k <;> simp [establishmentEvent] at h
  · exact EstablishmentJudgment.noProcedure _ (Or.inl rfl)
  · exact EstablishmentJudgment.noProcedure _ (Or.inr rfl)

end ObligationArt15Spec

end JapanTaxLaw
