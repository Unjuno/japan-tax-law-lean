import JapanTaxLaw.TaxFinance

/-
# LocalTax73_24TwoYearNewHouseCondition — pinned clause 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_24, paragraph 1, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|55d86580d3dde2818fb2e8e4484a472d2aa026699601cf64f7b4a99dcc0d8155.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_24/Article#73_24/Paragraph#1/Item#1/ItemSentence/Sentence#1.
原文逐語: 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」
Scope: ONLY the 土地を取得した日から二年以内 (years ≤ 2) ceiling. 取得者の所有継続・新築主体の事実認定, 特例適用住宅の定義, 他の号・項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE ceiling. -/
def threshold : Nat := 2

/-- 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 2)

end JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition
