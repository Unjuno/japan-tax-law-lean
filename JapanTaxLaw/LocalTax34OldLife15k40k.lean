import JapanTaxLaw.TaxFinance
/- LocalTax34OldLife15k40k — 「前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|358241fbdf9cba4c14a5567eeb940a3b77447ed82fd302f5a6b221ce581fc929.
原文逐語: 「前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34OldLife15k40k
open JapanTaxLaw.TaxFinance
/-- strict lower (を超え). -/
def lower : Money := 15_000

/-- inclusive upper (以下). -/
def upper : Money := 40_000

/-- 「前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」. -/
def inScope (a : Money) : Prop := lower < a ∧ a ≤ upper


def inScopeBool (amount : Money) : Bool := decide (15_000 < amount ∧ amount ≤ 40_000)
end JapanTaxLaw.LocalTax34OldLife15k40k
