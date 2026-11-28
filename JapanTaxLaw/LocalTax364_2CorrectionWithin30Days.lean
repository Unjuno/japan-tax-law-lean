import JapanTaxLaw.TaxFinance

/-
# LocalTax364_2CorrectionWithin30Days — pinned clause 「前条第五項の固定資産に係る当該年度分の固定資産税額が仮算定税額の二分の一に相当する額に満たないこととなると認められる場合においては、同項の規定によつて当該固定資産に係る固定資産税を徴収されることとなる者は、同条第七項の納税通知書の交付を受けた日から三十日以内に市町村長に同条第五項の規定によつて徴収される固定資産税額の修正を申し出ることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 364_2, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d9a7640f71c5f301296f038308f9fa398d6628f5ef2fcd0cc6e5a9b51d305eaf.
原文逐語: 「前条第五項の固定資産に係る当該年度分の固定資産税額が仮算定税額の二分の一に相当する額に満たないこととなると認められる場合においては、同項の規定によつて当該固定資産に係る固定資産税を徴収されることとなる者は、同条第七項の納税通知書の交付を受けた日から三十日以内に市町村長に同条第五項の規定によつて徴収される固定資産税額の修正を申し出ることができる。」
Scope: ONLY the 三十日以内 (days <= 30) INCLUSIVE deadline for applying for correction of the provisionally assessed fixed-asset tax after the notice of assessment. 仮算定税額の二分の一, the written-application form, 市町村長の決定期限 (第三項) and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax364_2CorrectionWithin30Days

open JapanTaxLaw.TaxFinance

/-- 「三十日以内」 — statutory threshold literal 30; INCLUSIVE boundary. -/
def inScope (days : Nat) : Prop := days <= 30

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days <= 30)

end JapanTaxLaw.LocalTax364_2CorrectionWithin30Days
