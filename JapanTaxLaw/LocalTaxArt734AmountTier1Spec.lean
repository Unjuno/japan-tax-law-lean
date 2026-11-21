import JapanTaxLaw.LocalTaxArt734AmountTier1

/-!
# LocalTaxArt734AmountTier1Spec — independent spec for 地方税法 第七百三十四条(3)

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第七百三十四条(3) — conditional dual amount ¥120,000 / ¥140,000
Normative unit: NORM|41efee8e91f1bcde685ed332b7b7d8e7b2d82fa083062d8f7d0a45e5503c57c7

The implementation stores the two amounts. The independent spec expresses them
via their difference: `alternativeAmountYen = baseAmountYen + 20_000` — a
distinct decomposition claim. Kernel checks it axiom-free.

Not modelled: the office-location condition, tax base, other table rows, other
paragraphs and other articles.
-/

namespace JapanTaxLaw.LocalTaxArt734AmountTier1

open JapanTaxLaw.TaxFinance

/-- Independent spec: difference between the two amounts. -/
def specDifferenceYen : Money := 20_000

/-- Decomposition: alternative = base + difference. Axiom-free. -/
theorem agree_amount_difference :
    alternativeAmountYen = baseAmountYen + specDifferenceYen := by
  unfold alternativeAmountYen baseAmountYen specDifferenceYen
  decide

end JapanTaxLaw.LocalTaxArt734AmountTier1
