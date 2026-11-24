import JapanTaxLaw.TaxFinance

/-!
# PenaltyCap300k — 地方税法 art. 30 罰金上限 三十万円

Pinned source: law 325AC0000000226, revision
`325AC0000000226_20261101_508AC0000000002`, snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.

Normative unit: `NORM|78c4b66be4df3492b588b23896bb80a6c620035b38cf0677804af0bc7f039118`
Verbatim: 「…その違反行為をした者は、三十万円以下の罰金に処する。」

Scope: only the upper bound 「三十万円以下」 on the fine. Whether the violation
(虚偽の申告 etc.) occurred is caller-established and is not modelled; the
cross-reference to 前条第一項 and the fine amount itself are separate matters.
The cap is inclusive and in yen (Nat).
-/
namespace JapanTaxLaw.PenaltyCap300k

/-- 三十万円, in yen. -/
def capYen : Nat := 300_000

/-- True iff a fine amount is within the statutory inclusive cap. -/
def withinCap (fineYen : Nat) : Bool :=
  decide (fineYen <= capYen)

theorem below_cap : withinCap 299_999 = true := by decide
theorem at_cap : withinCap 300_000 = true := by decide
theorem above_cap : withinCap 300_001 = false := by decide

end JapanTaxLaw.PenaltyCap300k
