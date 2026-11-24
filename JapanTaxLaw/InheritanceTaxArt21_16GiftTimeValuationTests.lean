import JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuationSpec

/-!
# InheritanceTaxArt21_16GiftTimeValuationTests — kernel-checked checks

Verifies EFFECT 「当該財産の価額は、第一項の贈与の時における価額とする。」: value fixed at the gift time, not another time.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation

example : valuationTime = ValuationTime.giftTime := time_is_gift
example : valuationTime ≠ ValuationTime.other := time_not_other
example : SpecValuationTime valuationTime := implementation_satisfies_spec
example : ¬ SpecValuationTime ValuationTime.other := other_not_satisfying

end JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation
