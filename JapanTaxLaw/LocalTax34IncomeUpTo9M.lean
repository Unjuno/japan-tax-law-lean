import JapanTaxLaw.TaxFinance

/-
# LocalTax34IncomeUpTo9M — pinned clause 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|f956dd02828460c5a2e85d5872758fe30b558869817ddc6ace17082335b151f2.
原文逐語: 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34IncomeUpTo9M

open JapanTaxLaw.TaxFinance

/-- 九百万 — inclusive upper (以下). -/
def threshold : Money := 9_000_000

/-- 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」. -/
def inScope (amount : Money) : Prop := amount ≤ threshold


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 9_000_000)

end JapanTaxLaw.LocalTax34IncomeUpTo9M
