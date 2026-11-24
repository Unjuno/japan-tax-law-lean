import JapanTaxLaw.TaxFinance

/-
# LocalTax34SpouseBand1M13M — pinned clause 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|7117de618d43cf614fa912ffa4678f65aaed65075b573c3fd946b0a99296d4f1.
原文逐語: 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34SpouseBand1M13M

open JapanTaxLaw.TaxFinance

/-- strict lower (を超え). -/
def lower : Money := 1_000_000

/-- inclusive upper (以下). -/
def upper : Money := 1_300_000

/-- 「前年の合計所得金額が百万円を超え百三十万円以下である配偶者」. -/
def inScope (amount : Money) : Prop := lower < amount ∧ amount ≤ upper


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (1_000_000 < amount ∧ amount ≤ 1_300_000)

end JapanTaxLaw.LocalTax34SpouseBand1M13M
