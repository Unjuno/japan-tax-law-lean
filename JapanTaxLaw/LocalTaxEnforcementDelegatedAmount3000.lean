import JapanTaxLaw.TaxFinance

/-!
# LocalTaxEnforcementDelegatedAmount3000 — 地方税法施行令 第八条の三（政令で定める金額 三千）

Pinned source:
  Law id: 325CO0000000245
  Official title: 地方税法施行令
  Law number: 昭和二十五年政令第二百四十五号
  Law type: CabinetOrder (政令)
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  sha256: 9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17
  Normative unit id: NORM|92588e30e308fe82f1159ad13f75bfdaa96ba59a454b7739c70ead26f70ef7c7
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:8_3/Article#8_3/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （個人の道府県民税の徴収取扱費の算定の基礎となる金額）
  The CabinetOrder fixes the amount delegated by 法第四十七条第一項第一号 at
  三千, derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「法第四十七条第一項第一号に規定する政令で定める金額は、三千円とする。」

Variable contract (円, domain Nat):
  delegatedAmountYen : Money := 3_000 — derived from verbatim kanji.

Scope: only the delegated amount is modeled. The underlying Act provision,
the rest of article 8-3, other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000

open JapanTaxLaw.TaxFinance

/-- 政令で定める金額 — delegated by CabinetOrder. Derived from verbatim source. -/
def delegatedAmountYen : Money := 3_000

/-- The amount decodes correctly. -/
theorem amount_decoded : delegatedAmountYen = 3_000 := rfl

end JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000
