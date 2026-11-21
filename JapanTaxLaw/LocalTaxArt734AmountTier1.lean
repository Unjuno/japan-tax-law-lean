import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt734AmountTier1 — 地方税法 第七百三十四条(3)（十二万 / 十四万）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|41efee8e91f1bcde685ed332b7b7d8e7b2d82fa083062d8f7d0a45e5503c57c7
  Source path: LawBody[2]/MainProvision/MainProvision[4]/Article:734/Article#734/
               Paragraph#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Article caption: （都における普通税の特例）
  A conditional dual amount: base 十二万, with 十四万 in the 「以外の場合」
  (the case other than an office also located outside the special wards). Both
  amounts derived programmatically from the verbatim needle; they are alternatives,
  not cumulative.

原文逐語（pinned, 一字一句改変なし）:
  「十二万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十四万円）」

Variable contract (円, domain Nat):
  baseAmountYen : Money := 120_000
  alternativeAmountYen : Money := 140_000
  The two amounts are alternatives selected by the office-location condition;
  the condition itself (事務所等の特別区との関係) is NOT MODELLED — only the
  two numeric amounts and their alternative relationship.

Scope: only the two amounts are modeled. The location condition, the tax base,
the other table rows, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt734AmountTier1

open JapanTaxLaw.TaxFinance

/-- 基本額 = 十二万. Derived from verbatim source. -/
def baseAmountYen : Money := 120_000

/-- 代替額 = 十四万 (以外の場合). Derived from verbatim source. -/
def alternativeAmountYen : Money := 140_000

/-- The alternative amount is strictly greater than the base. -/
theorem alternative_gt_base : baseAmountYen < alternativeAmountYen := by
  unfold baseAmountYen alternativeAmountYen
  decide

end JapanTaxLaw.LocalTaxArt734AmountTier1
