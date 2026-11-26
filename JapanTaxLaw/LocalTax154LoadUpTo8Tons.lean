import JapanTaxLaw.TaxFinance

/-
# LocalTax154LoadUpTo8Tons — pinned clause 「（ｉｉ）　普通自動車であるもので最大積載量が八トン以下のもの」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 154.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|e2bbd47326d18c5ecc8cda90f94e92d81011cdde5ebc8a7c0f084998ec119812.
原文逐語: 「（ｉｉ）　普通自動車であるもので最大積載量が八トン以下のもの」
Scope: ONLY the threshold/tier interval of this clause. The classification,
rates and other rows/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax154LoadUpTo8Tons

open JapanTaxLaw.TaxFinance

/-- 八トン — 以下（inclusive） threshold (at most eight tons). -/
def threshold : Nat := 8

/-- 「最大積載量が八トン以下のもの」. -/
def inScope (amount : Nat) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≤ 8)

end JapanTaxLaw.LocalTax154LoadUpTo8Tons
