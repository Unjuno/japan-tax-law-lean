import JapanTaxLaw.LocalObligor

/-!
# LocalObligor tests — 地方税法 Act art. 24(1) items 一, 二, 三, 四, 四の二 smoke checks

Decidable smoke checks for the Act art. 24(1) actor classification.
Scope limited to Act art. 24(1)（一〜四の二）and the track verdicts;
items 五–七 and paras. 2–9 are recorded as unsupported limits.
-/

namespace JapanTaxLaw

-- ==================== track verdicts ====================

example : equalAndIncomeTrack { individualWithResidentAddress := .yes,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = Verdict.yes := by decide

example : equalAndIncomeTrack { individualWithResidentAddress := .conflict,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = Verdict.conflict := by decide

example : equalOnlyTrack { individualWithResidentAddress := .no,
                           individualOfficeNoAddress := .yes,
                           corporationWithOffice := .no,
                           corporationDormitoryOnly := .no,
                           trustElectPersonWithOffice := .no } = Verdict.yes := by decide

example : equalOnlyTrack { individualWithResidentAddress := .no,
                           individualOfficeNoAddress := .conflict,
                           corporationWithOffice := .no,
                           corporationDormitoryOnly := .yes,
                           trustElectPersonWithOffice := .no } = Verdict.yes := by decide

example : equalOnlyTrack { individualWithResidentAddress := .no,
                           individualOfficeNoAddress := .no,
                           corporationWithOffice := .no,
                           corporationDormitoryOnly := .unknown,
                           trustElectPersonWithOffice := .no } = Verdict.unknown := by decide

example : equalPlusCorporateTrack { individualWithResidentAddress := .no,
                                    individualOfficeNoAddress := .no,
                                    corporationWithOffice := .unknown,
                                    corporationDormitoryOnly := .no,
                                    trustElectPersonWithOffice := .no } = Verdict.unknown := by decide

example : corporateOnlyTrack { individualWithResidentAddress := .no,
                               individualOfficeNoAddress := .no,
                               corporationWithOffice := .no,
                               corporationDormitoryOnly := .no,
                               trustElectPersonWithOffice := .yes } = Verdict.yes := by decide

-- ==================== classification ====================

example : classifyLocalObligor { individualWithResidentAddress := .yes,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .equalAndIncome := by decide

example : classifyLocalObligor { individualWithResidentAddress := .no,
                                 individualOfficeNoAddress := .yes,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .equalOnlyIndividual := by decide

example : classifyLocalObligor { individualWithResidentAddress := .no,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .yes,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .equalPlusCorporate := by decide

example : classifyLocalObligor { individualWithResidentAddress := .no,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .yes,
                                 trustElectPersonWithOffice := .no } = .equalOnlyDormitory := by decide

example : classifyLocalObligor { individualWithResidentAddress := .no,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .yes } = .corporateOnly := by decide

-- Multiple items affirmatively established: statute admits both; no preference
example : classifyLocalObligor { individualWithResidentAddress := .yes,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .yes,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .multipleApplicable := by decide

example : classifyLocalObligor { individualWithResidentAddress := .yes,
                                 individualOfficeNoAddress := .yes,
                                 corporationWithOffice := .yes,
                                 corporationDormitoryOnly := .yes,
                                 trustElectPersonWithOffice := .yes } = .multipleApplicable := by decide

-- Unknown without affirmatives: undetermined
example : classifyLocalObligor { individualWithResidentAddress := .unknown,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .undetermined := by decide

-- All denied: nothing established
example : classifyLocalObligor { individualWithResidentAddress := .no,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .notEstablished := by decide

-- Any contradiction: inconsistent (does not silently become "not established")
example : classifyLocalObligor { individualWithResidentAddress := .conflict,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .no } = .inconsistent := by decide

example : classifyLocalObligor { individualWithResidentAddress := .yes,
                                 individualOfficeNoAddress := .no,
                                 corporationWithOffice := .no,
                                 corporationDormitoryOnly := .no,
                                 trustElectPersonWithOffice := .conflict } = .inconsistent := by decide

end JapanTaxLaw
