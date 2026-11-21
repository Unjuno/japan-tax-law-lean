import JapanTaxLaw.TaxFinance

/-
# IncomeRegPaymentCeiling1M — 所得税法施行規則 第八十七条第三項第二号
（同一人に対するその年中の満期返戻金等の支払金額が百万円以下である場合）

Pinned source:
  Law id: 340M50000040011
  Official title: 所得税法施行規則 (Income Tax Act Enforcement Order)
  Law type: MinisterialOrdinance (省令)
  Revision: 340M50000040011_20261001_507M60000040018
  Raw snapshot: data/raw/340M50000040011_20261001_507M60000040018.law.json
  sha256: 8721699516ac82025eea0430429b197da1e58afe195debe1fb441dfea14eacf5
  Statutory article: 第八十七条 (art. 87), 第三項 (para. 3), 第二号 (item 2)
  Source path: LawBody[3]/MainProvision/MainProvision[4]/Article:87/Article#87/
               Paragraph#3/Item#2/ItemSentence/Sentence#1
  Normative unit id: NORM|527ed759ab3fbc4580c09c7b5631fa02674c97e617ae168ed0d0e85a313df13a

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「同一人に対するその年中の満期返戻金等の支払金額が百万円以下である場合」

Variable contract:
  `paymentCeiling : Nat := 1_000_000` = 百万円 (inclusive upper bound: 以下).
  `withinPaymentCeiling amount : Bool := decide (amount <= paymentCeiling)`.
  Unit 円; domain Nat (whole yen). 以下 = inclusive `<=`. A payment of exactly
  百万円 qualifies; 1,000,001 does not.

Scope: ONLY this explicit numeric payment-ceiling condition is modelled. The
classification of 満期返戻金等, the reporting obligation this condition gates,
the identity of 同一人, other items/paragraphs, and all enforcement rules are
NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeRegPaymentCeiling1M

/-- 百万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def paymentCeiling : Nat := 1_000_000

/-- 「支払金額が百万円以下」: amount <= ¥1,000,000. -/
def withinPaymentCeiling (amount : Nat) : Bool :=
  decide (amount <= paymentCeiling)

/-- 以下 is inclusive: exactly 百万円 qualifies. -/
theorem ceiling_inclusive : withinPaymentCeiling 1_000_000 = true := by
  unfold withinPaymentCeiling paymentCeiling
  decide

/-- One yen above the ceiling fails. -/
theorem first_above : withinPaymentCeiling 1_000_001 = false := by
  unfold withinPaymentCeiling paymentCeiling
  decide

/-- Zero payment qualifies (0 <= 百万円). -/
theorem zero_true : withinPaymentCeiling 0 = true := by
  unfold withinPaymentCeiling paymentCeiling
  decide

end JapanTaxLaw.IncomeRegPaymentCeiling1M
