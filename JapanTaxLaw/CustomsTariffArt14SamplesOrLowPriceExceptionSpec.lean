import JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException

/-!
# CustomsTariffArt14SamplesOrLowPriceExceptionSpec — independent spec for 関税定率法 第十四条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十四条(1) Item#6 ただし書 — the duty-free item is limited (に限る) to
         samples-only goods OR significantly-low-price goods prescribed by 政令.
Normative unit: NORM|5730c2683082200288f2ec845009841a40eaab89c639586c3635625810b5edd3

The implementation is a Bool function `withinException : ItemClass -> Bool` that
returns true for the two listed classes. The independent spec states the same
scope restriction as a PROPOSITIONAL disjunction and proves the function agrees
for all item classes. Kernel checks axiom-free by exhaustive `cases` over the
finite inductive type (no BEq, no Classical.choice).

The 「又は」 disjunction is captured: the two classes are alternatives; `other`
is outside the exception. 政令-determination of low price is not modeled.

Not modelled: the underlying duty-free item, how 政令 determines low price,
other items/articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException

/-- Independent spec: the exception scope as a propositional disjunction. -/
def SpecWithinException (c : ItemClass) : Prop :=
  c = ItemClass.samplesOnly ∨ c = ItemClass.lowPriceByOrder

/-- The implementation agrees with the spec, for all item classes. Axiom-free. -/
theorem agree_within_exception (c : ItemClass) :
    (withinException c = true) ↔ SpecWithinException c := by
  cases c <;> simp [withinException, SpecWithinException]

/-- The two listed classes are inside the exception. -/
theorem samples_inside : withinException ItemClass.samplesOnly = true := rfl
theorem lowprice_inside : withinException ItemClass.lowPriceByOrder = true := rfl

/-- The `other` class is outside the exception (に限る scope restriction). -/
theorem other_outside : withinException ItemClass.other = false := rfl

/-- The two listed classes are distinct. -/
theorem classes_distinct : ItemClass.samplesOnly ≠ ItemClass.lowPriceByOrder := by
  decide

end JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException
