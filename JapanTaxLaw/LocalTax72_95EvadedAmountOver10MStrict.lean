import JapanTaxLaw.TaxFinance

/-
# LocalTax72_95EvadedAmountOver10MStrict — pinned clause 「第一項第一号の免れた税額若しくは同項第二号の還付を受けた金額又は前項の犯罪に係る還付を受けようとした金額が千万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、千万円を超える額でその免れた税額若しくは還付を受けた金額又は還付を受けようとした金額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_95, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|7e980af5d2aff767f9b6996a7365c3f48b8935f2111484dc896ddfdc9df46bf3.
原文逐語: 「第一項第一号の免れた税額若しくは同項第二号の還付を受けた金額又は前項の犯罪に係る還付を受けようとした金額が千万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、千万円を超える額でその免れた税額若しくは還付を受けた金額又は還付を受けようとした金額に相当する額以下の額とすることができる。」
Scope: ONLY the 千万円を超える (yen > 10000000) STRICT excess of the evaded/refunded 譲渡割 amount that triggers the enhanced fine in 地方税法 art. 72_95(3). The 情状により discretionary fine reduction, the 第一項の各項の罰金 base amounts, the 未遂 provisions and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict

open JapanTaxLaw.TaxFinance

/-- 「千万円を超える」 — statutory threshold literal 10_000_000; STRICT boundary. -/
def inScope (yen : Nat) : Prop := 10_000_000 < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (10_000_000 < yen)

end JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict
