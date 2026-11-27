import JapanTaxLaw.TaxFinance

/-
# LocalTax703_4EighteenPlusInsuredAmount — pinned clause 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 703_4, paragraph 29, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|3252d278f5933e18696df8a3637e7449910fb3b052339d04ae13dafdeddf5ca4.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:703_4/Article#703_4/Paragraph#29/Item#1/ItemSentence/Sentence#1.
原文逐語: 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」
Scope: ONLY the 十八歳以上 (age ≥ 18) lower bound in the 均等割総額. 各割の算定・合計額の算出・他の号・項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (18), INCLUSIVE lower bound. -/
def threshold : Nat := 18

/-- 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」. -/
def inScope (age : Nat) : Prop := threshold ≤ age

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (age : Nat) : Bool := decide (18 ≤ age)

end JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount
