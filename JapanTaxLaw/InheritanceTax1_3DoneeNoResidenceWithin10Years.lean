import JapanTaxLaw.TaxFinance

/-
# InheritanceTax1_3DoneeNoResidenceWithin10Years — pinned clause 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 1_3, paragraph 2, item 2.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|5fbf0a987f37c8b42e45b155464d3795ee7125ab71ef574eab08a5522b692fec.
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_3/Article#1_3/Paragraph#2/Item#2/ItemSentence/Sentence#2.
原文逐語: 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」
Scope: ONLY the 贈与前十年以内 lookback window (years ≤ 10). 「いずれの時においても住所を有していたことがない」の無住所判定自体, 同条第一項の適用要件, 外国人/非居住被相続人に関する他号, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 10)

end JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years
