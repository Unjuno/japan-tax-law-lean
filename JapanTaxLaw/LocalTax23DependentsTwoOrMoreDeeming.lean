import JapanTaxLaw.TaxFinance

/-
# LocalTax23DependentsTwoOrMoreDeeming — pinned clause 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 23, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|7bb701bcd3ae15ce4309a3286ba0046aa86731796f76d1573f0174550808c297.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:23/Article#23/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」
Scope: ONLY the 二以上の道府県民税の納税義務者 (taxpayers ≥ 2) threshold. 扶養親族・特定親族に該当する事実の認定, いずれか一の納税義務者への帰属の具体的指定, 政令の内容, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」. -/
def inScope (taxpayers : Nat) : Prop := threshold ≤ taxpayers

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (taxpayers : Nat) : Bool := decide (2 ≤ taxpayers)

end JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming
