import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2DonationUsageAtLeast60Percent — pinned clause 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 37_2, paragraph 2, item 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|9297c8bd00c480d2bc1941da7fe038061064e812fe4724c3c732fb82af474e7f.
原文逐語: 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」
Scope: ONLY the 寄附金活用可能額が寄附金額の百分の六十に相当する金額以上である INCLUSIVE 下限（percent >= 60、N/100 = 60/100 は条文の割合と一致）. 募集費用の算定・総務大臣の定め・指定対象期間の判定・他号他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2DonationUsageAtLeast60Percent

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (60) with the inclusive boundary fixed by the clause. -/
def inScope (percent : Nat) : Prop := percent >= 60

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (percent : Nat) : Bool := decide (percent >= 60)

end JapanTaxLaw.LocalTax37_2DonationUsageAtLeast60Percent
