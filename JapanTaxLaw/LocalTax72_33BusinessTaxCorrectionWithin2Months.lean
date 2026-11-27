import JapanTaxLaw.TaxFinance

/-
# LocalTax72_33BusinessTaxCorrectionWithin2Months — pinned clause 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_33, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c53797dfc4fabdf5653a6ab2c48854a99899b009c52c48f84e5f63da01490fec.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_33/Article#72_33/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」
Scope: ONLY the 更正又は決定の通知をした日から二月以内 (months ≤ 2) INCLUSIVE ceiling for the 事業税額等の更正請求. 収入割のみの申告の除外・課税標準の変更事由・総務省令の定め・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE ceiling. -/
def threshold : Nat := 2

/-- 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 2)

end JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months
