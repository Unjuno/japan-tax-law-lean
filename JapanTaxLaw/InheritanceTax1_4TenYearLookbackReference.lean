import JapanTaxLaw.TaxFinance

/-
# InheritanceTax1_4TenYearLookbackReference — pinned clause 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 1_4, paragraph 3, item 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|7bed072a3a4e0ce2394ed7c8fb38ee66e7ddc85cb55d45d356db8f5d1207ffc4.
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_4/Article#1_4/Paragraph#3/Item#3/ItemSentence/Column#2/Sentence#1.
原文逐語: 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」
Scope: ONLY the 贈与前十年以内 (years ≤ 10) lookback ceiling. 贈与をした者の住所の有無・日本国籍の有無の事実認定, 非居住贈与者の別定義, 他の号・項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 10)

end JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference
