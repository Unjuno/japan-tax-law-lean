import JapanTaxLaw.TaxFinance

/-!
# NationalTaxCommonDelegatedAmount — 国税通則法施行規則 第一条の三(5)（財務省令で定める金額）

Pinned source:
  Law id: 337M50000040028
  Official title: 国税通則法施行規則
  Law number: 昭和三十七年大蔵省令第二十八号
  Law type: MinisterialOrdinance (省令)
  Revision: 337M50000040028_20261101_507M60000040025
  Raw snapshot: data/raw/337M50000040028_20261101_507M60000040025.law.json
  sha256: 0e9e6d76754a9ecc71f701f7bfd4207730907d11d0e3f439adfc25be66bf07df
  Normative unit id: NORM|81fcecfaad1e405b864c4c594c99d6f9861e6155e9f59de04aa96a9ffd9b62f9
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:1_3/Article#1_3/
               Paragraph#5/ParagraphSentence/Sentence#1
  Article caption: （納付に係る届出等）
  The ordinance fixes the amount delegated by 法第三十四条第二項 at 一億円,
  derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「法第三十四条第二項に規定する財務省令で定める金額は、一億円とする。」

Variable contract (円, domain Nat):
  delegatedAmountYen : Money := 100_000_000 — derived from verbatim kanji.

Scope: only the delegated amount is modeled. The underlying Act provision
(法第三十四条第二項), the rest of article 1-3, other paragraphs and other
articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.NationalTaxCommonDelegatedAmount

open JapanTaxLaw.TaxFinance

/-- 財務省令で定める金額 — delegated by ordinance. Derived from verbatim source. -/
def delegatedAmountYen : Money := 100_000_000

/-- The amount decodes correctly. -/
theorem amount_decoded : delegatedAmountYen = 100_000_000 := rfl

end JapanTaxLaw.NationalTaxCommonDelegatedAmount
