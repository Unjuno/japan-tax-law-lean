import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2PensionOver7Man — pinned clause 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 314_2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|1875dd112ec59bcf491bcdcd894154883735c5c688a809cf94606b660eae38ea.
原文逐語: 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2PensionOver7Man

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — を超え (strict). -/
def threshold : Nat := 7

/-- 「前年中に支払つた旧個人年金保険料の金額の合計額が七万円を超える場合」. -/
def inScope (amount : Nat) : Prop := threshold < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (7 < amount)

end JapanTaxLaw.LocalTax314_2PensionOver7Man
