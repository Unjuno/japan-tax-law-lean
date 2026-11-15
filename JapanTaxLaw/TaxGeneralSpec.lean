import JapanTaxLaw.Verdict
import JapanTaxLaw.TaxGeneral

/-!
# TaxGeneral specification — independent restatement of 国税通則法（国税の通則に関する法律）
                         Act art. 2 items 1–4

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

This module restates the statutory definitions independently of the
implementation in TaxGeneral.lean:

* Act art. 2 item 1 （定義・国税）: 「国が課する税のうち関税、とん税、特別とん税、
  森林環境税及び特別法人事業税以外のものをいう。」
* Act art. 2 item 2 （定義・源泉徴収等による国税）: 源泉徴収に係る所得税及び
  国際観光旅客税法 第2条第1項第7号に規定する特別徴収に係る国際観光旅客税
  （これらの税に係る附帯税を除く。）をいう。
* Act art. 2 item 3 （定義・消費税等）: 消費税、酒税、たばこ税、揮発油税、
  地方揮発油税、石油ガス税及び石油石炭税をいう。
* Act art. 2 item 4 （定義・附帯税）: 国税のうち延滞税、利子税、過少申告加算税、
  無申告加算税、不納付加算税及び重加算税をいう。

Soundness/completeness theorem pairs show the implementation agrees with the
independently stated specification. The closed `TaxKind` universe is per
TaxGeneral.lean; extending it is additive work here too.
-/

namespace JapanTaxLaw

namespace TaxGeneralSpec

/-- Restatement of Act art. 2 item 1's exclusion list. -/
inductive ExcludedNationalTaxSpec : TaxKind → Prop where
  | tariff (k : TaxKind) (h : k = .customsDuty) : ExcludedNationalTaxSpec k
  | ton (k : TaxKind) (h : k = .tonZei) : ExcludedNationalTaxSpec k
  | specialTon (k : TaxKind) (h : k = .specialTonZei) : ExcludedNationalTaxSpec k
  | forestEnvironment (k : TaxKind) (h : k = .forestEnvironmentZei) : ExcludedNationalTaxSpec k
  | specialCorporateBusiness (k : TaxKind) (h : k = .specialCorporateBizZei) : ExcludedNationalTaxSpec k

/-- Restatement of Act art. 2 item 3's enumeration: 消費税等. -/
inductive ConsumptionTaxEtcSpec : TaxKind → Prop where
  | consumption (k : TaxKind) (h : k = .consumptionTax) : ConsumptionTaxEtcSpec k
  | liquor (k : TaxKind) (h : k = .liquorTax) : ConsumptionTaxEtcSpec k
  | tobacco (k : TaxKind) (h : k = .tobaccoTax) : ConsumptionTaxEtcSpec k
  | gasoline (k : TaxKind) (h : k = .gasolineTax) : ConsumptionTaxEtcSpec k
  | localGasoline (k : TaxKind) (h : k = .localGasolineTax) : ConsumptionTaxEtcSpec k
  | petroleumGas (k : TaxKind) (h : k = .petroleumGasTax) : ConsumptionTaxEtcSpec k
  | petroleumAndCoal (k : TaxKind) (h : k = .petroleumAndCoalTax) : ConsumptionTaxEtcSpec k

/-- Restatement of Act art. 2 item 4's enumeration: 附帯税. -/
inductive AncillaryTaxSpec : TaxKind → Prop where
  | latePayment (k : TaxKind) (h : k = .latePaymentTax) : AncillaryTaxSpec k
  | interest (k : TaxKind) (h : k = .interestTax) : AncillaryTaxSpec k
  | underDeclaration (k : TaxKind) (h : k = .underDeclarationTax) : AncillaryTaxSpec k
  | nonDeclaration (k : TaxKind) (h : k = .nonDeclarationTax) : AncillaryTaxSpec k
  | nonPayment (k : TaxKind) (h : k = .nonPaymentTax) : AncillaryTaxSpec k
  | heavyAdditional (k : TaxKind) (h : k = .heavyAdditionalTax) : AncillaryTaxSpec k

/-- Restatement of Act art. 2 item 2's enumeration: 源泉徴収等による国税. -/
inductive SourceCollectedNationalTaxSpec : TaxKind → Prop where
  | withholding (k : TaxKind) (h : k = .withholdingIncomeTax) : SourceCollectedNationalTaxSpec k
  | specialInternationalTourismCollection (k : TaxKind) (h : k = .internationalTourismSpecialCollZei) :
      SourceCollectedNationalTaxSpec k

/-- Spec → impl: the independently stated item-1 exclusion agrees with the implementation. -/
theorem spec_excluded_sound (k : TaxKind) (h : ExcludedNationalTaxSpec k) :
    NationalTaxExcluded k := by
  cases h with
  | tariff hh => subst hh; exact NationalTaxExcluded.customsDuty
  | ton hh => subst hh; exact NationalTaxExcluded.tonZei
  | specialTon hh => subst hh; exact NationalTaxExcluded.specialTonZei
  | forestEnvironment hh => subst hh; exact NationalTaxExcluded.forestEnvironmentZei
  | specialCorporateBusiness hh => subst hh; exact NationalTaxExcluded.specialCorporateBizZei

/-- Impl → spec: the implementation agrees with the independently stated item-1 exclusion. -/
theorem spec_excluded_complete (k : TaxKind) (h : NationalTaxExcluded k) :
    ExcludedNationalTaxSpec k := by
  cases h with
  | customsDuty => exact ExcludedNationalTaxSpec.tariff _ rfl
  | tonZei => exact ExcludedNationalTaxSpec.ton _ rfl
  | specialTonZei => exact ExcludedNationalTaxSpec.specialTon _ rfl
  | forestEnvironmentZei => exact ExcludedNationalTaxSpec.forestEnvironment _ rfl
  | specialCorporateBizZei => exact ExcludedNationalTaxSpec.specialCorporateBusiness _ rfl

/-- Spec ↔ impl, item 3. -/
theorem spec_consumption_sound (k : TaxKind) (h : ConsumptionTaxEtcSpec k) :
    isConsumptionTaxEtc k = true := by
  cases h with
  | consumption hh => subst hh; decide
  | liquor hh => subst hh; decide
  | tobacco hh => subst hh; decide
  | gasoline hh => subst hh; decide
  | localGasoline hh => subst hh; decide
  | petroleumGas hh => subst hh; decide
  | petroleumAndCoal hh => subst hh; decide

theorem spec_consumption_complete (k : TaxKind) (h : isConsumptionTaxEtc k = true) :
    ConsumptionTaxEtcSpec k := by
  cases k <;> simp [isConsumptionTaxEtc] at h
  · exact ConsumptionTaxEtcSpec.consumption _ rfl
  · exact ConsumptionTaxEtcSpec.liquor _ rfl
  · exact ConsumptionTaxEtcSpec.tobacco _ rfl
  · exact ConsumptionTaxEtcSpec.gasoline _ rfl
  · exact ConsumptionTaxEtcSpec.localGasoline _ rfl
  · exact ConsumptionTaxEtcSpec.petroleumGas _ rfl
  · exact ConsumptionTaxEtcSpec.petroleumAndCoal _ rfl

/-- Spec ↔ impl, item 4. -/
theorem spec_ancillary_sound (k : TaxKind) (h : AncillaryTaxSpec k) :
    isAncillaryTax k = true := by
  cases h with
  | latePayment hh => subst hh; decide
  | interest hh => subst hh; decide
  | underDeclaration hh => subst hh; decide
  | nonDeclaration hh => subst hh; decide
  | nonPayment hh => subst hh; decide
  | heavyAdditional hh => subst hh; decide

theorem spec_ancillary_complete (k : TaxKind) (h : isAncillaryTax k = true) :
    AncillaryTaxSpec k := by
  cases k <;> simp [isAncillaryTax] at h
  · exact AncillaryTaxSpec.latePayment _ rfl
  · exact AncillaryTaxSpec.interest _ rfl
  · exact AncillaryTaxSpec.underDeclaration _ rfl
  · exact AncillaryTaxSpec.nonDeclaration _ rfl
  · exact AncillaryTaxSpec.nonPayment _ rfl
  · exact AncillaryTaxSpec.heavyAdditional _ rfl

/-- Spec ↔ impl, item 2. -/
theorem spec_source_collected_sound (k : TaxKind) (h : SourceCollectedNationalTaxSpec k) :
    isSourceCollectedNationalTax k = true := by
  cases h with
  | withholding hh => subst hh; decide
  | specialInternationalTourismCollection hh => subst hh; decide

theorem spec_source_collected_complete (k : TaxKind) (h : isSourceCollectedNationalTax k = true) :
    SourceCollectedNationalTaxSpec k := by
  cases k <;> simp [isSourceCollectedNationalTax] at h
  · exact SourceCollectedNationalTaxSpec.withholding _ rfl
  · exact SourceCollectedNationalTaxSpec.specialInternationalTourismCollection _ rfl

end TaxGeneralSpec

open TaxGeneralSpec

/-- Every item-4 kind is in neither the item-3 enumeration nor the item-2 enumeration. -/
theorem ancillary_not_enumerated_elsewhere (k : TaxKind)
    (h : isAncillaryTax k = true) :
    isConsumptionTaxEtc k = false ∧ isSourceCollectedNationalTax k = false := by
  cases k <;> simp [isAncillaryTax, isConsumptionTaxEtc, isSourceCollectedNationalTax] at h ⊢

/-- What counts as 国税 under the implementation is EXACTLY the complement of the
    five exclusions — spec-complete via the item-1 iff. -/
theorem national_iff_not_excluded (k : TaxKind) :
    isNationalTax k = true ↔ ¬ NationalTaxExcluded k := by
  simp [isNationalTax]

/-- 国税通則法 item 2 kinds whose ancillary taxes are expressly excluded by the
    statute still satisfy item 1 (none is in the exclusion list). -/
theorem source_collected_national (k : TaxKind)
    (h : isSourceCollectedNationalTax k = true) : isNationalTax k = true := by
  cases k <;> simp [isSourceCollectedNationalTax, isNationalTax] at * <;> decide

end JapanTaxLaw
