import JapanTaxLaw.TaxFinance
/- LocalTax34IncomeUpTo24M — 「当該納税義務者の前年の合計所得金額が二千四百万円以下である場合」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|5e4872d35b2a0abab15642ee73a30f320140bdea2c5c97f7653656d69b31fe9d.
原文逐語: 「当該納税義務者の前年の合計所得金額が二千四百万円以下である場合」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34IncomeUpTo24M
open JapanTaxLaw.TaxFinance
/-- 二千四百万 — inclusive upper (以下). -/
def threshold : Money := 24_000_000

/-- 「当該納税義務者の前年の合計所得金額が二千四百万円以下である場合」. -/
def inScope (a : Money) : Prop := a ≤ threshold


def inScopeBool (amount : Money) : Bool := decide (amount ≤ 24_000_000)
end JapanTaxLaw.LocalTax34IncomeUpTo24M
