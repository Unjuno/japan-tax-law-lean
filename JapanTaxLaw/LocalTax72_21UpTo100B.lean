import JapanTaxLaw.TaxFinance

/-
# LocalTax72_21UpTo100B — pinned clause 「千億円以下の金額」

Pinned source: law 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 72_21.
Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json; normative unit NORM|b1a1b0979276977d4cf041c0a1477a3c9a238dd3ff47f25678fb371133d47491.
原文逐語: 「千億円以下の金額」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_21UpTo100B

open JapanTaxLaw.TaxFinance

/-- 千億 — inclusive upper bound (以下). -/
def threshold : Money := 100_000_000_000

/-- 「千億円以下の金額」. -/
def inScope (amount : Money) : Prop := amount ≤ threshold


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 100_000_000_000)

end JapanTaxLaw.LocalTax72_21UpTo100B
