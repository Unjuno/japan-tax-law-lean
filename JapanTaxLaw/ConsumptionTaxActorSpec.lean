import JapanTaxLaw.ConsumptionTaxActor

/-!
# ConsumptionTaxActor specification — independent restatement of 消費税法 Act art. 2 items 3/4/7; Act art. 4(1); Act art. 5(1)

Source (pinned):
https://laws.e-gov.go.jp/law/363AC0000000108
Revision: 363AC0000000108_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Key text (pinned):
  三個人事業者 事業を行う個人をいう。
  四事業者 個人事業者及び法人をいう。
  七人格のない社団等 法人でない社団又は財団で代表者又は管理人の定めがあるものをいう。
  第四条第一項 国内において事業者が行つた資産の譲渡等（特定資産の譲渡等に該当するものを除く。第三項において同じ。）及び特定仕入れ（事業として他の者から受けた特定資産の譲渡等をいう。以下この章において同じ。）には、この法律により、消費税を課する。
  第五条第一項 事業者は、国内において行つた課税資産の譲渡等（特定資産の譲渡等に該当するものを除く。第三十条第二項及び第三十二条を除き、以下同じ。）及び特定課税仕入れ（課税仕入れのうち特定仕入れに該当するものをいう。以下同じ。）につき、この法律により、消費税を納める義務がある。

This module restates the actor/obligation rules independently of the
implementation in ConsumptionTaxActor.lean. The spec fixes the two sufficient
conditions: business operator established (personal or corporate) + taxable event.

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict
constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace ConsumptionTaxActorSpec

/-- Sufficient sources of an affirmative consumption-tax actor judgment. -/
inductive BusinessOperatorJudgment : ConsumptionTaxActorFacts → Prop where
  | individualBusinessOperator (f : ConsumptionTaxActorFacts)
      (h : f.isIndividualBusinessOperator = Verdict.yes) : BusinessOperatorJudgment f
  | corporation (f : ConsumptionTaxActorFacts) (h : f.isCorporation = Verdict.yes) :
      BusinessOperatorJudgment f

/-- Sufficient sources of an affirmative taxable-event fact. -/
inductive TaxableEventJudgment : ConsumptionTaxActorFacts → Prop where
  | domesticSupply (f : ConsumptionTaxActorFacts)
      (h : f.domesticTaxableSupplyConducted = Verdict.yes) : TaxableEventJudgment f
  | specificPurchase (f : ConsumptionTaxActorFacts)
      (h : f.specificTaxablePurchaseConducted = Verdict.yes) : TaxableEventJudgment f

/-- Sufficient sources of an affirmative obligation judgment: business operator + taxable event. -/
inductive ObligationJudgment : ConsumptionTaxActorFacts → Prop where
  | businessOperatorAndEvent (f : ConsumptionTaxActorFacts)
      (hB : BusinessOperatorJudgment f) (hE : TaxableEventJudgment f) : ObligationJudgment f

end ConsumptionTaxActorSpec

open ConsumptionTaxActorSpec

/-- Spec → impl: an affirmatively established business operator is a business operator. -/
theorem spec_business_operator_sound (f : ConsumptionTaxActorFacts)
    (h : BusinessOperatorJudgment f) : isBusinessOperatorVerdict f = Verdict.yes := by
  cases h with
  | individualBusinessOperator hh => exact individual_business_operator_sufficient f hh
  | corporation hh => exact corporation_sufficient f hh

/-- Spec → impl: an affirmatively established taxable event is an event. -/
theorem spec_event_sound (f : ConsumptionTaxActorFacts)
    (h : TaxableEventJudgment f) : taxableEventVerdict f = Verdict.yes := by
  cases h with
  | domesticSupply hh => exact domestic_supply_sufficient f hh
  | specificPurchase hh => exact specific_purchase_sufficient f hh

/-- Impl → spec: every business operator is witnessed by an actor judgment. -/
theorem spec_business_operator_complete (f : ConsumptionTaxActorFacts)
    (h : isBusinessOperatorVerdict f = Verdict.yes) : BusinessOperatorJudgment f := by
  cases hI : f.isIndividualBusinessOperator <;> cases hC : f.isCorporation <;>
    simp [isBusinessOperatorVerdict, hI, hC, Verdict.or] at h
  · exact BusinessOperatorJudgment.individualBusinessOperator f hI
  · exact BusinessOperatorJudgment.individualBusinessOperator f hI
  · exact BusinessOperatorJudgment.individualBusinessOperator f hI
  · exact BusinessOperatorJudgment.individualBusinessOperator f hI
  · exact BusinessOperatorJudgment.corporation f hC
  · exact BusinessOperatorJudgment.corporation f hC
  · exact BusinessOperatorJudgment.corporation f hC

/-- Impl → spec: every taxable event is witnessed by an event judgment. -/
theorem spec_event_complete (f : ConsumptionTaxActorFacts)
    (h : taxableEventVerdict f = Verdict.yes) : TaxableEventJudgment f := by
  cases hS : f.domesticTaxableSupplyConducted <;> cases hP : f.specificTaxablePurchaseConducted <;>
    simp [taxableEventVerdict, hS, hP, Verdict.or] at h
  · exact TaxableEventJudgment.domesticSupply f hS
  · exact TaxableEventJudgment.domesticSupply f hS
  · exact TaxableEventJudgment.domesticSupply f hS
  · exact TaxableEventJudgment.domesticSupply f hS
  · exact TaxableEventJudgment.specificPurchase f hP
  · exact TaxableEventJudgment.specificPurchase f hP
  · exact TaxableEventJudgment.specificPurchase f hP

/-- Spec → impl: an affirmative obligation judgment is an obligation. -/
theorem spec_obligation_sound (f : ConsumptionTaxActorFacts)
    (h : ObligationJudgment f) : owesConsumptionTaxVerdict f = Verdict.yes := by
  cases h with
  | businessOperatorAndEvent hB hE =>
      exact business_operator_and_event_implies_owes f (spec_business_operator_sound f hB) (spec_event_sound f hE)

/-- Impl → spec: every obligation is witnessed by business operator + event. -/
theorem spec_obligation_complete (f : ConsumptionTaxActorFacts)
    (h : owesConsumptionTaxVerdict f = Verdict.yes) : ObligationJudgment f := by
  unfold owesConsumptionTaxVerdict at h
  cases hB : isBusinessOperatorVerdict f <;> cases hE : taxableEventVerdict f <;>
    simp [hB, hE, Verdict.and] at h
  exact ObligationJudgment.businessOperatorAndEvent f (spec_business_operator_complete f hB) (spec_event_complete f hE)

end JapanTaxLaw
