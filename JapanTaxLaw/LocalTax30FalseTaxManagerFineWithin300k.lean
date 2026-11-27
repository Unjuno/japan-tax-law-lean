import JapanTaxLaw.TaxFinance

/-
# LocalTax30FalseTaxManagerFineWithin300k — pinned clause 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 30, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|78c4b66be4df3492b588b23896bb80a6c620035b38cf0677804af0bc7f039118.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:30/Article#30/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」
Scope: ONLY the 三十万円以下の罰金 (yen <= 300000) INCLUSIVE ceiling for the 前条第一項の納税管理人についての虚偽の申告・不正手段による承認又は認定. 納税管理人の申告・承認・認定の要件・違反行為の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (300000), INCLUSIVE ceiling. -/
def threshold : Nat := 300000

/-- 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」. -/
def inScope (yen : Nat) : Prop := yen ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (yen ≤ 300000)

end JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k
