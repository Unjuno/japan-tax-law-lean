import JapanTaxLaw.TaxFinance

/-
# LocalTax34SpouseOver13M — pinned clause 「前年の合計所得金額が百三十万円を超える配偶者」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|e8ea306ce417e4feb430f6ef06a3d2c98e7735d0005cd5fdfbc31e47211248e6.
原文逐語: 「前年の合計所得金額が百三十万円を超える配偶者」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34SpouseOver13M

open JapanTaxLaw.TaxFinance

/-- 百三十万 — strict lower (を超え). -/
def threshold : Money := 1_300_000

/-- 「前年の合計所得金額が百三十万円を超える配偶者」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (1_300_000 < amount)

end JapanTaxLaw.LocalTax34SpouseOver13M
