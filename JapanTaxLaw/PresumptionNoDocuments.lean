import JapanTaxLaw.TaxFinance

/-!
# PresumptionNoDocuments — 租税特別措置法 art. 40の4(3) 推定

Pinned source: law 332AC0000000026, revision
`332AC0000000026_20261101_507AC0000000013`, snapshot
`data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.

Normative unit: `NORM|aa4f3f14e89453a655123308fabc4e12a2dc360836eecd7bfb35ff829538c7ce`
Verbatim: 「当該書類その他の資料の提示又は提出がないときは、…当該外国関係会社は
同号イ（１）から（５）までに該当しないものと推定する。」

Scope: only the presumption triggered by absence of documents. Whether
documents were submitted is caller-established (`Bool`); the enumerated
categories (１)–(５) and the evidentiary weight of the presumption are separate
matters and are not modelled here.
-/
namespace JapanTaxLaw.PresumptionNoDocuments

/-- When documents are absent, the company is presumed NOT to fall in the
    listed categories. The argument is caller-established. -/
def presumeNotApplicable (documentsSubmitted : Bool) : Bool :=
  !documentsSubmitted

theorem presume_when_absent : presumeNotApplicable false = true := by rfl
theorem no_presumption_when_present : presumeNotApplicable true = false := by rfl

end JapanTaxLaw.PresumptionNoDocuments
