import JapanTaxLaw.TaxFinance

/-
# LocalTax72_26FiscalYearOver6Months — pinned clause 「（事業年度の期間が六月を超える法人等の中間申告納付）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_26.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|f6d9c9524214966a2a1078a1745a41d7cc3b3429a602081dd743300e9bbe931c.
原文逐語: 「（事業年度の期間が六月を超える法人等の中間申告納付）」
Scope: ONLY the threshold/tier interval of this clause. The interim-return
computation, filing deadlines and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_26FiscalYearOver6Months

open JapanTaxLaw.TaxFinance

/-- 六月 — を超え（strict） threshold (more than six months). -/
def threshold : Nat := 6

/-- 「事業年度の期間が六月を超える法人等」. -/
def inScope (amount : Nat) : Prop := amount > threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount > 6)

end JapanTaxLaw.LocalTax72_26FiscalYearOver6Months
