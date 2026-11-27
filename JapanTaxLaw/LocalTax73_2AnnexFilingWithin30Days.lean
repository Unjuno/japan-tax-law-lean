import JapanTaxLaw.TaxFinance

/-
# LocalTax73_2AnnexFilingWithin30Days — pinned clause 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_2, paragraph 7.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|2ab181f2a0af4fd936e65bd138b4d217fa6516f4fd97639d3adb4a371b91146e.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_2/Article#73_2/Paragraph#7/ParagraphSentence/Sentence#2.
原文逐語: 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」
Scope: ONLY the 納税通知書の交付を受けた日から三十日以内 (days ≤ 30) INCLUSIVE ceiling for the 附帯設備に属する部分の価額の申出. 主体構造部・附帯設備の課税標準の按分・税額の減額計算・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE ceiling. -/
def threshold : Nat := 30

/-- 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days
