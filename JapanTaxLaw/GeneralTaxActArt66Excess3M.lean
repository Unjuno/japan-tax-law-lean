import JapanTaxLaw.TaxFinance

/-!
# GeneralTaxActArt66Excess3M — 国税通則法 art.66(3)(3) (三百万円を超える部分に相当する税額)

Pinned source:
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Enforcement: 2026-11-01

Normative unit: NORM|245fbea3a32526db3e7a4a4c2a1bc7a366f7f8e94fce22b0d9e53dbd579d1173
Source path: LawBody[2]/MainProvision/MainProvision[5]/Article:66/Article#66/Paragraph#3/Item#3/ItemSentence/Column#1/Sentence#1
Verbatim unit: 「三百万円を超える部分に相当する税額」

Reading (verbatim): 三百万 = 3,000,000 yen. Money = Nat, unit = yen,
domain = non-negative integers. `amount` is caller-established.
「を超える部分」 = the strict excess over ¥3,000,000 (zero when
amount <= 3,000,000).

Scope: only the strict excess portion in yen. The rate/conversion from the
excess portion to the final 税額, other items, the cap and other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.GeneralTaxActArt66Excess3M

open JapanTaxLaw.TaxFinance

/-- art.66(3)(3): 「三百万」. Unit: yen; domain: Nat. -/
def threshold : Money := 3_000_000

/-- Strict excess: 「三百万円を超える部分」 (zero at and below the threshold). -/
def excessPortion (amount : Money) : Money :=
  if amount > threshold then amount - threshold else 0

example : threshold = 3_000_000 := by decide
example : excessPortion 0 = 0 := by decide
example : excessPortion 2_999_999 = 0 := by decide
example : excessPortion 3_000_000 = 0 := by decide
example : excessPortion 3_000_001 = 1 := by decide
example : excessPortion 5_000_000 = 2_000_000 := by decide

end JapanTaxLaw.GeneralTaxActArt66Excess3M
