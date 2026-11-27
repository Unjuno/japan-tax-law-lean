import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2ReturnCostCeiling30Percent — pinned clause 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 37_2, paragraph 2, item 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|03ccd17a087b0dc7b18206a731228b6db6ffb63635dc8fb45858399354ae329d.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#2/Item#3/ItemSentence/Sentence#1.
原文逐語: 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」
Scope: ONLY 返礼品等の調達に要する費用の額が第一号寄附金の額の百分の三十以下であるという割合上限. 総務大臣が定める算定方法自体, 第一号寄附金の範囲, 他の号, 他条項 are NOT MODELLED. The single-literal 百分のN ceiling is used because N/100 = 30/100 is exactly the clause rate.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE. -/
def threshold : Nat := 30

/-- 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」. -/
def inScope (percent : Nat) : Prop := percent ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (percent : Nat) : Bool := decide (percent ≤ 30)

end JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent
