import JapanTaxLaw.TaxFinance

/-
# LocalTax703_5AdultEqualCharge18 — pinned clause 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 703_5, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d18a9f16ef71281efffb4230ea9baaed990c7664df566013465e9bd98ef9b975.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:703_5/Article#703_5/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」
Scope: ONLY the 十八歳以上 (age ≥ 18) INCLUSIVE lower bound for the 国民健康保険税 被保険者均等割額 減額対象. 政令で定める基準・条例で定めるところ・出産該当性・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax703_5AdultEqualCharge18

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (18), INCLUSIVE lower bound. -/
def threshold : Nat := 18

/-- 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」. -/
def inScope (age : Nat) : Prop := threshold ≤ age

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (age : Nat) : Bool := decide (18 ≤ age)

end JapanTaxLaw.LocalTax703_5AdultEqualCharge18
