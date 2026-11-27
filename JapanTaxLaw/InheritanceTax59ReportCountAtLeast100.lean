import JapanTaxLaw.TaxFinance

/-
# InheritanceTax59ReportCountAtLeast100 — pinned clause 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 59, paragraph 5.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|4c1f72290f8dd4d4f7b726fbf65fd38ae481b9a7064263298e374f4fe1ce7f4d.
Source path: LawBody[3]/MainProvision/MainProvision[6]/Article:59/Article#59/Paragraph#5/ParagraphSentence/Sentence#1.
原文逐語: 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」
Scope: ONLY the 提出すべき調書の枚数として算出した数が百以上 (reports >= 100) INCLUSIVE lower bound for the 第一項から第三項までの規定にかかわらず 記載事項を次に掲げる方法で記載する例外. 提出期限の属する年の前々年の一月一日から十二月三十一日までの間・財務省令の算出方法・記載方法の詳細・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax59ReportCountAtLeast100

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (100), INCLUSIVE lower bound. -/
def threshold : Nat := 100

/-- 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」. -/
def inScope (reports : Nat) : Prop := threshold ≤ reports

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (reports : Nat) : Bool := decide (100 ≤ reports)

end JapanTaxLaw.InheritanceTax59ReportCountAtLeast100
