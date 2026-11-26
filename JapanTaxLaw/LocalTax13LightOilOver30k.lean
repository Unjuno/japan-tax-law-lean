import JapanTaxLaw.TaxFinance

/-
# LocalTax13LightOilOver30k — pinned clause 「軽油引取税の額が三万円を超える場合には、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第十三条 (Num 13), paragraph 5 (附則, SupplProvision[13]), sentence 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|4e51e0d6668782583c66ee66593a6b848cc53501bea65b66e65aa1a81146634a.
Source path: LawBody[356]/SupplProvision/SupplProvision[13]/Article:13/Article#13/Paragraph#5/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事は、前項の規定により申告納付すべき軽油引取税の額が三万円を超える場合には、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」
Scope: ONLY the strict 三万円を超え tax-amount threshold (三 = 30,000 円). The
three-month deferral-period ceiling (三月以内), the application requirement, the
deferral's legal effect, the parallel 第十五条 clause and all other paragraphs
and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax13LightOilOver30k

open JapanTaxLaw.TaxFinance

/-- 三万 — を超え (strict, ¥30,000). -/
def threshold : Nat := 30_000

/-- 「軽油引取税の額が三万円を超える場合には」. -/
def inScope (tax : Nat) : Prop := threshold < tax

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (tax : Nat) : Bool := decide (30_000 < tax)

end JapanTaxLaw.LocalTax13LightOilOver30k
