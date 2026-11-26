import JapanTaxLaw.TaxFinance

/-
# LocalTax51StandardRateCeiling2 — pinned clause 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第五十一条 (Num 51), paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c6450946afa36af4ed52b19ff5433b84df5afb14341f23ab94d02f93d73b7450.
原文逐語: 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」
Scope: ONLY the inclusive ceiling 百分の二 (2 percent — 「を超えることができない」 is
an INCLUSIVE ceiling, i.e. ≤ 2). Other tax rates, the standard-rate comparison,
other paragraphs and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax51StandardRateCeiling2

open JapanTaxLaw.TaxFinance

/-- 二 — 百分の二 — inclusive ceiling (「を超えることができない」 ⇒ ≤). -/
def threshold : Nat := 2

/-- 「標準税率を超える税率で課する場合においても、百分の二を超えることができない」. -/
def inScope (amount : Nat) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≤ 2)

end JapanTaxLaw.LocalTax51StandardRateCeiling2
