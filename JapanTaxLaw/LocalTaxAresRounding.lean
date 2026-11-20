import JapanTaxLaw.TaxFinance

/-!
# LocalTaxAresRounding — 地方税法 art.180(3)（百アール未満の端数は百アールとみなす）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|926a979408404763d53009242e359b92c26e5b2abb2ebada6c8ca095f50419db
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:180/Article#180/
               Paragraph#3/ParagraphSentence/Sentence#1
  Statutory article: art. 180(3) (DEEMING / rounding)

原文逐語（pinned, 一字一句改変なし）:
  「第一項の場合において、百アール未満の端数は、百アールとみなす。」

Variable contract:
  `remainder : Money` = 百アール未満の端数, unit アール (ares),
  domain Nat with the statutory precondition 0 ≤ remainder < 100.
  `Money` is reused here as a plain Nat count: the unit is アール, not yen.
  Result: the deemed remainder (0 if there is no fraction, else 100 ares).

Scope: only the deeming rule for the fractional part. The underlying art.180(1)
tax-base calculation, the other articles of 地方税法 and 政令 details are
NOT MODELLED. This is a computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxAresRounding

open JapanTaxLaw.TaxFinance

/-- 「百アール」. Unit: アール (ares); domain Nat. -/
def fractionUnitAres : Money := 100

/-- 端数をみなす額: 端数が零なら零、それ以外なら百アール. -/
def deemedFraction (remainder : Money) : Money :=
  if remainder = 0 then 0 else fractionUnitAres

end JapanTaxLaw.LocalTaxAresRounding
