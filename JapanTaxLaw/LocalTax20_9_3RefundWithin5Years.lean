import JapanTaxLaw.TaxFinance

/-
# LocalTax20_9_3RefundWithin5Years — pinned clause 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 20_9_3, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e593dd0d3a5235a22243845bd072a602820800fbed04b469c42279b480ea1f00.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_9_3/Article#20_9_3/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」
Scope: ONLY the 法定納期限から五年以内 (years ≤ 5) INCLUSIVE ceiling for requesting a 更正の請求 by a 申告書提出者. 計算違反・誤りの各号・総務省令の定め・更正後の課税標準等の読替・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax20_9_3RefundWithin5Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (5), INCLUSIVE ceiling. -/
def threshold : Nat := 5

/-- 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 5)

end JapanTaxLaw.LocalTax20_9_3RefundWithin5Years
