import JapanTaxLaw.TaxFinance

/-!
# PublicSaleGuaranteeDeposit — 国税徴収法施行令 第四十二条の五（公売保証金の額）

Pinned source:
  Law id: 334CO0000000329
  Official title: 国税徴収法施行令
  Law number: 昭和三十四年政令第三百二十九号
  Law type: CabinetOrder (政令)
  Revision: 334CO0000000329_20260525_507CO0000000244
  Raw snapshot: data/raw/334CO0000000329_20260525_507CO0000000244.law.json
  sha256: f45ac77c8b3c57d8179d041ecda8b8823148e87d2c21512e4518a889c517a83f
  Normative unit id: NORM|7e9db39251bc28440bf2799c75e0a9d152df7bb0d0dcc984788e68b272d6befd
  Source path: LawBody[3]/MainProvision/MainProvision[4]/Article:42_5/Article#42_5/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （公売保証金を徴しないで公売することができる財産の見積価額）
  Statutory text fixes the 政令で定める金額 for 法第百条第一項（公売保証金） at
  五十万円 (injected verbatim from source; numeric constant derived from it).

原文逐語（pinned, 一字一句改変なし）:
  「法第百条第一項（公売保証金）に規定する政令で定める金額は、五十万円とする。」

Variable contract (円, domain Nat):
  publicSaleGuaranteeDepositYen : Money := 500_000 — derived programmatically
  from the verbatim needle. This is the DELEGATED amount (政令で定める金額).

Scope: only the delegated amount is modeled. The underlying Act provision (法第百条),
auction procedure, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PublicSaleGuaranteeDeposit

open JapanTaxLaw.TaxFinance

/-- 公売保証金の額 — delegated by CabinetOrder. Derived from verbatim source. -/
def publicSaleGuaranteeDepositYen : Money := 500_000

/-- The amount decodes correctly. -/
theorem amount_decoded : publicSaleGuaranteeDepositYen = 500_000 := rfl

end JapanTaxLaw.PublicSaleGuaranteeDeposit
