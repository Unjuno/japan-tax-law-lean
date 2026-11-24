import JapanTaxLaw.TaxFinance
/- LocalTax34Age16Plus — 「年齢十六歳以上の者」
Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34; unit NORM|27e5502e8b621ca04953dba0a121d0629a5816344f55d4b6c2390934c8072651.
原文逐語: 「年齢十六歳以上の者」
Scope: ONLY the threshold/tier; rates, other tiers and other articles NOT MODELLED.
No sorry/admit/Classical.choice. -/
namespace JapanTaxLaw.LocalTax34Age16Plus
open JapanTaxLaw.TaxFinance
/-- 十六 — inclusive lower (以上). -/
def threshold : Money := 16

/-- 「年齢十六歳以上の者」: 16 qualifies (以上 is inclusive). -/
def inScope (a : Money) : Prop := threshold ≤ a


def inScopeBool (amount : Money) : Bool := decide (16 ≤ amount)
end JapanTaxLaw.LocalTax34Age16Plus
