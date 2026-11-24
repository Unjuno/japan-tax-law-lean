import JapanTaxLaw.TaxFinance
/- LocalTax34Income950M1000M — 「当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|3db09a5f8547e9bd59b725662975561d9731a3032ce2ef7f3c17689b632e03c4.
原文逐語: 「当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34Income950M1000M
open JapanTaxLaw.TaxFinance
/-- strict lower (を超え). -/
def lower : Money := 9_500_000

/-- inclusive upper (以下). -/
def upper : Money := 10_000_000

/-- 「当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合」. -/
def inScope (a : Money) : Prop := lower < a ∧ a ≤ upper


def inScopeBool (amount : Money) : Bool := decide (9_500_000 < amount ∧ amount ≤ 10_000_000)
end JapanTaxLaw.LocalTax34Income950M1000M
