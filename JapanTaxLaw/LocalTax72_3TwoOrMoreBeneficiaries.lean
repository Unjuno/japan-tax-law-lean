import JapanTaxLaw.TaxFinance

/-
# LocalTax72_3TwoOrMoreBeneficiaries — pinned clause 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_3, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f4567b2caecd6a1400acb766d6c3a9ac0766e1f9fcb68b31ab782027334563ef.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_3/Article#72_3/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」
Scope: ONLY the 受益者が二以上 (beneficiaries ≥ 2) INCLUSIVE lower bound for the 政令による必要事項の定め. 第一項の規定の適用・第二項の給付を受ける者の判定・前三項の規定の適用・政令の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「受益者が二以上ある場合における第一項の規定の適用、第二項に規定する信託財産の給付を受けることとされている者に該当するかどうかの判定その他前三項の規定の適用に関し必要な事項は、政令で定める。」. -/
def inScope (beneficiaries : Nat) : Prop := threshold ≤ beneficiaries

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (beneficiaries : Nat) : Bool := decide (2 ≤ beneficiaries)

end JapanTaxLaw.LocalTax72_3TwoOrMoreBeneficiaries
