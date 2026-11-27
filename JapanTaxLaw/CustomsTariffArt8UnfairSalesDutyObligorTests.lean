import JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligorSpec

/-!
# CustomsTariffArt8UnfairSalesDutyObligorTests — kernel-checked checks

Verifies EFFECT 「前項の不当廉売関税は、当該不当廉売関税を課されることとなる貨物の輸入者が納める義務があるものとする。」: importer bears duty, other not.
-/

namespace JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligor

example : obligor = Obligor.importer := obligor_is_importer
example : dutyObligation := importer_bears_duty
example : obligor ≠ Obligor.other := other_not_selected
example : SpecObligor obligor := implementation_satisfies_spec
example : ¬ SpecObligor Obligor.other := other_not_satisfying

end JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligor
