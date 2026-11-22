import JapanTaxLaw.CustomsTariffArt14ProvisoReadingSpec

/-!
# CustomsTariffArt14ProvisoReadingTests — kernel-checked checks for 第十四条(1) Item 11

Verifies the READING 「この場合においては、前号ただし書の規定を準用する。」: Item 11 triggers the reading of the
preceding item's proviso; other cases do not.
-/

namespace JapanTaxLaw.CustomsTariffArt14ProvisoReading

example : appliesViaReading Case.item11 = true := item11_applies
example : appliesViaReading Case.other = false := other_not_applies
example : readSourceFor Case.item11 = ReadSource.precedingProviso := item11_reads_preceding_proviso
example : Case.item11 ≠ Case.other := by decide
example (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := agree_reading c
example (c : Case) : SpecReadsProviso c ↔ c = Case.item11 := agree_source c

end JapanTaxLaw.CustomsTariffArt14ProvisoReading
