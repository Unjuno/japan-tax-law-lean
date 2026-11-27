import JapanTaxLaw.TaxFinance

/-
# LocalTax292TwoResidentTaxpayersDeeming — pinned clause 「二以上の市町村民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 292, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|59821b98b5572f5a765a66428e88cd443f71b6560e44ab65ae53946b77ee0b2e.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:292/Article#292/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の市町村民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」
Scope: ONLY the 二以上の市町村民税の納税義務者 (taxpayers ≥ 2) lower bound. 政令で定めるところによるいずれか一の納税義務者への指定, 扶養親族・特定親族の該当性の事実認定, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax292TwoResidentTaxpayersDeeming

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「二以上の市町村民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」. -/
def inScope (taxpayers : Nat) : Prop := threshold ≤ taxpayers

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (taxpayers : Nat) : Bool := decide (2 ≤ taxpayers)

end JapanTaxLaw.LocalTax292TwoResidentTaxpayersDeeming
