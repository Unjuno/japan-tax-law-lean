import JapanTaxLaw.RegistryQualificationFeesJ1

/-!
# RegistryQualificationFeesJ1Spec spec — independent restatement of
       登録免許税法 別表第一（二）三十三〜三十八 の flat fee 額

Sources (pinned; identical to RegistryQualificationFeesJ1.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 三十三〜三十八 の flat 額（全 55 行、割合なし）。
scope boundaries identical to the implementation（三十二 以前・三十九 以降は NOT YET COVERED;
「更新の登録を除く」「政令で定めるものに限る」等の適用判定はすべて caller-established;
三十七（注）のデーミング規定は金額なしで fee def なし）。
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ1

open JapanTaxLaw.TaxFinance

/-- Spec: certifiedPersonalInfoProtectionOrgCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedPersonalInfoProtectionOrgCertFee : Money := 90_000
/-- Spec: securityGuardTrainingOrgRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specsecurityGuardTrainingOrgRegFee : Money := 90_000
/-- Spec: datingInducementInfoProviderRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specdatingInducementInfoProviderRegFee : Money := 15_000
/-- Spec: casinoBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccasinoBusinessLicenseFee : Money := 150_000
/-- Spec: casinoFacilityOperationBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccasinoFacilityOperationBusinessLicenseFee : Money := 150_000
/-- Spec: casinoRelatedEquipmentBusinessPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccasinoRelatedEquipmentBusinessPermitFee : Money := 150_000
/-- Spec: casinoRelatedEquipmentForeignManufacturerCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccasinoRelatedEquipmentForeignManufacturerCertFee : Money := 150_000
/-- Spec: foreignBankBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def specforeignBankBusinessLicenseFee : Money := 150_000
/-- Spec: bankForeignBankAgencyBusinessApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specbankForeignBankAgencyBusinessApprovalFee : Money := 150_000
/-- Spec: longTermCreditBankForeignBankAgencyApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def speclongTermCreditBankForeignBankAgencyApprovalFee : Money := 150_000
/-- Spec: bankForeignBranchEstablishmentApprovalFeePerPlace（三十三〜三十八 flat fee、独立定式）。 -/
def specbankForeignBranchEstablishmentApprovalFeePerPlace : Money := 150_000
/-- Spec: bankForeignOfficeEstablishmentApprovalFeePerPlace（三十三〜三十八 flat fee、独立定式）。 -/
def specbankForeignOfficeEstablishmentApprovalFeePerPlace : Money := 90_000
/-- Spec: bankForeignBusinessOutsourcingContractApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specbankForeignBusinessOutsourcingContractApprovalFee : Money := 90_000
/-- Spec: subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace（三十三〜三十八 flat fee、独立定式）。 -/
def specsubsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace : Money := 150_000
/-- Spec: subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace（三十三〜三十八 flat fee、独立定式）。 -/
def specsubsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace : Money := 90_000
/-- Spec: creditCooperativeBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeBusinessLicenseFee : Money := 150_000
/-- Spec: creditCooperativeForeignBankAgencyApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeForeignBankAgencyApprovalFee : Money := 150_000
/-- Spec: creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeSubOfficeEstablishmentApprovalFeePerPlace : Money := 90_000
/-- Spec: financialInstitutionConversionApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specfinancialInstitutionConversionApprovalFee : Money := 150_000
/-- Spec: financialInstitutionRegistrationFee（三十三〜三十八 flat fee、独立定式）。 -/
def specfinancialInstitutionRegistrationFee : Money := 150_000
/-- Spec: trustBusinessConcurrentOperationApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def spectrustBusinessConcurrentOperationApprovalFee : Money := 150_000
/-- Spec: bankHoldingCompanyApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specbankHoldingCompanyApprovalFee : Money := 150_000
/-- Spec: longTermCreditBankHoldingCompanyApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def speclongTermCreditBankHoldingCompanyApprovalFee : Money := 150_000
/-- Spec: bankAgencyBusinessPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def specbankAgencyBusinessPermitFee : Money := 90_000
/-- Spec: longTermCreditBankAgencyBusinessPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def speclongTermCreditBankAgencyBusinessPermitFee : Money := 90_000
/-- Spec: creditCooperativeAgencyBusinessPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeAgencyBusinessPermitFee : Money := 90_000
/-- Spec: laborBankAgencyBusinessPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def speclaborBankAgencyBusinessPermitFee : Money := 90_000
/-- Spec: creditCooperativeFinancialBusinessAgencyPermitFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeFinancialBusinessAgencyPermitFee : Money := 90_000
/-- Spec: electronicPaymentOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specelectronicPaymentOperatorRegFee : Money := 150_000
/-- Spec: creditCooperativeElectronicPaymentOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeElectronicPaymentOperatorRegFee : Money := 150_000
/-- Spec: creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee : Money := 150_000
/-- Spec: certifiedElectronicPaymentOperatorAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedElectronicPaymentOperatorAssociationCertFee : Money := 150_000
/-- Spec: certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee : Money := 150_000
/-- Spec: certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee : Money := 150_000
/-- Spec: electronicPaymentProxyOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specelectronicPaymentProxyOperatorRegFee : Money := 90_000
/-- Spec: creditCooperativeElectronicPaymentProxyOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeElectronicPaymentProxyOperatorRegFee : Money := 90_000
/-- Spec: laborBankElectronicPaymentProxyOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def speclaborBankElectronicPaymentProxyOperatorRegFee : Money := 90_000
/-- Spec: creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccreditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee : Money := 90_000
/-- Spec: certifiedElectronicPaymentProxyOperatorAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedElectronicPaymentProxyOperatorAssociationCertFee : Money := 150_000
/-- Spec: certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee : Money := 150_000
/-- Spec: certifiedLaborBankElectronicPaymentProxyAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedLaborBankElectronicPaymentProxyAssociationCertFee : Money := 150_000
/-- Spec: certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee（三十三〜三十八 flat fee、独立定式）。 -/
def speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee : Money := 150_000
/-- Spec: newInsuranceBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def specnewInsuranceBusinessLicenseFee : Money := 150_000
/-- Spec: smallShortTermInsuranceBusinessOperatorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specsmallShortTermInsuranceBusinessOperatorRegFee : Money := 150_000
/-- Spec: specialInsuranceBusinessApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specspecialInsuranceBusinessApprovalFee : Money := 150_000
/-- Spec: insuranceBrokerRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specinsuranceBrokerRegFee : Money := 90_000
/-- Spec: specialInsuranceSolicitorRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specspecialInsuranceSolicitorRegFee : Money := 15_000
/-- Spec: insuranceClaimsTrustBusinessApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specinsuranceClaimsTrustBusinessApprovalFee : Money := 150_000
/-- Spec: insuranceHoldingCompanyApprovalFee（三十三〜三十八 flat fee、独立定式）。 -/
def specinsuranceHoldingCompanyApprovalFee : Money := 150_000
/-- Spec: trustBusinessLicenseFee（三十三〜三十八 flat fee、独立定式）。 -/
def spectrustBusinessLicenseFee : Money := 150_000
/-- Spec: managementTypeTrustCompanyRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specmanagementTypeTrustCompanyRegFee : Money := 150_000
/-- Spec: managementTypeForeignTrustCompanyRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specmanagementTypeForeignTrustCompanyRegFee : Money := 150_000
/-- Spec: selfTrustBusinessRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specselfTrustBusinessRegFee : Money := 150_000
/-- Spec: universityTechnologyTransferApprovedBusinessRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def specuniversityTechnologyTransferApprovedBusinessRegFee : Money := 150_000
/-- Spec: trustContractAgencyRegFee（三十三〜三十八 flat fee、独立定式）。 -/
def spectrustContractAgencyRegFee : Money := 90_000

example : speccertifiedPersonalInfoProtectionOrgCertFee = 90_000 := by decide
example : specsecurityGuardTrainingOrgRegFee = 90_000 := by decide
example : specdatingInducementInfoProviderRegFee = 15_000 := by decide
example : speccasinoBusinessLicenseFee = 150_000 := by decide
example : speccasinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
example : speccasinoRelatedEquipmentBusinessPermitFee = 150_000 := by decide
example : speccasinoRelatedEquipmentForeignManufacturerCertFee = 150_000 := by decide
example : specforeignBankBusinessLicenseFee = 150_000 := by decide
example : specbankForeignBankAgencyBusinessApprovalFee = 150_000 := by decide
example : speclongTermCreditBankForeignBankAgencyApprovalFee = 150_000 := by decide
example : specbankForeignBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
example : specbankForeignOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : specbankForeignBusinessOutsourcingContractApprovalFee = 90_000 := by decide
example : specsubsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
example : specsubsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : speccreditCooperativeBusinessLicenseFee = 150_000 := by decide
example : speccreditCooperativeForeignBankAgencyApprovalFee = 150_000 := by decide
example : speccreditCooperativeSubOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
example : specfinancialInstitutionConversionApprovalFee = 150_000 := by decide
example : specfinancialInstitutionRegistrationFee = 150_000 := by decide
example : spectrustBusinessConcurrentOperationApprovalFee = 150_000 := by decide
example : specbankHoldingCompanyApprovalFee = 150_000 := by decide
example : speclongTermCreditBankHoldingCompanyApprovalFee = 150_000 := by decide
example : specbankAgencyBusinessPermitFee = 90_000 := by decide
example : speclongTermCreditBankAgencyBusinessPermitFee = 90_000 := by decide
example : speccreditCooperativeAgencyBusinessPermitFee = 90_000 := by decide
example : speclaborBankAgencyBusinessPermitFee = 90_000 := by decide
example : speccreditCooperativeFinancialBusinessAgencyPermitFee = 90_000 := by decide
example : specelectronicPaymentOperatorRegFee = 150_000 := by decide
example : speccreditCooperativeElectronicPaymentOperatorRegFee = 150_000 := by decide
example : speccreditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee = 150_000 := by decide
example : speccertifiedElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
example : speccertifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
example : speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee = 150_000 := by decide
example : specelectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : speccreditCooperativeElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : speclaborBankElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : speccreditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
example : speccertifiedElectronicPaymentProxyOperatorAssociationCertFee = 150_000 := by decide
example : speccertifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : speccertifiedLaborBankElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
example : specnewInsuranceBusinessLicenseFee = 150_000 := by decide
example : specsmallShortTermInsuranceBusinessOperatorRegFee = 150_000 := by decide
example : specspecialInsuranceBusinessApprovalFee = 150_000 := by decide
example : specinsuranceBrokerRegFee = 90_000 := by decide
example : specspecialInsuranceSolicitorRegFee = 15_000 := by decide
example : specinsuranceClaimsTrustBusinessApprovalFee = 150_000 := by decide
example : specinsuranceHoldingCompanyApprovalFee = 150_000 := by decide
example : spectrustBusinessLicenseFee = 150_000 := by decide
example : specmanagementTypeTrustCompanyRegFee = 150_000 := by decide
example : specmanagementTypeForeignTrustCompanyRegFee = 150_000 := by decide
example : specselfTrustBusinessRegFee = 150_000 := by decide
example : specuniversityTechnologyTransferApprovedBusinessRegFee = 150_000 := by decide
example : spectrustContractAgencyRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/

def agreeRegistryQualificationFeesJ1 : Bool :=
  speccertifiedPersonalInfoProtectionOrgCertFee == certifiedPersonalInfoProtectionOrgCertFee &&
  specsecurityGuardTrainingOrgRegFee == securityGuardTrainingOrgRegFee &&
  specdatingInducementInfoProviderRegFee == datingInducementInfoProviderRegFee &&
  speccasinoBusinessLicenseFee == casinoBusinessLicenseFee &&
  speccasinoFacilityOperationBusinessLicenseFee == casinoFacilityOperationBusinessLicenseFee &&
  speccasinoRelatedEquipmentBusinessPermitFee == casinoRelatedEquipmentBusinessPermitFee &&
  speccasinoRelatedEquipmentForeignManufacturerCertFee == casinoRelatedEquipmentForeignManufacturerCertFee &&
  specforeignBankBusinessLicenseFee == foreignBankBusinessLicenseFee &&
  specbankForeignBankAgencyBusinessApprovalFee == bankForeignBankAgencyBusinessApprovalFee &&
  speclongTermCreditBankForeignBankAgencyApprovalFee == longTermCreditBankForeignBankAgencyApprovalFee &&
  specbankForeignBranchEstablishmentApprovalFeePerPlace == bankForeignBranchEstablishmentApprovalFeePerPlace &&
  specbankForeignOfficeEstablishmentApprovalFeePerPlace == bankForeignOfficeEstablishmentApprovalFeePerPlace &&
  specbankForeignBusinessOutsourcingContractApprovalFee == bankForeignBusinessOutsourcingContractApprovalFee &&
  specsubsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace == subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace &&
  specsubsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace == subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace &&
  speccreditCooperativeBusinessLicenseFee == creditCooperativeBusinessLicenseFee &&
  speccreditCooperativeForeignBankAgencyApprovalFee == creditCooperativeForeignBankAgencyApprovalFee &&
  speccreditCooperativeSubOfficeEstablishmentApprovalFeePerPlace == creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace &&
  specfinancialInstitutionConversionApprovalFee == financialInstitutionConversionApprovalFee &&
  specfinancialInstitutionRegistrationFee == financialInstitutionRegistrationFee &&
  spectrustBusinessConcurrentOperationApprovalFee == trustBusinessConcurrentOperationApprovalFee &&
  specbankHoldingCompanyApprovalFee == bankHoldingCompanyApprovalFee &&
  speclongTermCreditBankHoldingCompanyApprovalFee == longTermCreditBankHoldingCompanyApprovalFee &&
  specbankAgencyBusinessPermitFee == bankAgencyBusinessPermitFee &&
  speclongTermCreditBankAgencyBusinessPermitFee == longTermCreditBankAgencyBusinessPermitFee &&
  speccreditCooperativeAgencyBusinessPermitFee == creditCooperativeAgencyBusinessPermitFee &&
  speclaborBankAgencyBusinessPermitFee == laborBankAgencyBusinessPermitFee &&
  speccreditCooperativeFinancialBusinessAgencyPermitFee == creditCooperativeFinancialBusinessAgencyPermitFee &&
  specelectronicPaymentOperatorRegFee == electronicPaymentOperatorRegFee &&
  speccreditCooperativeElectronicPaymentOperatorRegFee == creditCooperativeElectronicPaymentOperatorRegFee &&
  speccreditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee == creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee &&
  speccertifiedElectronicPaymentOperatorAssociationCertFee == certifiedElectronicPaymentOperatorAssociationCertFee &&
  speccertifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee == certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee &&
  speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee == certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee &&
  specelectronicPaymentProxyOperatorRegFee == electronicPaymentProxyOperatorRegFee &&
  speccreditCooperativeElectronicPaymentProxyOperatorRegFee == creditCooperativeElectronicPaymentProxyOperatorRegFee &&
  speclaborBankElectronicPaymentProxyOperatorRegFee == laborBankElectronicPaymentProxyOperatorRegFee &&
  speccreditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee == creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee &&
  speccertifiedElectronicPaymentProxyOperatorAssociationCertFee == certifiedElectronicPaymentProxyOperatorAssociationCertFee &&
  speccertifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee == certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee &&
  speccertifiedLaborBankElectronicPaymentProxyAssociationCertFee == certifiedLaborBankElectronicPaymentProxyAssociationCertFee &&
  speccertifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee == certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee &&
  specnewInsuranceBusinessLicenseFee == newInsuranceBusinessLicenseFee &&
  specsmallShortTermInsuranceBusinessOperatorRegFee == smallShortTermInsuranceBusinessOperatorRegFee &&
  specspecialInsuranceBusinessApprovalFee == specialInsuranceBusinessApprovalFee &&
  specinsuranceBrokerRegFee == insuranceBrokerRegFee &&
  specspecialInsuranceSolicitorRegFee == specialInsuranceSolicitorRegFee &&
  specinsuranceClaimsTrustBusinessApprovalFee == insuranceClaimsTrustBusinessApprovalFee &&
  specinsuranceHoldingCompanyApprovalFee == insuranceHoldingCompanyApprovalFee &&
  spectrustBusinessLicenseFee == trustBusinessLicenseFee &&
  specmanagementTypeTrustCompanyRegFee == managementTypeTrustCompanyRegFee &&
  specmanagementTypeForeignTrustCompanyRegFee == managementTypeForeignTrustCompanyRegFee &&
  specselfTrustBusinessRegFee == selfTrustBusinessRegFee &&
  specuniversityTechnologyTransferApprovedBusinessRegFee == universityTechnologyTransferApprovedBusinessRegFee &&
  spectrustContractAgencyRegFee == trustContractAgencyRegFee

example : agreeRegistryQualificationFeesJ1 = true := by decide

end JapanTaxLaw.RegistryQualificationFeesJ1
