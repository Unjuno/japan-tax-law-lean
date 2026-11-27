import JapanTaxLaw.TaxFinance

/-
# LocalTax72_40TwoOrMorePrefectures — pinned clause 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_40, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|917d456d2a7da86c125ef4210c358fd8ee191cb2d7bd504784205e66cbf26c88.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_40/Article#72_40/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」
Scope: ONLY the 二以上の道府県において事務所又は事業所を設けて事業を行う法人 (prefectures ≥ 2) INCLUSIVE lower bound for the 更正又は決定の請求 経由先. 外国法人の読替・主たる事務所の指定・関係道府県知事の判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」. -/
def inScope (prefectures : Nat) : Prop := threshold ≤ prefectures

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (prefectures : Nat) : Bool := decide (2 ≤ prefectures)

end JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures
