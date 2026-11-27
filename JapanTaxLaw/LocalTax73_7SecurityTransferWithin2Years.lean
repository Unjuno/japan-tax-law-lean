import JapanTaxLaw.TaxFinance

/-
# LocalTax73_7SecurityTransferWithin2Years — pinned clause 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_7, paragraph 1, item 8.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0c121d65f6bde4fedcf3585e707a6a13b667898763dde25c2332288d5b2e2492.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_7/Article#73_7/Paragraph#1/Item#8/ItemSentence/Sentence#1.
原文逐語: 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」
Scope: ONLY the 譲渡担保財産の設定の日から二年以内 (years ≤ 2) INCLUSIVE ceiling for the 設定者への当該財産の移転. 担保される債権の消滅・設定者の更迭・譲渡担保財産の定義・不動産取得税の課税・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE ceiling. -/
def threshold : Nat := 2

/-- 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 2)

end JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years
