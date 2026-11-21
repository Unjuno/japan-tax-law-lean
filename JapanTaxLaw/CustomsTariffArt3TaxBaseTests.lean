import JapanTaxLaw.CustomsTariffArt3TaxBaseSpec

/-!
# CustomsTariffArt3TaxBaseTests — kernel-checked checks for 関税定率法 第三条(1)

Verifies the two-alternative tax base (価格 / 数量): both admissible, distinct,
exhaustive, and boolean classifier agrees with the propositional spec.
-/

namespace JapanTaxLaw.CustomsTariffArt3TaxBase

open JapanTaxLaw.CustomsTariffArt3TaxBase.TaxBase

-- Both statutory alternatives are admissible.
example : isAdmissible price = true := rfl
example : isAdmissible quantity = true := rfl

-- The two alternatives are distinct.
example : price ≠ quantity := TaxBase.price_ne_quantity

-- Exhaustiveness: every base is one of the two.
example (b : TaxBase) : b = price ∨ b = quantity := TaxBase.exhaustive b

-- Enumerated list is exactly the two statutory bases.
example : admissibleBases = [price, quantity] := TaxBase.admissibleBases_exact

-- Boolean classifier agrees with the independent propositional spec, universally.
example (b : TaxBase) : (isAdmissible b = true) ↔ SpecAdmissible b := agree_admissible b
example (b : TaxBase) : b ∈ admissibleBases ↔ SpecAdmissible b := enumerated_matches_spec b

end JapanTaxLaw.CustomsTariffArt3TaxBase
