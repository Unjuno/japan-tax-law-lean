import JapanTaxLaw.TaxFinance
/- LocalTax34SpouseUpTo1M — 「前年の合計所得金額が百万円以下である配偶者」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|7c6e6e5da92b15fbfb3ba6700fd42b24e73bbfc5ad8c234fa9e5e6d4011ab731.
原文逐語: 「前年の合計所得金額が百万円以下である配偶者」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34SpouseUpTo1M
open JapanTaxLaw.TaxFinance
/-- 百万 — inclusive upper (以下). -/
def threshold : Money := 1_000_000

/-- 「前年の合計所得金額が百万円以下である配偶者」. -/
def inScope (a : Money) : Prop := a ≤ threshold


def inScopeBool (amount : Money) : Bool := decide (amount ≤ 1_000_000)
end JapanTaxLaw.LocalTax34SpouseUpTo1M
