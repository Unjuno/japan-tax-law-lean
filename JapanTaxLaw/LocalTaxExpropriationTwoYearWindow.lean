import JapanTaxLaw.TaxFinance

/-
# LocalTaxExpropriationTwoYearWindow — pinned clause 「これらの者が公共事業を行う者に代わつて当該公共事業の用に供する不動産を取得する場合においてこれらの者に当該公共事業の用に供する不動産を譲渡した者又は当該譲渡に係る土地の上に建築されていた家屋について移転補償金を受けた者に対する当該譲渡し、又は移転補償金を受けた不動産（以下この号において「被買収不動産等」という。）に代わるものと市町村長が認める土地（当該被買収不動産等に対応するものとして政令で定める土地に限る。）の譲渡（当該不動産を譲渡し、又は当該家屋についての移転補償金に係る契約をした日から二年以内に行われる土地の譲渡に限る。）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 602, paragraph 1, item 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|52fd38ecc15ffe874209fe3863cd13a4b224b3996d92756f3726c4fb7c38a776.
原文逐語: 「これらの者が公共事業を行う者に代わつて当該公共事業の用に供する不動産を取得する場合においてこれらの者に当該公共事業の用に供する不動産を譲渡した者又は当該譲渡に係る土地の上に建築されていた家屋について移転補償金を受けた者に対する当該譲渡し、又は移転補償金を受けた不動産（以下この号において「被買収不動産等」という。）に代わるものと市町村長が認める土地（当該被買収不動産等に対応するものとして政令で定める土地に限る。）の譲渡（当該不動産を譲渡し、又は当該家屋についての移転補償金に係る契約をした日から二年以内に行われる土地の譲渡に限る。）」
Scope: ONLY the 移転補償金契約日から二年以内の土地譲渡の INCLUSIVE 上限（years <= 2）. 市町村長の認定・政令で定める土地・被買収不動産等の定義・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTaxExpropriationTwoYearWindow

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (2) with the inclusive/strict boundary fixed by the clause. -/
def inScope (years : Nat) : Prop := years <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 2)

end JapanTaxLaw.LocalTaxExpropriationTwoYearWindow
