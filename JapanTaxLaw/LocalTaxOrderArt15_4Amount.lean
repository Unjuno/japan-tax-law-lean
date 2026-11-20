import JapanTaxLaw.TaxFinance

/-!
# LocalTaxOrderArt15_4Amount — 地方税法施行令 art.6の9の2(1)（二千円）

Pinned source:
  Law id: 325CO0000000245
  Law number: 昭和二十五年政令第二百四十五号
  Law type: CabinetOrder (政令)
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  sha256: 9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17
  Normative unit id: NORM|8f218ac0c48735c83d9984a2be0ad3731220bc855d1425dd950952af69cf7476
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:6_9_2/Article#6_9_2/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art.6の9の2(1) — 地方税法15条の4(1)の政令で定める額 = 二千円

Law identity verified: INVENTORY official_title = 地方税法施行令;
law_num = 昭和二十五年政令第二百四十五号; law_type = CabinetOrder.

原文逐語（pinned, 一字一句改変なし）:
  「法第十五条の四第一項に規定する政令で定める金額は、二千円とする。」

Variable contract:
  `delegatedAmountYen : Money := 2_000` = 二千円. This Cabinet Order fixes the
  amount "prescribed by Cabinet Order" under Local Tax Act art.15-4(1) to
  exactly ¥2,000. `isDelegatedAmount a := a = delegatedAmountYen`.
  Unit 円; domain Nat.

Scope: only this delegated amount. The substantive Local Tax Act art.15-4(1),
the conditions under which the amount applies, other paragraphs and 省令
details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxOrderArt15_4Amount

open JapanTaxLaw.TaxFinance

/-- 二千円. Unit 円; domain Nat. -/
def delegatedAmountYen : Money := 2_000

/-- 「政令で定める金額は、二千円とする」: the delegated amount is exactly ¥2,000. -/
def isDelegatedAmount (amount : Money) : Prop :=
  amount = delegatedAmountYen

end JapanTaxLaw.LocalTaxOrderArt15_4Amount
