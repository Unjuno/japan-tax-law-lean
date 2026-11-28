import JapanTaxLaw.TaxFinance

/-
# LocalTax701_47BusinessClosureReturnWithin4Months — pinned clause 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_47, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|4ae30c7e6c1b069fc231a55d35aa613b425c8bd1085b75bfc7b73b3c4d1670fd.
原文逐語: 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」
Scope: ONLY the 事業の廃止の日から四月以内 (months <= 4) INCLUSIVE ceiling for the 廃止の場合の申告書提出. 死亡による廃止の一月以内特例・翌年三月十五日までの通常提出・課税標準額・税額の記載・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months

open JapanTaxLaw.TaxFinance

/-- 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」 — statutory threshold literal (4); INCLUSIVE boundary. -/
def inScope (months : Nat) : Prop := months <= 4

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months <= 4)

end JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months
