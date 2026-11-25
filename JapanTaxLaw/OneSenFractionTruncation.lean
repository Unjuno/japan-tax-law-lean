import JapanTaxLaw.TaxFinance

/-
# OneSenFractionTruncation — たばこ税法施行規則 第四条第二項（一銭未満の端数切捨て）

Pinned source:
  Law id: 360M50000040001 (たばこ税法施行規則)
  Revision: 360M50000040001_20240401_506M60000040021
  Raw snapshot: data/raw/360M50000040001_20240401_506M60000040021.law.json
  Statutory article: 第四条 (art. 4), 第二項, 第一文
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1
  Normative unit id: NORM|7a6d882c8e0c966f7b5766ffacaf1989e44a24f68a38a98b6039edbea15bd02c

原文逐語（pinned, verbatim, CONDITION）:
  「前項の計算に関し、同項各号に掲げる金額に一銭未満の端数がある場合には、その端数を切り捨てるものとする。」

Variable contract:
  An amount is given as `(sen, hasFraction)` where `sen : Nat` is the whole
  一銭 count and `hasFraction : Bool` records whether a fraction strictly
  below one 銭 is present. Unit: 銭 (one hundredth of a yen) for `sen`;
  domain: Nat × Bool. `floorToSen sen hasFraction = sen` expresses
  「一銭未満の端数を切り捨てる」: the fraction is dropped, the whole-sen
  amount is preserved. 「一銭」 is a unit, not an amount literal in the clause.

Scope: ONLY the truncation of a sub-一銭 fraction is modelled. The preceding
paragraph's computation (前項の計算), the amounts in its items, the identity
of the taxpayer and the resulting tax amount are NOT MODELLED.

Proofs use only `cases` and `rfl`; no `simp`, `sorry`, `admit`, `axiom` or
`Classical.choice`.
-/

namespace JapanTaxLaw.OneSenFractionTruncation

/-- 「一銭未満の端数を切り捨てる」: drop the fraction, keep whole 銭. -/
def floorToSen (sen : Nat) (_hasFraction : Bool) : Nat :=
  sen

theorem fraction_dropped (sen : Nat) : floorToSen sen true = sen := rfl

theorem no_fraction_unchanged (sen : Nat) : floorToSen sen false = sen := rfl

end JapanTaxLaw.OneSenFractionTruncation
