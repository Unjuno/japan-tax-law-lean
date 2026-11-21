import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt803AdministrativeFine — 地方税法 第八百三条（過料 十万以下）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|7b8ad3cf00fe6bc2ee7c9a071318722612356de6b823cf0fbaecdb1cab531ea3
  Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:803/Article#803/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: (none)
  An administrative fine (過料) ceiling of 十万 (以下 = inclusive) for the
  violation of 第七百六十七条第二項, derived programmatically from the verbatim needle.
  This is 過料 (administrative), NOT 罰金 (criminal fine).

原文逐語（pinned, 一字一句改変なし）:
  「第七百六十七条第二項の規定に違反した者は、十万円以下の過料に処する。」

Variable contract (円, domain Nat):
  maxAdministrativeFineYen : Money := 100_000
  withinFineLimit fine := fine ≤ maxAdministrativeFineYen (以下 = inclusive).

Scope: only this administrative fine ceiling is modeled. The violation
condition (第七百六十七条第二項), sentencing, other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt803AdministrativeFine

open JapanTaxLaw.TaxFinance

/-- 過料上限 十万 (以下). Derived from verbatim source. -/
def maxAdministrativeFineYen : Money := 100_000

/-- 過料が上限内か（境界値は上限内）. -/
def withinFineLimit (fine : Money) : Prop := fine ≤ maxAdministrativeFineYen

end JapanTaxLaw.LocalTaxArt803AdministrativeFine
