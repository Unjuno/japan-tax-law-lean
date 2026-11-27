import JapanTaxLaw.TaxFinance

/-
# LocalTax24_3BeneficiariesTwoOrMoreDelegation — pinned clause 「受益者が二以上ある場合における第一項の規定の適用、前項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前二項の規定の適用に関し必要な事項は、政令で定める。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 24_3, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|eeaafdaad7c6e74cde2c9e409bfc0f1a05edd1187fb1d9b8863d46176abd774b.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:24_3/Article#24_3/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「受益者が二以上ある場合における第一項の規定の適用、前項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前二項の規定の適用に関し必要な事項は、政令で定める。」
Scope: ONLY the 受益者が二以上 (beneficiaries ≥ 2) threshold. 第一項の規定の適用, 給付を受けることとされている者の該当性判定, 前二項の規定の適用, 政令の内容そのもの, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax24_3BeneficiariesTwoOrMoreDelegation

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「受益者が二以上ある場合における第一項の規定の適用、前項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前二項の規定の適用に関し必要な事項は、政令で定める。」. -/
def inScope (beneficiaries : Nat) : Prop := threshold ≤ beneficiaries

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (beneficiaries : Nat) : Bool := decide (2 ≤ beneficiaries)

end JapanTaxLaw.LocalTax24_3BeneficiariesTwoOrMoreDelegation
