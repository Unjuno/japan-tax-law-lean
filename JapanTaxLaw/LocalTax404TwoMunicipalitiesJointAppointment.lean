import JapanTaxLaw.TaxFinance

/-
# LocalTax404TwoMunicipalitiesJointAppointment — pinned clause 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 404, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|775a6e93492ee648d8ba2302948452c1e61ddd189950a9f024e76b3543825ce0.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:404/Article#404/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」
Scope: ONLY the 二以上の市町村 (municipalities ≥ 2) lower bound. 議会の同意の取得, 協議による協同選任の手続, 選任される者の適格性, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」. -/
def inScope (municipalities : Nat) : Prop := threshold ≤ municipalities

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (municipalities : Nat) : Bool := decide (2 ≤ municipalities)

end JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment
