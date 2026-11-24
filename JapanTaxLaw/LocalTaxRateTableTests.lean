import JapanTaxLaw.LocalTaxRateTableSpec

/-! Regression tests — 地方税法 11 税目の税率表（千分率). -/

namespace JapanTaxLaw.LocalTaxRateTable

example : ratePerMille RateKind.interestSplit = 50 := by decide
example : ratePerMille RateKind.dividendSplit = 50 := by decide
example : ratePerMille RateKind.shareTransferSplit = 50 := by decide
example : ratePerMille RateKind.miningTax = 10 := by decide
example : ratePerMille RateKind.corporateShareStandardLow = 10 := by decide
example : ratePerMille RateKind.corporateShareStandardHigh = 60 := by decide
example : ratePerMille RateKind.realEstateAcquisition = 40 := by decide
example : ratePerMille RateKind.fixedAsset = 14 := by decide
example : ratePerMille RateKind.separatedIncomeLow = 40 := by decide
example : ratePerMille RateKind.separatedIncomeHigh = 60 := by decide
example : ratePerMille RateKind.idleLandHolding = 14 := by decide

example : ratePerMille RateKind.interestSplit = specRate RateKind.interestSplit := agreeRateTable _
example : ratePerMille RateKind.fixedAsset = specRate RateKind.fixedAsset := agreeRateTable _
example : ratePerMille RateKind.idleLandHolding = specRate RateKind.idleLandHolding := agreeRateTable _

end JapanTaxLaw.LocalTaxRateTable
