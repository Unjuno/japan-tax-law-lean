import JapanTaxLaw.TaxFinance

/-
# LocalTax84GolfTicketReturnWithin10Days — pinned clause 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 84, paragraph 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|534bd4b572f7d360697e535aed1d75e99908ce40d2fa2981e8ec148a799540bf.
原文逐語: 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」
Scope: ONLY the 消滅した日から十日以内 (days <= 10) INCLUSIVE upper bound for returning the 証票. 第二項の証票交付手続・特別徴収の義務の発生・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE upper bound. -/
def threshold : Nat := 10

/-- 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」. -/
def inScope (days : Nat) : Prop := days <= threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days <= 10)

end JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days
