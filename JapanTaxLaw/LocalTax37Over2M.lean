import JapanTaxLaw.TaxFinance

/-
# LocalTax37Over2M — pinned clause 「二百万円を超える場合」

Pinned source: law 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 37.
Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json; normative unit NORM|92faec2b1932766778a63dcb97b8d8c74d7a9fbc4c4eba57a3791ca8dfec8488.
原文逐語: 「二百万円を超える場合」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37Over2M

open JapanTaxLaw.TaxFinance

/-- 二百万 — strict lower bound (を超え). -/
def threshold : Money := 2_000_000

/-- 「二百万円を超える場合」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (2_000_000 < amount)

end JapanTaxLaw.LocalTax37Over2M
