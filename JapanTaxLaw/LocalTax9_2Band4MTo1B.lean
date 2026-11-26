import JapanTaxLaw.TaxFinance

/-
# LocalTax9_2Band4MTo1B — pinned clause 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第九条の二 (Num 9_2), paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|85f4e8d8a317633f2b68dae17c596f8ece7ac63670d6fef5f57eff7b19593cec.
原文逐語: 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」
Scope: ONLY this bracket interval. 「を超え」 = STRICT lower (4,000,000 excluded);
「以下」 = INCLUSIVE upper (1,000,000,000 included). Both bounds are derived from
the verbatim scoped needle. The paired tax rate, other table cells, other
paragraphs and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax9_2Band4MTo1B

open JapanTaxLaw.TaxFinance

/-- 四百万 — lower bound, strictly excluded (を超え). -/
def lower : Nat := 4_000_000

/-- 十億 — upper bound, inclusive (以下). -/
def upper : Nat := 1_000_000_000

/-- 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」. -/
def inScope (amount : Nat) : Prop := lower < amount ∧ amount ≤ upper

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (4_000_000 < amount ∧ amount ≤ 1_000_000_000)

end JapanTaxLaw.LocalTax9_2Band4MTo1B
