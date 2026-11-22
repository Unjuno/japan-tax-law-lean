import JapanTaxLaw.CustomsTariffArt14Item10ProvisoReadingSpec

/-!
# CustomsTariffArt14Item10ProvisoReadingTests — kernel-checked checks for 第十四条(1) Item 14

Verifies the READING 「この場合においては、第十号ただし書の規定を準用する。」: Item 14 reads in Item 10's proviso.
-/

namespace JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading

example : appliesViaReading Case.item14 = true := item14_applies
example : appliesViaReading Case.other = false := other_not_applies
example : readSourceFor Case.item14 = ReadSource.item10Proviso := item14_reads_item10_proviso
example : Case.item14 ≠ Case.other := by decide
example (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := agree_reading c
example (c : Case) : SpecReadsItem10 c ↔ c = Case.item14 := agree_source c

end JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading
