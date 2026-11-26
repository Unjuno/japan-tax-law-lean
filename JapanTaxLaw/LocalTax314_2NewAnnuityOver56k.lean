import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2NewAnnuityOver56k — pinned clause 「前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 314_2 (第三百十四条の二).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|1d77267a32be0d8754ec1470cf67604a4a84695345f6957f0286ceac90edf1d4.
原文逐語: 「前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合」
Scope: ONLY the を超え (strict lower bound) of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2NewAnnuityOver56k

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合 (を超え, strict lower bound). -/
def threshold : Money := 56_000

/-- Strict statutory lower bound — を超え. -/
def lower : Money := threshold

/-- 「前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合」. -/
def inScope (amount : Money) : Prop := lower < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (56_000 < amount)

end JapanTaxLaw.LocalTax314_2NewAnnuityOver56k
