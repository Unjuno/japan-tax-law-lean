import JapanTaxLaw.TaxFinance

/-
# LocalTax34NewLifeInsurance56k — pinned clause 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|2d64a41b267757d442e7ff002cfb4b17275c4ca8b8aa28d7b85f83eff968bee3.
原文逐語: 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34NewLifeInsurance56k

open JapanTaxLaw.TaxFinance

/-- 五万六千 — strict lower (を超え). -/
def threshold : Money := 56_000

/-- 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (56_000 < amount)

end JapanTaxLaw.LocalTax34NewLifeInsurance56k
