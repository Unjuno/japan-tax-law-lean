import JapanTaxLaw.TaxFinance

/-
# LocalTax21LightOilTaxOver30000 — pinned clause 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 21, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|2ff2e096d5946f481973daedfde6604605d9dd19488fa70102523bcd1199b925.
Source path: LawBody[194]/SupplProvision/SupplProvision[17]/Article:21/Article#21/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」
Scope: ONLY 附則第十七条 軽油引取税額が三万円をこえる場合の徴収猶予の許容条件. The 三万円以下の金額, 三月以内の猶予期間自体, 特約業者/元売業者/小売業者の範囲, the 附則 第四十九条 parallel clause and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax21LightOilTaxOver30000

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30000), STRICT. -/
def threshold : Nat := 30000

/-- 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」. -/
def inScope (yen : Nat) : Prop := threshold < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (30000 < yen)

end JapanTaxLaw.LocalTax21LightOilTaxOver30000
