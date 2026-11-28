import JapanTaxLaw.TaxFinance

/-
# LocalTax768CommitteeAtLeast6Members — pinned clause 「委員の定数は、六人以上十二人以内において定款で定める。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 768, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c08eaca308e4a6bc684cb992e213f837e3ac79e747cb0cfe364582935d683f48.
原文逐語: 「委員の定数は、六人以上十二人以内において定款で定める。」
Scope: ONLY the 委員の定数は六人以上 (members >= 6) INCLUSIVE floor. 十二人以内の上限・定款で定める手続・他の委員会規定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax768CommitteeAtLeast6Members

open JapanTaxLaw.TaxFinance

/-- 「委員の定数は、六人以上十二人以内において定款で定める。」 — statutory threshold literal (6); INCLUSIVE boundary. -/
def inScope (members : Nat) : Prop := members >= 6

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (members : Nat) : Bool := decide (members >= 6)

end JapanTaxLaw.LocalTax768CommitteeAtLeast6Members
