import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt15PriorUseException — 関税定率法 art.15(1)(9) (入国前一年以上使用前例)

Pinned source:
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Enforcement: 2026-06-01

Normative unit: NORM|dc53fcddca38961e0306ab237c7d7cea636e1ba936284d7fc2a52df7b57d38b4
Source path: LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#9/ItemSentence/Sentence#2
Verbatim unit: 「ただし、その入国前にこれらの者が既に使用したもの（船舶及び航空機については、その入国前一年以上これらの者が使用したもの）に限る。」

Reading (verbatim): the exception is limited to goods already used before
entry; for ships and aircraft (船舶及び航空機), the prior use must be at least
one year (一年以上). `months` is caller-established prior-use months;
`vesselOrAircraft` distinguishes the stricter branch.

Scope: only this prior-use exception predicate and its one-year boundary for
ships/aircraft. The exemption's main rule, the persons referred to by
「これらの者」, the other items and all other paragraphs are NOT MODELLED. One
computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CustomsTariffArt15PriorUseException

/-- 「一年」 in months (unit: months; domain: Nat). -/
def oneYearMonths : Nat := 12

/-- 入国前一年以上 / 既に使用したもの, by goods category. -/
def inPriorUseException (vesselOrAircraft : Bool) (months : Nat) : Bool :=
  if vesselOrAircraft then months >= oneYearMonths else months > 0

example : oneYearMonths = 12 := by decide
example : inPriorUseException false 0 = false := by decide
example : inPriorUseException false 1 = true := by decide
example : inPriorUseException true 11 = false := by decide
example : inPriorUseException true 12 = true := by decide
example : inPriorUseException true 24 = true := by decide

end JapanTaxLaw.CustomsTariffArt15PriorUseException
