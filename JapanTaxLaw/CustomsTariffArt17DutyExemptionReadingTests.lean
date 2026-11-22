import JapanTaxLaw.CustomsTariffArt17DutyExemptionReadingSpec

/-!
# CustomsTariffArt17DutyExemptionReadingTests — kernel-checked checks for 第十七条(2)

Verifies the READING 「第十三条第三項の規定は、前項の規定により関税を免除する場合について準用する。」: the exemption case reads in Article 13(3).
-/

namespace JapanTaxLaw.CustomsTariffArt17DutyExemptionReading

example : appliesViaReading Case.dutyExempted = true := dutyExempted_applies
example : appliesViaReading Case.other = false := other_not_applies
example : readSourceFor Case.dutyExempted = ReadSource.article13Para3 := dutyExempted_reads_article13
example : Case.dutyExempted ≠ Case.other := by decide
example (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := agree_reading c
example (c : Case) : SpecReadsArticle13 c ↔ c = Case.dutyExempted := agree_source c

end JapanTaxLaw.CustomsTariffArt17DutyExemptionReading
