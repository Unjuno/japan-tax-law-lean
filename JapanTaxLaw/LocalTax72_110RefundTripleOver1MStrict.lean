import JapanTaxLaw.TaxFinance

/-
# LocalTax72_110RefundTripleOver1MStrict — pinned clause 「前項の還付を受けた金額の三倍が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超え当該相当額の三倍以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_110, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|35eec1cdf63c6ee652e967367315a5ae192ef8b818dc09449864eb4ae9648f46.
原文逐語: 「前項の還付を受けた金額の三倍が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超え当該相当額の三倍以下の額とすることができる。」
Scope: ONLY the 百万円を超える (yen > 1000000) STRICT threshold on three times the fraudulently received refund, above which the fine may be increased up to three times that amount. 第一項の犯罪, 十年以下の拘禁刑, 三倍以下の上限 and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict

open JapanTaxLaw.TaxFinance

/-- 「百万円を超える」 — statutory threshold literal 1_000_000; STRICT boundary. -/
def inScope (yen : Nat) : Prop := 1_000_000 < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (1_000_000 < yen)

end JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict
