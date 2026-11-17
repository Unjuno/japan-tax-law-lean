import JapanTaxLaw.RegistryQualificationFeesJ1

/-!
# RegistryQualificationFeesJ1 tests — 別表第一（二）三十三〜三十八 flat fee smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw.RegistryQualificationFeesJ1

open JapanTaxLaw.TaxFinance

-- certifiedPersonalInfoProtectionOrgCertFee = 90_000
example : certifiedPersonalInfoProtectionOrgCertFee = 90_000 := by decide
-- securityGuardTrainingOrgRegFee = 90_000
example : securityGuardTrainingOrgRegFee = 90_000 := by decide
-- datingInducementInfoProviderRegFee = 15_000
example : datingInducementInfoProviderRegFee = 15_000 := by decide
-- casinoBusinessLicenseFee = 150_000
example : casinoBusinessLicenseFee = 150_000 := by decide
-- casinoFacilityOperationBusinessLicenseFee = 150_000
example : casinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
-- casinoRelatedEquipmentBusinessPermitFee = 150_000
example : casinoRelatedEquipmentBusinessPermitFee = 150_000 := by decide
-- casinoRelatedEquipmentForeignManufacturerCertFee = 150_000
example : casinoRelatedEquipmentForeignManufacturerCertFee = 150_000 := by decide
-- foreignBankBusinessLicenseFee = 150_000
example : foreignBankBusinessLicenseFee = 150_000 := by decide
-- bankForeignBankAgencyBusinessApprovalFee = 150_000
example : bankForeignBankAgencyBusinessApprovalFee = 150_000 := by decide
-- longTermCreditBankForeignBankAgencyApprovalFee = 150_000
example : longTermCreditBankForeignBankAgencyApprovalFee = 150_000 := by decide
-- bankForeignBranchEstablishmentApprovalFeePerPlace = 150_000
example : bankForeignBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
-- bankForeignOfficeEstablishmentApprovalFeePerPlace = 90_000
example : bankForeignOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
-- bankForeignBusinessOutsourcingContractApprovalFee = 90_000
example : bankForeignBusinessOutsourcingContractApprovalFee = 90_000 := by decide
-- subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace = 150_000
example : subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace = 150_000 := by decide
-- subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace = 90_000
example : subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
-- creditCooperativeBusinessLicenseFee = 150_000
example : creditCooperativeBusinessLicenseFee = 150_000 := by decide
-- creditCooperativeForeignBankAgencyApprovalFee = 150_000
example : creditCooperativeForeignBankAgencyApprovalFee = 150_000 := by decide
-- creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace = 90_000
example : creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace = 90_000 := by decide
-- financialInstitutionConversionApprovalFee = 150_000
example : financialInstitutionConversionApprovalFee = 150_000 := by decide
-- financialInstitutionRegistrationFee = 150_000
example : financialInstitutionRegistrationFee = 150_000 := by decide
-- trustBusinessConcurrentOperationApprovalFee = 150_000
example : trustBusinessConcurrentOperationApprovalFee = 150_000 := by decide
-- bankHoldingCompanyApprovalFee = 150_000
example : bankHoldingCompanyApprovalFee = 150_000 := by decide
-- longTermCreditBankHoldingCompanyApprovalFee = 150_000
example : longTermCreditBankHoldingCompanyApprovalFee = 150_000 := by decide
-- bankAgencyBusinessPermitFee = 90_000
example : bankAgencyBusinessPermitFee = 90_000 := by decide
-- longTermCreditBankAgencyBusinessPermitFee = 90_000
example : longTermCreditBankAgencyBusinessPermitFee = 90_000 := by decide
-- creditCooperativeAgencyBusinessPermitFee = 90_000
example : creditCooperativeAgencyBusinessPermitFee = 90_000 := by decide
-- laborBankAgencyBusinessPermitFee = 90_000
example : laborBankAgencyBusinessPermitFee = 90_000 := by decide
-- creditCooperativeFinancialBusinessAgencyPermitFee = 90_000
example : creditCooperativeFinancialBusinessAgencyPermitFee = 90_000 := by decide
-- electronicPaymentOperatorRegFee = 150_000
example : electronicPaymentOperatorRegFee = 150_000 := by decide
-- creditCooperativeElectronicPaymentOperatorRegFee = 150_000
example : creditCooperativeElectronicPaymentOperatorRegFee = 150_000 := by decide
-- creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee = 150_000
example : creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee = 150_000 := by decide
-- certifiedElectronicPaymentOperatorAssociationCertFee = 150_000
example : certifiedElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
-- certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee = 150_000
example : certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee = 150_000 := by decide
-- certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee = 150_000
example : certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee = 150_000 := by decide
-- electronicPaymentProxyOperatorRegFee = 90_000
example : electronicPaymentProxyOperatorRegFee = 90_000 := by decide
-- creditCooperativeElectronicPaymentProxyOperatorRegFee = 90_000
example : creditCooperativeElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
-- laborBankElectronicPaymentProxyOperatorRegFee = 90_000
example : laborBankElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
-- creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee = 90_000
example : creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee = 90_000 := by decide
-- certifiedElectronicPaymentProxyOperatorAssociationCertFee = 150_000
example : certifiedElectronicPaymentProxyOperatorAssociationCertFee = 150_000 := by decide
-- certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee = 150_000
example : certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
-- certifiedLaborBankElectronicPaymentProxyAssociationCertFee = 150_000
example : certifiedLaborBankElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
-- certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee = 150_000
example : certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee = 150_000 := by decide
-- newInsuranceBusinessLicenseFee = 150_000
example : newInsuranceBusinessLicenseFee = 150_000 := by decide
-- smallShortTermInsuranceBusinessOperatorRegFee = 150_000
example : smallShortTermInsuranceBusinessOperatorRegFee = 150_000 := by decide
-- specialInsuranceBusinessApprovalFee = 150_000
example : specialInsuranceBusinessApprovalFee = 150_000 := by decide
-- insuranceBrokerRegFee = 90_000
example : insuranceBrokerRegFee = 90_000 := by decide
-- specialInsuranceSolicitorRegFee = 15_000
example : specialInsuranceSolicitorRegFee = 15_000 := by decide
-- insuranceClaimsTrustBusinessApprovalFee = 150_000
example : insuranceClaimsTrustBusinessApprovalFee = 150_000 := by decide
-- insuranceHoldingCompanyApprovalFee = 150_000
example : insuranceHoldingCompanyApprovalFee = 150_000 := by decide
-- trustBusinessLicenseFee = 150_000
example : trustBusinessLicenseFee = 150_000 := by decide
-- managementTypeTrustCompanyRegFee = 150_000
example : managementTypeTrustCompanyRegFee = 150_000 := by decide
-- managementTypeForeignTrustCompanyRegFee = 150_000
example : managementTypeForeignTrustCompanyRegFee = 150_000 := by decide
-- selfTrustBusinessRegFee = 150_000
example : selfTrustBusinessRegFee = 150_000 := by decide
-- universityTechnologyTransferApprovedBusinessRegFee = 150_000
example : universityTechnologyTransferApprovedBusinessRegFee = 150_000 := by decide
-- trustContractAgencyRegFee = 90_000
example : trustContractAgencyRegFee = 90_000 := by decide

end JapanTaxLaw.RegistryQualificationFeesJ1
