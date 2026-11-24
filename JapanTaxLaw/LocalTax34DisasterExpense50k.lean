import JapanTaxLaw.TaxFinance

/-
# LocalTax34DisasterExpense50k — pinned clause 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 34.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|8e267f1635da519fbb9ef316cdf3ec05a4a08d82d2464c196d50b390ca3aa043.
原文逐語: 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34DisasterExpense50k

open JapanTaxLaw.TaxFinance

/-- 五万 — strict lower (を超え). -/
def threshold : Money := 50_000

/-- 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (50_000 < amount)

end JapanTaxLaw.LocalTax34DisasterExpense50k
