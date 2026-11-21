import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt21Penalty — 地方税法 第二十一条(1)（罰則）bounded L4 モデル

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|c44267260dc35641899361b7ab7e63e06f22ace473bef4c3a81b22a33b50fd14
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:21/Article#21/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: 第二十一条(1) — 三年以下の拘禁刑又は二十万円以下の罰金

原文逐語（pinned, 一字一句改変なし）:
  「動した者は、三年以下の拘禁刑又は二十万円以下の罰金に処する。」

原文から導出した数値上限:
  maxImprisonmentMonths = 36 (三年以下)
  maxFineYen            = 200,000 (二十万円以下)
  「又は」→ 拘禁刑と罰金は代替 (alternative)、併科ではない。

Scope: only the penalty's numeric ceilings and their alternative relationship.
  The violation condition (動した者 — what act triggers it), the preceding
  article's substantive rule, other paragraphs and other articles are NOT MODELLED.
  Actual sentencing is a judicial matter; this model provides no legal review.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt21Penalty

open JapanTaxLaw.TaxFinance

/-- 拘禁刑の上限 = 三年 = 36 月以下。 -/
def maxImprisonmentMonths : Nat := 36

/-- 罰金の上限 = 二十万円以下。 -/
def maxFineYen : Money := 200_000

/-- 原文の「又は」に対応する代替刑。併科は表さない。 -/
inductive Penalty where
  | imprisonment : Nat -> Penalty
  | fine : Money -> Penalty

/-- 刑が原文の上限内か（境界値 36 月 / 200,000 円は上限内）。 -/
def withinLimits : Penalty -> Bool
  | Penalty.imprisonment m => m <= maxImprisonmentMonths
  | Penalty.fine y => y <= maxFineYen

end JapanTaxLaw.LocalTaxArt21Penalty
