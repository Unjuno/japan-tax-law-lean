import JapanTaxLaw.TaxFinance

/-
# LocalTax71_14UpTo500k — pinned clause 「五十万円以下の部分に相当する金額」

Pinned source: law 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 71_14.
Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json; normative unit NORM|7d61638c8ae1bc009300375e9f58a7c5ca80224ddaaf05117f14f9774b62d419.
原文逐語: 「五十万円以下の部分に相当する金額」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax71_14UpTo500k

open JapanTaxLaw.TaxFinance

/-- 五十万 — inclusive upper bound (以下). -/
def threshold : Money := 500_000

/-- 「五十万円以下の部分に相当する金額」. -/
def inScope (amount : Money) : Prop := amount ≤ threshold


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 500_000)

end JapanTaxLaw.LocalTax71_14UpTo500k
