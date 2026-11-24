import JapanTaxLaw.TaxFinance

/-!
# DeemingProvisionalDuty — 関税定率法 art. 8(3) みなし納付

Pinned source: law 143AC0000000054, revision
`143AC0000000054_20260601_508AC0000000005`, snapshot
`data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.

Normative unit: `NORM|b3959ec60d94050465584c3e696d6cbdb3df0635bd90da1dfd2c238b7f7e4207`
Verbatim: 「この場合において、当該貨物につき第九項第一号の規定により課された
暫定的な関税が納付されているときは、当該不当廉売関税が納付されたものと
みなす。」

The modelled norm is the deeming: when the provisional duty has been paid,
the antidumping duty is deemed paid. The fact of provisional payment is
caller-established (`Bool`); the amount, the goods and the cross-reference to
第九項第一号 are separate units and are not modelled here.
-/
namespace JapanTaxLaw.DeemingProvisionalDuty

/-- The deeming relation: provisional payment implies deemed final payment. -/
def deemPaid (provisionalDutyPaid : Bool) : Bool :=
  provisionalDutyPaid

theorem deem_when_paid : deemPaid true = true := by rfl
theorem no_deem_when_unpaid : deemPaid false = false := by rfl

end JapanTaxLaw.DeemingProvisionalDuty
