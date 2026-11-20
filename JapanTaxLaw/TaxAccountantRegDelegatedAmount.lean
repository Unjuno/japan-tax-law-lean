import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantRegDelegatedAmount — 税理士法施行令 art.6の2(2)（八千八百円）

Pinned source:
  Law id: 326CO0000000216
  Law number: 昭和二十六年政令第二百十六号
  Law type: CabinetOrder (政令)
  Revision: 326CO0000000216_20240401_505CO0000000146
  Raw snapshot: data/raw/326CO0000000216_20240401_505CO0000000146.law.json
  sha256: 346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296
  Normative unit id: NORM|5a5e264f44439540b3d5bdd4efa72bc7e2980f2b11cd22c3acb7863e8cb240a7
  Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:6_2/Article#6_2/
               Paragraph#2/ParagraphSentence/Sentence#1
  Statutory article: art.6の2(2) — 税理士法9条2項の政令で定める額 = 八千八百円

Law identity verified (unicode escapes): INVENTORY official_title = 税理士法施行令;
law_num = 昭和二十六年政令第二百十六号; law_type = CabinetOrder.

原文逐語（pinned, 一字一句改変なし）:
  「法第九条第二項に規定する政令で定める額は、八千八百円とする。」

Variable contract:
  `delegatedAmountYen : Money := 8_800` = 八千八百円. This Cabinet Order fixes
  the amount "prescribed by Cabinet Order" under Tax Accountant Act art.9(2)
  to exactly ¥8,800. `isDelegatedAmount a := a = delegatedAmountYen`.
  Unit 円; domain Nat.

Scope: only this delegated amount. The substantive Tax Accountant Act art.9(2),
the conditions under which the amount applies, other paragraphs and 省令
details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxAccountantRegDelegatedAmount

open JapanTaxLaw.TaxFinance

/-- 八千八百円. Unit 円; domain Nat. -/
def delegatedAmountYen : Money := 8_800

/-- 「政令で定める額は、八千八百円とする」: the delegated amount is exactly ¥8,800. -/
def isDelegatedAmount (amount : Money) : Prop :=
  amount = delegatedAmountYen

end JapanTaxLaw.TaxAccountantRegDelegatedAmount
