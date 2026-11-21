import JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceExceptionSpec

/-!
# CustomsTariffArt14SamplesOrLowPriceExceptionTests — kernel-checked checks for 関税定率法 第十四条(1)

Verifies the scope-limiting proviso: the duty-free item is limited (に限る) to
samples-only goods OR significantly-low-price goods prescribed by 政令; other
goods are outside the exception; the two listed classes are distinct.
-/

namespace JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException

-- The two listed classes are inside the exception.
example : withinException ItemClass.samplesOnly = true := samples_inside
example : withinException ItemClass.lowPriceByOrder = true := lowprice_inside

-- The `other` class is outside (に限る scope restriction).
example : withinException ItemClass.other = false := other_outside

-- The two listed classes are distinct.
example : ItemClass.samplesOnly ≠ ItemClass.lowPriceByOrder := classes_distinct

-- Universal agreement with the independent propositional spec.
example (c : ItemClass) : (withinException c = true) ↔ SpecWithinException c :=
  agree_within_exception c

end JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException
