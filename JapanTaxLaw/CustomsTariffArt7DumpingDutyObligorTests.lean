import JapanTaxLaw.CustomsTariffArt7DumpingDutyObligorSpec

/-!
# CustomsTariffArt7DumpingDutyObligorTests — kernel-checked checks

Verifies EFFECT 「前項の相殺関税は、当該相殺関税を課されることとなる貨物の輸入者が納める義務があるものとする。」: importer bears duty, other not.
-/

namespace JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor

example : obligor = Obligor.importer := obligor_is_importer
example : dutyObligation := importer_bears_duty
example : obligor ≠ Obligor.other := other_not_selected
example : SpecObligor obligor := implementation_satisfies_spec
example : ¬ SpecObligor Obligor.other := other_not_satisfying

end JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor
