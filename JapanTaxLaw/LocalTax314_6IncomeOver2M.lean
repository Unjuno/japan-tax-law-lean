import JapanTaxLaw.TaxFinance

/-
# LocalTax314_6IncomeOver2M — pinned clause 「当該納税義務者の合計課税所得金額が二百万円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 314_6 (第三百十四条の六).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0a5153d8f3a2b910d03a9c070354485c8c976f846a4115b1eda1625191ee3e67.
原文逐語: 「当該納税義務者の合計課税所得金額が二百万円を超える場合」
Scope: ONLY the を超え (strict lower bound) of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_6IncomeOver2M

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 当該納税義務者の合計課税所得金額が二百万円を超える場合 (を超え, strict lower bound). -/
def threshold : Money := 2_000_000

/-- Strict statutory lower bound — を超え. -/
def lower : Money := threshold

/-- 「当該納税義務者の合計課税所得金額が二百万円を超える場合」. -/
def inScope (amount : Money) : Prop := lower < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (2_000_000 < amount)

end JapanTaxLaw.LocalTax314_6IncomeOver2M
