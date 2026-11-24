import JapanTaxLaw.TaxFinance

/-
# LocalTax34OldLifeInsurance70k — pinned clause 「前年中に支払つた旧生命保険料の金額の合計額が七万円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|4ef6cc90eeaf8145a4903f974919bde5ac5e3c5ffe0aab21c7661243c8f5067f.
原文逐語: 「前年中に支払つた旧生命保険料の金額の合計額が七万円を超える場合」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34OldLifeInsurance70k

open JapanTaxLaw.TaxFinance

/-- 七万 — strict lower (を超え). -/
def threshold : Money := 70_000

/-- 「前年中に支払つた旧生命保険料の金額の合計額が七万円を超える場合」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (70_000 < amount)

end JapanTaxLaw.LocalTax34OldLifeInsurance70k
