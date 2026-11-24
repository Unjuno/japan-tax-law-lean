import JapanTaxLaw.TaxFinance

/-
# LocalTax71_14Over3M — pinned clause 「三百万円を超える部分に相当する金額」

Pinned source: law 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 71_14.
Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json; normative unit NORM|87d05338f85a8ae5280c7369006feb6ca85c6f03bda61f8ac75798a14b22bb3b.
原文逐語: 「三百万円を超える部分に相当する金額」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax71_14Over3M

open JapanTaxLaw.TaxFinance

/-- 三百万 — strict lower bound (を超え). -/
def threshold : Money := 3_000_000

/-- 「三百万円を超える部分に相当する金額」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (3_000_000 < amount)

end JapanTaxLaw.LocalTax71_14Over3M
