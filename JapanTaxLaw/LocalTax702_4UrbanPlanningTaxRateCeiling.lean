import JapanTaxLaw.TaxFinance

/-
# LocalTax702_4UrbanPlanningTaxRateCeiling — pinned clause 「都市計画税の税率は、百分の〇・三を超えることができない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 702_4, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|bd21112adbd4c11ce1eab7b3047d2190416c6163ac975b12a7bccff529579dfb.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:702_4/Article#702_4/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「都市計画税の税率は、百分の〇・三を超えることができない。」
Scope: ONLY 都市計画税の税率が百分の〇・三（千分の三）を超えること. The 百分の〇・三 rate itself, the 軽油の数量に百分の〇・三を乗ずる計算 (LocalTaxLightOilQuantity, different article), the 税率の算定手続 and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), STRICT. -/
def threshold : Nat := 3

/-- statutory 百分 basis: 百分の〇・三 = 3 / 1000. -/
def rateDenominator : Nat := 1000

/-- 「都市計画税の税率が百分の〇・三（千分の三）を超えること」. -/
def inScope (permille : Nat) : Prop := threshold < permille

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (permille : Nat) : Bool := decide (3 < permille)

end JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling
